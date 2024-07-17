import Foundation
import CloudKit

class Project: ObservableObject, Identifiable, Codable {
    let id: UUID
    @Published var name: String
    @Published var description: String
    @Published var agencyName: String
    @Published var agencyContact: String
    @Published var agencyMail: String
    @Published var agencyPhone: String
    @Published var eventDate: Date
    @Published var eventLocation: String
    @Published var tentType: String
    @Published var tentDimensions: String
    @Published var tentHeight: String
    @Published var tentCover: String
    @Published var tentHeating: String
    @Published var tentAC: String
    @Published var tentFlooring: String
    @Published var tentAccessories: String
    @Published var powerSource: String
    @Published var powerRequirement: String
    @Published var outletCount: String
    @Published var cableType: String
    @Published var connectionType: String
    @Published var circuitBreakers: String
    @Published var surgeProtection: String
    @Published var groundingDetails: String
    @Published var soundSystemType: String
    @Published var speakerCount: String
    @Published var soundCoverArea: String
    @Published var lightingType: String
    @Published var lightingCount: String
    @Published var lightingPower: String
    @Published var screenType: String
    @Published var screenDimensions: String
    @Published var videoResolution: String
    @Published var videoCaptation: String
    @Published var videoProduction: String
    @Published var videoStreaming: String
    @Published var videoMultiplex: String
    @Published var theme: String
    @Published var style: String
    @Published var flowerDetails: String
    @Published var furnitureDetails: String
    @Published var decorativeElements: String
    @Published var photoURLs: [URL]
    @Published var tasks: [String]
    
