import Foundation
import CloudKit

class CloudKitManager {
    static let shared = CloudKitManager()
    
    let container: CKContainer
    let privateDatabase: CKDatabase
    
    init() {
        container = CKContainer(identifier: "iCloud.OJ.BrameCalc")
        privateDatabase = container.privateCloudDatabase
    }
    
    func fetchProjects(completion: @escaping (Result<[Project], Error>) -> Void) {
        let query = CKQuery(recordType: "Project", predicate: NSPredicate(value: true))
        privateDatabase.perform(query, inZoneWith: nil) { records, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let records = records else {
                completion(.success([]))
                return
            }
            let projects = records.compactMap { Project(record: $0) }
            completion(.success(projects))
        }
    }
    
    func saveProject(_ project: Project, completion: @escaping (Result<Project, Error>) -> Void) {
        print("Début de la sauvegarde du projet \(project.name)")
        
        let record = project.toCKRecord()
        print("CKRecord créé: \(record)")
        
        let modifyOperation = CKModifyRecordsOperation(recordsToSave: [record], recordIDsToDelete: nil)
        modifyOperation.savePolicy = .allKeys
        
        modifyOperation.modifyRecordsCompletionBlock = { savedRecords, deletedRecordIDs, error in
            if let error = error as? CKError {
                if error.code == .serverRecordChanged {
                    // Handle the conflict by using the server record and retrying the save
                    if let serverRecord = error.userInfo[CKRecordChangedErrorServerRecordKey] as? CKRecord {
                        self.resolveConflict(serverRecord, with: project, completion: completion)
                    } else {
                        completion(.failure(error))
                    }
                } else {
                    completion(.failure(error))
                }
                return
            }
            guard let record = savedRecords?.first, let savedProject = Project(record: record) else {
                print("Erreur: enregistrement non trouvé ou initialisation du projet échouée.")
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Record not found or failed to initialize Project"])))
                return
            }
            print("Projet sauvegardé avec succès: \(savedProject)")
            completion(.success(savedProject))
        }
        privateDatabase.add(modifyOperation)
    }
    
    private func resolveConflict(_ serverRecord: CKRecord, with project: Project, completion: @escaping (Result<Project, Error>) -> Void) {
        // Update the local record with the server record's metadata
        let updatedRecord = project.toCKRecord()
        
        // Retry saving with the server record's metadata
        let modifyOperation = CKModifyRecordsOperation(recordsToSave: [serverRecord], recordIDsToDelete: nil)
        modifyOperation.savePolicy = .ifServerRecordUnchanged
        modifyOperation.modifyRecordsCompletionBlock = { savedRecords, deletedRecordIDs, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let savedRecord = savedRecords?.first else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Record not found"])))
                return
            }
            completion(.success(Project(record: savedRecord)!))
        }
        privateDatabase.add(modifyOperation)
    }
    
    func deleteProject(_ project: Project, completion: @escaping (Result<Void, Error>) -> Void) {
        let recordID = CKRecord.ID(recordName: project.id.uuidString)
        privateDatabase.delete(withRecordID: recordID) { recordID, error in
            if let error = error {
                print("Error deleting project: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            print("Project deleted: \(recordID?.recordName ?? "")")
            completion(.success(()))
        }
    }
}