    init(id: UUID = UUID(), name: String = "", description: String = "", agencyName: String = "", agencyContact: String = "", agencyMail: String = "", agencyPhone: String = "", eventDate: Date = Date(), eventLocation: String = "", tentType: String = "", tentDimensions: String = "", tentHeight: String = "", tentCover: String = "", tentHeating: String = "", tentAC: String = "", tentFlooring: String = "", tentAccessories: String = "", powerSource: String = "", powerRequirement: String = "", outletCount: String = "", cableType: String = "", connectionType: String = "", circuitBreakers: String = "", surgeProtection: String = "", groundingDetails: String = "", soundSystemType: String = "", speakerCount: String = "", soundCoverArea: String = "", lightingType: String = "", lightingCount: String = "", lightingPower: String = "", screenType: String = "", screenDimensions: String = "", videoResolution: String = "", videoCaptation: String = "", videoProduction: String = "", videoStreaming: String = "", videoMultiplex: String = "", theme: String = "", style: String = "", flowerDetails: String = "", furnitureDetails: String = "", decorativeElements: String = "", photoURLs: [URL] = [], tasks: [String] = []) {
        self.id = id
        self.name = name
        self.description = description
        self.agencyName = agencyName
        self.agencyContact = agencyContact
        self.agencyMail = agencyMail
        self.agencyPhone = agencyPhone
        self.eventDate = eventDate
        self.eventLocation = eventLocation
        self.tentType = tentType
        self.tentDimensions = tentDimensions
        self.tentHeight = tentHeight
        self.tentCover = tentCover
        self.tentHeating = tentHeating
        self.tentAC = tentAC
        self.tentFlooring = tentFlooring
        self.tentAccessories = tentAccessories
        self.powerSource = powerSource
        self.powerRequirement = powerRequirement
        self.outletCount = outletCount
        self.cableType = cableType
        self.connectionType = connectionType
        self.circuitBreakers = circuitBreakers
        self.surgeProtection = surgeProtection
        self.groundingDetails = groundingDetails
        self.soundSystemType = soundSystemType
        self.speakerCount = speakerCount
        self.soundCoverArea = soundCoverArea
        self.lightingType = lightingType
        self.lightingCount = lightingCount
        self.lightingPower = lightingPower
        self.screenType = screenType
        self.screenDimensions = screenDimensions
        self.videoResolution = videoResolution
        self.videoCaptation = videoCaptation
        self.videoProduction = videoProduction
        self.videoStreaming = videoStreaming
        self.videoMultiplex = videoMultiplex
        self.theme = theme
        self.style = style
        self.flowerDetails = flowerDetails
        self.furnitureDetails = furnitureDetails
        self.decorativeElements = decorativeElements
        self.photoURLs = photoURLs
        self.tasks = tasks
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, agencyName, agencyContact, agencyMail, agencyPhone, eventDate, eventLocation, tentType, tentDimensions, tentHeight, tentCover, tentHeating, tentAC, tentFlooring, tentAccessories, powerSource, powerRequirement, outletCount, cableType, connectionType, circuitBreakers, surgeProtection, groundingDetails, soundSystemType, speakerCount, soundCoverArea, lightingType, lightingCount, lightingPower, screenType, screenDimensions, videoResolution, videoCaptation, videoProduction, videoStreaming, videoMultiplex, theme, style, flowerDetails, furnitureDetails, decorativeElements, photoURLs, tasks
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
        agencyName = try container.decode(String.self, forKey: .agencyName)
        agencyContact = try container.decode(String.self, forKey: .agencyContact)
        agencyMail = try container.decode(String.self, forKey: .agencyMail)
        agencyPhone = try container.decode(String.self, forKey: .agencyPhone)
        eventDate = try container.decode(Date.self, forKey: .eventDate)
        eventLocation = try container.decode(String.self, forKey: .eventLocation)
        tentType = try container.decode(String.self, forKey: .tentType)
        tentDimensions = try container.decode(String.self, forKey: .tentDimensions)
        tentHeight = try container.decode(String.self, forKey: .tentHeight)
        tentCover = try container.decode(String.self, forKey: .tentCover)
        tentHeating = try container.decode(String.self, forKey: .tentHeating)
        tentAC = try container.decode(String.self, forKey: .tentAC)
        tentFlooring = try container.decode(String.self, forKey: .tentFlooring)
        tentAccessories = try container.decode(String.self, forKey: .tentAccessories)
        powerSource = try container.decode(String.self, forKey: .powerSource)
        powerRequirement = try container.decode(String.self, forKey: .powerRequirement)
        outletCount = try container.decode(String.self, forKey: .outletCount)
        cableType = try container.decode(String.self, forKey: .cableType)
        connectionType = try container.decode(String.self, forKey: .connectionType)
        circuitBreakers = try container.decode(String.self, forKey: .circuitBreakers)
        surgeProtection = try container.decode(String.self, forKey: .surgeProtection)
        groundingDetails = try container.decode(String.self, forKey: .groundingDetails)
        soundSystemType = try container.decode(String.self, forKey: .soundSystemType)
        speakerCount = try container.decode(String.self, forKey: .speakerCount)
        soundCoverArea = try container.decode(String.self, forKey: .soundCoverArea)
        lightingType = try container.decode(String.self, forKey: .lightingType)
        lightingCount = try container.decode(String.self, forKey: .lightingCount)
        lightingPower = try container.decode(String.self, forKey: .lightingPower)
        screenType = try container.decode(String.self, forKey: .screenType)
        screenDimensions = try container.decode(String.self, forKey: .screenDimensions)
        videoResolution = try container.decode(String.self, forKey: .videoResolution)
        videoCaptation = try container.decode(String.self, forKey: .videoCaptation)
        videoProduction = try container.decode(String.self, forKey: .videoProduction)
        videoStreaming = try container.decode(String.self, forKey: .videoStreaming)
        videoMultiplex = try container.decode(String.self, forKey: .videoMultiplex)
        theme = try container.decode(String.self, forKey: .theme)
        style = try container.decode(String.self, forKey: .style)
        flowerDetails = try container.decode(String.self, forKey: .flowerDetails)
        furnitureDetails = try container.decode(String.self, forKey: .furnitureDetails)
        decorativeElements = try container.decode(String.self, forKey: .decorativeElements)
        photoURLs = try container.decode([URL].self, forKey: .photoURLs)
        tasks = try container.decode([String].self, forKey: .tasks)
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        try container.encode(agencyName, forKey: .agencyName)
        try container.encode(agencyContact, forKey: .agencyContact)
        try container.encode(agencyMail, forKey: .agencyMail)
        try container.encode(agencyPhone, forKey: .agencyPhone)
        try container.encode(eventDate, forKey: .eventDate)
        try container.encode(eventLocation, forKey: .eventLocation)
        try container.encode(tentType, forKey: .tentType)
        try container.encode(tentDimensions, forKey: .tentDimensions)
        try container.encode(tentHeight, forKey: .tentHeight)
        try container.encode(tentCover, forKey: .tentCover)
        try container.encode(tentHeating, forKey: .tentHeating)
        try container.encode(tentAC, forKey: .tentAC)
        try container.encode(tentFlooring, forKey: .tentFlooring)
        try container.encode(tentAccessories, forKey: .tentAccessories)
        try container.encode(powerSource, forKey: .powerSource)
        try container.encode(powerRequirement, forKey: .powerRequirement)
        try container.encode(outletCount, forKey: .outletCount)
        try container.encode(cableType, forKey: .cableType)
        try container.encode(connectionType, forKey: .connectionType)
        try container.encode(circuitBreakers, forKey: .circuitBreakers)
        try container.encode(surgeProtection, forKey: .surgeProtection)
        try container.encode(groundingDetails, forKey: .groundingDetails)
        try container.encode(soundSystemType, forKey: .soundSystemType)
        try container.encode(speakerCount, forKey: .speakerCount)
        try container.encode(soundCoverArea, forKey: .soundCoverArea)
        try container.encode(lightingType, forKey: .lightingType)
        try container.encode(lightingCount, forKey: .lightingCount)
        try container.encode(lightingPower, forKey: .lightingPower)
        try container.encode(screenType, forKey: .screenType)
        try container.encode(screenDimensions, forKey: .screenDimensions)
        try container.encode(videoResolution, forKey: .videoResolution)
        try container.encode(videoCaptation, forKey: .videoCaptation)
        try container.encode(videoProduction, forKey: .videoProduction)
        try container.encode(videoStreaming, forKey: .videoStreaming)
        try container.encode(videoMultiplex, forKey: .videoMultiplex)
        try container.encode(theme, forKey: .theme)
        try container.encode(style, forKey: .style)
        try container.encode(flowerDetails, forKey: .flowerDetails)
        try container.encode(furnitureDetails, forKey: .furnitureDetails)
        try container.encode(decorativeElements, forKey: .decorativeElements)
        //        try container.encode(photoURLs, forKey: .photoURLs)
        try container.encode(tasks, forKey: .tasks)
    }
    convenience init?(record: CKRecord) {
        guard
            let name = record["name"] as? String,
            let description = record["description"] as? String,
            let agencyName = record["agencyName"] as? String,
            let agencyContact = record["agencyContact"] as? String,
            let agencyMail = record["agencyMail"] as? String,
            let agencyPhone = record["agencyPhone"] as? String,
            let eventDate = record["eventDate"] as? Date,
            let eventLocation = record["eventLocation"] as? String,
            let tentType = record["tentType"] as? String,
            let tentDimensions = record["tentDimensions"] as? String,
            let tentHeight = record["tentHeight"] as? String,
            let tentCover = record["tentCover"] as? String,
            let tentHeating = record["tentHeating"] as? String,
            let tentAC = record["tentAC"] as? String,
            let tentFlooring = record["tentFlooring"] as? String,
            let tentAccessories = record["tentAccessories"] as? String,
            let powerSource = record["powerSource"] as? String,
            let powerRequirement = record["powerRequirement"] as? String,
            let outletCount = record["outletCount"] as? String,
            let cableType = record["cableType"] as? String,
            let connectionType = record["connectionType"] as? String,
            let circuitBreakers = record["circuitBreakers"] as? String,
            let surgeProtection = record["surgeProtection"] as? String,
            let groundingDetails = record["groundingDetails"] as? String,
            let soundSystemType = record["soundSystemType"] as? String,
            let speakerCount = record["speakerCount"] as? String,
            let soundCoverArea = record["soundCoverArea"] as? String,
            let lightingType = record["lightingType"] as? String,
            let lightingCount = record["lightingCount"] as? String,
            let lightingPower = record["lightingPower"] as? String,
            let screenType = record["screenType"] as? String,
            let screenDimensions = record["screenDimensions"] as? String,
            let videoResolution = record["videoResolution"] as? String,
            let videoCaptation = record["videoCaptation"] as? String,
            let videoProduction = record["videoProduction"] as? String,
            let videoStreaming = record["videoStreaming"] as? String,
            let videoMultiplex = record["videoMultiplex"] as? String,
            let theme = record["theme"] as? String,
            let style = record["style"] as? String,
            let flowerDetails = record["flowerDetails"] as? String,
            let furnitureDetails = record["furnitureDetails"] as? String,
            let decorativeElements = record["decorativeElements"] as? String,
            let tasks = record["tasks"] as? [String],
            let photoAssets = record["photoURLs"] as? [CKAsset]
        else {
            print("Failed to initialize Project from CKRecord")
            return nil
        }
        
        let photoURLs = photoAssets.compactMap { $0.fileURL }
        
        
        self.init(
            id: UUID(uuidString: record.recordID.recordName) ?? UUID(),
            name: name,
            description: description,
            agencyName: agencyName,
            agencyContact: agencyContact,
            agencyMail: agencyMail,
            agencyPhone: agencyPhone,
            eventDate: eventDate,
            eventLocation: eventLocation,
            tentType: tentType,
            tentDimensions: tentDimensions,
            tentHeight: tentHeight,
            tentCover: tentCover,
            tentHeating: tentHeating,
            tentAC: tentAC,
            tentFlooring: tentFlooring,
            tentAccessories: tentAccessories,
            powerSource: powerSource,
            powerRequirement: powerRequirement,
            outletCount: outletCount,
            cableType: cableType,
            connectionType: connectionType,
            circuitBreakers: circuitBreakers,
            surgeProtection: surgeProtection,
            groundingDetails: groundingDetails,
            soundSystemType: soundSystemType,
            speakerCount: speakerCount,
            soundCoverArea: soundCoverArea,
            lightingType: lightingType,
            lightingCount: lightingCount,
            lightingPower: lightingPower,
            screenType: screenType,
            screenDimensions: screenDimensions,
            videoResolution: videoResolution,
            videoCaptation: videoCaptation,
            videoProduction: videoProduction,
            videoStreaming: videoStreaming,
            videoMultiplex: videoMultiplex,
            theme: theme,
            style: style,
            flowerDetails: flowerDetails,
            furnitureDetails: furnitureDetails,
            decorativeElements: decorativeElements,
            photoURLs: photoURLs,
            tasks: tasks
        )
        print("Initialized Project with photo URLs: \(photoURLs)")
        
    }
    
    
    func toCKRecord() -> CKRecord {
        let recordID = CKRecord.ID(recordName: id.uuidString)
        let record = CKRecord(recordType: "Project", recordID: recordID)
        
        record["name"] = name as CKRecordValue
        record["description"] = description as CKRecordValue
        record["agencyName"] = agencyName as CKRecordValue
        record["agencyContact"] = agencyContact as CKRecordValue
        record["agencyMail"] = agencyMail as CKRecordValue
        record["agencyPhone"] = agencyPhone as CKRecordValue
        record["eventDate"] = eventDate as CKRecordValue
        record["eventLocation"] = eventLocation as CKRecordValue
        record["tentType"] = tentType as CKRecordValue
        record["tentDimensions"] = tentDimensions as CKRecordValue
        record["tentHeight"] = tentHeight as CKRecordValue
        record["tentCover"] = tentCover as CKRecordValue
        record["tentHeating"] = tentHeating as CKRecordValue
        record["tentAC"] = tentAC as CKRecordValue
        record["tentFlooring"] = tentFlooring as CKRecordValue
        record["tentAccessories"] = tentAccessories as CKRecordValue
        record["powerSource"] = powerSource as CKRecordValue
        record["powerRequirement"] = powerRequirement as CKRecordValue
        record["outletCount"] = outletCount as CKRecordValue
        record["cableType"] = cableType as CKRecordValue
        record["connectionType"] = connectionType as CKRecordValue
        record["circuitBreakers"] = circuitBreakers as CKRecordValue
        record["surgeProtection"] = surgeProtection as CKRecordValue
        record["groundingDetails"] = groundingDetails as CKRecordValue
        record["soundSystemType"] = soundSystemType as CKRecordValue
        record["speakerCount"] = speakerCount as CKRecordValue
        record["soundCoverArea"] = soundCoverArea as CKRecordValue
        record["lightingType"] = lightingType as CKRecordValue
        record["lightingCount"] = lightingCount as CKRecordValue
        record["lightingPower"] = lightingPower as CKRecordValue
        record["screenType"] = screenType as CKRecordValue
        record["screenDimensions"] = screenDimensions as CKRecordValue
        record["videoResolution"] = videoResolution as CKRecordValue
        record["videoCaptation"] = videoCaptation as CKRecordValue
        record["videoProduction"] = videoProduction as CKRecordValue
        record["videoStreaming"] = videoStreaming as CKRecordValue
        record["videoMultiplex"] = videoMultiplex as CKRecordValue
        record["theme"] = theme as CKRecordValue
        record["style"] = style as CKRecordValue
        record["flowerDetails"] = flowerDetails as CKRecordValue
        record["furnitureDetails"] = furnitureDetails as CKRecordValue
        record["decorativeElements"] = decorativeElements as CKRecordValue
        
        //            let photoAssets = photoURLs.map { CKAsset(fileURL: $0) }
        //            record["photoURLs"] = photoAssets as CKRecordValue
        //
        let taskList = tasks as [CKRecordValue]
        record["tasks"] = taskList as CKRecordValue
        
        let photoAssets = photoURLs.map { CKAsset(fileURL: $0) }
        record["photoURLs"] = photoAssets as CKRecordValue
        
        print("Record Keys: \(record.allKeys())")
        print("Record Values: \(record.dictionaryWithValues(forKeys: record.allKeys()))")
        
        return record
    }
}
