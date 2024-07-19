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
    @Published var stageStruct: String
    
    @Published var tentDimensions: String
    @Published var tentHeight: String
    @Published var tentCover: String
    @Published var tentHeating: String
    @Published var tentAC: String
    @Published var tentFlooring: String
    @Published var tentAccessories: String
    @Published var tentLest: String
    
    @Published var powerSource: String
    @Published var powerRequirement: String
    @Published var outletCount: String
    @Published var cableType: String
    @Published var connectionType: String
    @Published var circuitBreakers: String
    @Published var surgeProtection: String
    @Published var groundingDetails: String
    @Published var cableWay: String
    @Published var electroContact: String
    
    @Published var soundSystemType: String
    @Published var speakerCount: String
    @Published var soundCoverArea: String
    @Published var soundExpectedAudience: String
    @Published var soundSpaceContraint: String
    @Published var maxLoad: String
    @Published var soundRig: String
    
    @Published var lightingType: String
    @Published var lightingCount: String
    @Published var lightingPower: String
    @Published var lightingSubnject: String
    @Published var lightSpaceContraint: String
    @Published var lightRig: String
    
    @Published var videoType: String
    @Published var videoRig: String
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
    @Published var stageDress: String
    @Published var ctsDress: String
    @Published var cabinDress: String
    
    @Published var projectManager: String
    @Published var salesManager: String
    @Published var siteManager: String
    @Published var technicians: String
    
    // New properties for team details
    @Published var brameDirTech: String
    @Published var brameProjectManager: String
    @Published var brameSalesManager: String
    @Published var brameSiteManager: String
    @Published var brameSechnicians: String
    @Published var brameRoad: String
    
    @Published var localDirTech: String
    @Published var localProjectManager: String
    @Published var localSalesManager: String
    @Published var localSiteManager: String
    @Published var localTechnicians: String
    @Published var localRoad: String
    
    @Published var photoURLs: [URL]
    @Published var tasks: [String]
    @Published var setupDate: Date
    @Published var operationStartDate: Date
    @Published var operationEndDate: Date
    @Published var teardownDate: Date
    
    init(id: UUID = UUID(), name: String = "", description: String = "", agencyName: String = "", agencyContact: String = "", agencyMail: String = "", agencyPhone: String = "", eventDate: Date = Date(), eventLocation: String = "", tentType: String = "", tentDimensions: String = "", tentHeight: String = "", tentCover: String = "", tentHeating: String = "", tentAC: String = "", tentFlooring: String = "", tentAccessories: String = "", tentLest: String = "", stageStruct: String = "", powerSource: String = "", powerRequirement: String = "", outletCount: String = "", cableType: String = "", connectionType: String = "", circuitBreakers: String = "", surgeProtection: String = "", groundingDetails: String = "", cableWay: String = "", electroContact: String = "", soundSystemType: String = "", speakerCount: String = "", soundCoverArea: String = "", soundExpectedAudience: String = "", soundSpaceContraint: String = "", maxLoad: String = "", soundRig: String = "", lightingType: String = "", lightingCount: String = "", lightingPower: String = "", lightingSubnject: String = "", lightSpaceContraint: String = "", lightRig: String = "", videoType: String = "", videoRig: String = "", screenType: String = "", screenDimensions: String = "", videoResolution: String = "", videoCaptation: String = "", videoProduction: String = "", videoStreaming: String = "", videoMultiplex: String = "", theme: String = "", style: String = "", flowerDetails: String = "", furnitureDetails: String = "", decorativeElements: String = "", stageDress: String = "", ctsDress: String = "", cabinDress: String = "", projectManager: String = "", salesManager: String = "", siteManager: String = "", technicians: String = "", photoURLs: [URL] = [], tasks: [String] = [], setupDate: Date = Date(), operationStartDate: Date = Date(), operationEndDate: Date = Date(), teardownDate: Date = Date(), brameDirTech: String = "", brameProjectManager: String = "", brameSalesManager: String = "", brameSiteManager: String = "", brameSechnicians: String = "", brameRoad: String = "", localDirTech: String = "", localProjectManager: String = "", localSalesManager: String = "", localSiteManager: String = "", localTechnicians: String = "", localRoad: String = "") {
        
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
        self.tentLest = tentLest
        self.stageStruct = stageStruct
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
        self.cableWay = cableWay
        self.electroContact = electroContact
        
        self.speakerCount = speakerCount
        self.soundCoverArea = soundCoverArea
        self.soundExpectedAudience = soundExpectedAudience
        self.soundSpaceContraint = soundSpaceContraint
        self.maxLoad = maxLoad
        self.soundRig = soundRig
        
        self.lightingType = lightingType
        self.lightingCount = lightingCount
        self.lightingPower = lightingPower
        self.lightingSubnject = lightingSubnject
        self.lightSpaceContraint = lightSpaceContraint
        self.lightRig = lightRig
        
        self.videoType = videoType
        self.videoRig = videoRig
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
        self.stageDress = stageDress
        self.ctsDress = ctsDress
        self.cabinDress = cabinDress
        
        self.projectManager = projectManager
        self.salesManager = salesManager
        self.siteManager = siteManager
        self.technicians = technicians
        self.photoURLs = photoURLs
        self.tasks = tasks
        self.setupDate = setupDate
        self.operationStartDate = operationStartDate
        self.operationEndDate = operationEndDate
        self.teardownDate = teardownDate
        
        self.brameDirTech = brameDirTech
        self.brameProjectManager = brameProjectManager
        self.brameSalesManager = brameSalesManager
        self.brameSiteManager = brameSiteManager
        self.brameSechnicians = brameSechnicians
        self.brameRoad = brameRoad
        self.localDirTech = localDirTech
        self.localProjectManager = localProjectManager
        self.localSalesManager = localSalesManager
        self.localSiteManager = localSiteManager
        self.localTechnicians = localTechnicians
        self.localRoad = localRoad
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, agencyName, agencyContact, agencyMail, agencyPhone, eventDate, eventLocation, tentType, tentDimensions, tentHeight, tentCover, tentHeating, tentAC, tentFlooring, tentLest, tentAccessories, stageStruct, powerSource, powerRequirement, outletCount, cableType, connectionType, circuitBreakers, surgeProtection, groundingDetails, soundSystemType, speakerCount, soundCoverArea, soundExpectedAudience, soundSpaceContraint, maxLoad, soundRig, lightingType, lightingCount, lightingPower, lightingSubnject, lightSpaceContraint, lightRig, videoType, videoRig, screenType, screenDimensions, videoResolution, videoCaptation, videoProduction, videoStreaming, videoMultiplex, theme, style, flowerDetails, furnitureDetails, decorativeElements, stageDress, ctsDress, cabinDress, projectManager, salesManager, siteManager, technicians, photoURLs, tasks, setupDate, operationStartDate, operationEndDate, teardownDate, electroContact, cableWay, brameDirTech, brameProjectManager, brameSalesManager, brameSiteManager, brameSechnicians, brameRoad, localDirTech, localProjectManager, localSalesManager, localSiteManager, localTechnicians, localRoad
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
        tentLest = try container.decode(String.self, forKey: .tentLest)
        tentAccessories = try container.decode(String.self, forKey: .tentAccessories)
        stageStruct = try container.decode(String.self, forKey: .stageStruct)
        
        powerSource = try container.decode(String.self, forKey: .powerSource)
        powerRequirement = try container.decode(String.self, forKey: .powerRequirement)
        outletCount = try container.decode(String.self, forKey: .outletCount)
        cableType = try container.decode(String.self, forKey: .cableType)
        connectionType = try container.decode(String.self, forKey: .connectionType)
        circuitBreakers = try container.decode(String.self, forKey: .circuitBreakers)
        surgeProtection = try container.decode(String.self, forKey: .surgeProtection)
        groundingDetails = try container.decode(String.self, forKey: .groundingDetails)
        cableWay = try container.decode(String.self, forKey: .cableWay)
        electroContact = try container.decode(String.self, forKey: .electroContact)
        
        soundSystemType = try container.decode(String.self, forKey: .soundSystemType)
        speakerCount = try container.decode(String.self, forKey: .speakerCount)
        soundCoverArea = try container.decode(String.self, forKey: .soundCoverArea)
        soundExpectedAudience = try container.decode(String.self, forKey: .soundExpectedAudience)
        soundSpaceContraint = try container.decode(String.self, forKey: .soundSpaceContraint)
        maxLoad = try container.decode(String.self, forKey: .maxLoad)
        soundRig = try container.decode(String.self, forKey: .soundRig)
        
        lightingType = try container.decode(String.self, forKey: .lightingType)
        lightingCount = try container.decode(String.self, forKey: .lightingCount)
        lightingPower = try container.decode(String.self, forKey: .lightingPower)
        lightingSubnject = try container.decode(String.self, forKey: .lightingSubnject)
        lightSpaceContraint = try container.decode(String.self, forKey: .lightSpaceContraint)
        lightRig = try container.decode(String.self, forKey: .lightRig)
        
        screenType = try container.decode(String.self, forKey: .screenType)
        screenDimensions = try container.decode(String.self, forKey: .screenDimensions)
        videoResolution = try container.decode(String.self, forKey: .videoResolution)
        videoCaptation = try container.decode(String.self, forKey: .videoCaptation)
        videoProduction = try container.decode(String.self, forKey: .videoProduction)
        videoStreaming = try container.decode(String.self, forKey: .videoStreaming)
        videoMultiplex = try container.decode(String.self, forKey: .videoMultiplex)
        videoType = try container.decode(String.self, forKey: .videoType)
        videoRig = try container.decode(String.self, forKey: .videoRig)
        
        theme = try container.decode(String.self, forKey: .theme)
        style = try container.decode(String.self, forKey: .style)
        flowerDetails = try container.decode(String.self, forKey: .flowerDetails)
        furnitureDetails = try container.decode(String.self, forKey: .furnitureDetails)
        decorativeElements = try container.decode(String.self, forKey: .decorativeElements)
        stageDress = try container.decode(String.self, forKey: .stageDress)
        ctsDress = try container.decode(String.self, forKey: .ctsDress)
        cabinDress = try container.decode(String.self, forKey: .cabinDress)
        
        photoURLs = try container.decode([URL].self, forKey: .photoURLs)
        tasks = try container.decode([String].self, forKey: .tasks)
        projectManager = try container.decode(String.self, forKey: .projectManager)
        salesManager = try container.decode(String.self, forKey: .salesManager)
        siteManager = try container.decode(String.self, forKey: .siteManager)
        technicians = try container.decode(String.self, forKey: .technicians)
        setupDate = try container.decode(Date.self, forKey: .setupDate)
        operationStartDate = try container.decode(Date.self, forKey: .operationStartDate)
        operationEndDate = try container.decode(Date.self, forKey: .operationEndDate)
        teardownDate = try container.decode(Date.self, forKey: .teardownDate)
        
        brameDirTech = try container.decode(String.self, forKey: .brameDirTech)
        brameProjectManager = try container.decode(String.self, forKey: .brameProjectManager)
        brameSalesManager = try container.decode(String.self, forKey: .brameSalesManager)
        brameSiteManager = try container.decode(String.self, forKey: .brameSiteManager)
        brameSechnicians = try container.decode(String.self, forKey: .brameSechnicians)
        brameRoad = try container.decode(String.self, forKey: .brameRoad)
        
        localDirTech = try container.decode(String.self, forKey: .localDirTech)
        localProjectManager = try container.decode(String.self, forKey: .localProjectManager)
        localSalesManager = try container.decode(String.self, forKey: .localSalesManager)
        localSiteManager = try container.decode(String.self, forKey: .localSiteManager)
        localTechnicians = try container.decode(String.self, forKey: .localTechnicians)
        localRoad = try container.decode(String.self, forKey: .localRoad)
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
        try container.encode(tentLest, forKey: .tentLest)
        try container.encode(tentAccessories, forKey: .tentAccessories)
        try container.encode(stageStruct, forKey: .stageStruct)
        try container.encode(powerSource, forKey: .powerSource)
        try container.encode(powerRequirement, forKey: .powerRequirement)
        try container.encode(outletCount, forKey: .outletCount)
        try container.encode(cableType, forKey: .cableType)
        try container.encode(connectionType, forKey: .connectionType)
        try container.encode(circuitBreakers, forKey: .circuitBreakers)
        try container.encode(surgeProtection, forKey: .surgeProtection)
        try container.encode(groundingDetails, forKey: .groundingDetails)
        try container.encode(cableWay, forKey: .cableWay)
        try container.encode(electroContact, forKey: .electroContact)
        
        try container.encode(soundSystemType, forKey: .soundSystemType)
        try container.encode(speakerCount, forKey: .speakerCount)
        try container.encode(soundCoverArea, forKey: .soundCoverArea)
        try container.encode(soundExpectedAudience, forKey: .soundExpectedAudience)
        try container.encode(soundSpaceContraint, forKey: .soundSpaceContraint)
        try container.encode(maxLoad, forKey: .maxLoad)
        try container.encode(soundRig, forKey: .soundRig)
        
        try container.encode(lightingType, forKey: .lightingType)
        try container.encode(lightingCount, forKey: .lightingCount)
        try container.encode(lightingPower, forKey: .lightingPower)
        try container.encode(lightingSubnject, forKey: .lightingSubnject)
        try container.encode(lightSpaceContraint, forKey: .lightSpaceContraint)
        try container.encode(lightRig, forKey: .lightRig)
        
        try container.encode(videoType, forKey: .videoType)
        try container.encode(videoRig, forKey: .videoRig)
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
        try container.encode(stageDress, forKey: .stageDress)
        try container.encode(ctsDress, forKey: .ctsDress)
        try container.encode(cabinDress, forKey: .cabinDress)
        
        try container.encode(photoURLs, forKey: .photoURLs)
        try container.encode(tasks, forKey: .tasks)
        try container.encode(projectManager, forKey: .projectManager)
        try container.encode(salesManager, forKey: .salesManager)
        try container.encode(siteManager, forKey: .siteManager)
        try container.encode(technicians, forKey: .technicians)
        try container.encode(setupDate, forKey: .setupDate)
        try container.encode(operationStartDate, forKey: .operationStartDate)
        try container.encode(operationEndDate, forKey: .operationEndDate)
        try container.encode(teardownDate, forKey: .teardownDate)
        
        try container.encode(brameDirTech, forKey: .brameDirTech)
        try container.encode(brameProjectManager, forKey: .brameProjectManager)
        try container.encode(brameSalesManager, forKey: .brameSalesManager)
        try container.encode(brameSiteManager, forKey: .brameSiteManager)
        try container.encode(brameSechnicians, forKey: .brameSechnicians)
        try container.encode(brameRoad, forKey: .brameRoad)
        
        try container.encode(localDirTech, forKey: .localDirTech)
        try container.encode(localProjectManager, forKey: .localProjectManager)
        try container.encode(localSalesManager, forKey: .localSalesManager)
        try container.encode(localSiteManager, forKey: .localSiteManager)
        try container.encode(localTechnicians, forKey: .localTechnicians)
        try container.encode(localRoad, forKey: .localRoad)
    }
    
    convenience init?(record: CKRecord) {
        print("Initializing Project from CKRecord...")
        print("Record Values: \(record.dictionaryWithValues(forKeys: record.allKeys()))")
        
        let name = record["name"] as? String ?? ""
        let description = record["description"] as? String ?? ""
        let agencyName = record["agencyName"] as? String ?? ""
        let agencyContact = record["agencyContact"] as? String ?? ""
        let agencyMail = record["agencyMail"] as? String ?? ""
        let agencyPhone = record["agencyPhone"] as? String ?? ""
        let eventDate = record["eventDate"] as? Date ?? Date()
        let eventLocation = record["eventLocation"] as? String ?? ""
        let tentType = record["tentType"] as? String ?? ""
        let tentDimensions = record["tentDimensions"] as? String ?? ""
        let tentHeight = record["tentHeight"] as? String ?? ""
        let tentCover = record["tentCover"] as? String ?? ""
        let tentHeating = record["tentHeating"] as? String ?? ""
        let tentAC = record["tentAC"] as? String ?? ""
        let tentLest = record["tentLest"] as? String ?? ""
        let tentFlooring = record["tentFlooring"] as? String ?? ""
        let tentAccessories = record["tentAccessories"] as? String ?? ""
        let stageStruct = record["stageStruct"] as? String ?? ""
        
        let powerSource = record["powerSource"] as? String ?? ""
        let powerRequirement = record["powerRequirement"] as? String ?? ""
        let outletCount = record["outletCount"] as? String ?? ""
        let cableType = record["cableType"] as? String ?? ""
        let connectionType = record["connectionType"] as? String ?? ""
        let circuitBreakers = record["circuitBreakers"] as? String ?? ""
        let surgeProtection = record["surgeProtection"] as? String ?? ""
        let groundingDetails = record["groundingDetails"] as? String ?? ""
        let cableWay = record["cableWay"] as? String ?? ""
        let electroContact = record["electroContact"] as? String ?? ""
        
        let soundSystemType = record["soundSystemType"] as? String ?? ""
        let speakerCount = record["speakerCount"] as? String ?? ""
        let soundCoverArea = record["soundCoverArea"] as? String ?? ""
        let soundExpectedAudience = record["soundExpectedAudience"] as? String ?? ""
        let soundSpaceContraint = record["soundSpaceContraint"] as? String ?? ""
        let maxLoad = record["maxLoad"] as? String ?? ""
        let soundRig = record["soundRig"] as? String ?? ""
        
        let lightingType = record["lightingType"] as? String ?? ""
        let lightingCount = record["lightingCount"] as? String ?? ""
        let lightingPower = record["lightingPower"] as? String ?? ""
        let lightingSubnject = record["lightingSubnject"] as? String ?? ""
        let lightSpaceContraint = record["lightSpaceContraint"] as? String ?? ""
        let lightRig = record["lightRig"] as? String ?? ""
        
        let screenType = record["screenType"] as? String ?? ""
        let screenDimensions = record["screenDimensions"] as? String ?? ""
        let videoResolution = record["videoResolution"] as? String ?? ""
        let videoCaptation = record["videoCaptation"] as? String ?? ""
        let videoProduction = record["videoProduction"] as? String ?? ""
        let videoStreaming = record["videoStreaming"] as? String ?? ""
        let videoMultiplex = record["videoMultiplex"] as? String ?? ""
        let videoType = record["videoType"] as? String ?? ""
        let videoRig = record["videoRig"] as? String ?? ""
        
        let theme = record["theme"] as? String ?? ""
        let style = record["style"] as? String ?? ""
        let flowerDetails = record["flowerDetails"] as? String ?? ""
        let furnitureDetails = record["furnitureDetails"] as? String ?? ""
        let decorativeElements = record["decorativeElements"] as? String ?? ""
        let stageDress = record["stageDress"] as? String ?? ""
        let ctsDress = record["ctsDress"] as? String ?? ""
        let cabinDress = record["cabinDress"] as? String ?? ""
        
        let photoAssets = record["photoURLs"] as? [CKAsset] ?? []
        let photoURLs = photoAssets.compactMap { $0.fileURL }
        
        let tasks = record["tasks"] as? [String] ?? []
        
        let projectManager = record["projectManager"] as? String ?? ""
        let salesManager = record["salesManager"] as? String ?? ""
        let siteManager = record["iteManager"] as? String ?? ""
        let technicians = record["technicians"] as? String ?? ""
        let setupDate = record["setupDate"] as? Date ?? Date()
        let operationStartDate = record["operationStartDate"] as? Date ?? Date()
        let operationEndDate = record["operationEndDate"] as? Date ?? Date()
        let teardownDate = record["teardownDate"] as? Date ?? Date()
        let brameDirTech = record["brameDirTech"] as? String ?? ""
        let brameProjectManager = record["brameProjectManager"] as? String ?? ""
        let brameSalesManager = record["brameSalesManager"] as? String ?? ""
        let brameSiteManager = record["brameSiteManager"] as? String ?? ""
        let brameSechnicians = record["brameSechnicians"] as? String ?? ""
        let brameRoad = record["brameRoad"] as? String ?? ""
        
        let localDirTech = record["localDirTech"] as? String ?? ""
        let localProjectManager = record["localProjectManager"] as? String ?? ""
        let localSalesManager = record["localSalesManager"] as? String ?? ""
        let localSiteManager = record["localSiteManager"] as? String ?? ""
        let localTechnicians = record["localTechnicians"] as? String ?? ""
        let localRoad = record["localRoad"] as? String ?? ""
        
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
            tentLest: tentLest,
            stageStruct: stageStruct,
            powerSource: powerSource,
            powerRequirement: powerRequirement,
            outletCount: outletCount,
            cableType: cableType,
            connectionType: connectionType,
            circuitBreakers: circuitBreakers,
            surgeProtection: surgeProtection,
            groundingDetails: groundingDetails,
            cableWay: cableWay,
            electroContact: electroContact,
            soundSystemType: soundSystemType,
            speakerCount: speakerCount,
            soundCoverArea: soundCoverArea,
            soundExpectedAudience: soundExpectedAudience,
            soundSpaceContraint: soundSpaceContraint,
            maxLoad: maxLoad,
            soundRig: soundRig,
            lightingType: lightingType,
            lightingCount: lightingCount,
            lightingPower: lightingPower,
            lightingSubnject: lightingSubnject,
            lightSpaceContraint: lightSpaceContraint,
            lightRig: lightRig,
            videoType: videoType,
            videoRig: videoRig,
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
            stageDress: stageDress,
            ctsDress: ctsDress,
            cabinDress: cabinDress,
            projectManager: projectManager,
            salesManager: salesManager,
            siteManager: siteManager,
            technicians: technicians,
            photoURLs: photoURLs,
            tasks: tasks,
            setupDate: setupDate,
            operationStartDate: operationStartDate,
            operationEndDate: operationEndDate,
            teardownDate: teardownDate,
            brameDirTech: brameDirTech,
            brameProjectManager: brameProjectManager,
            brameSalesManager: brameSalesManager,
            brameSiteManager: brameSiteManager,
            brameSechnicians: brameSechnicians,
            brameRoad: brameRoad,
            localDirTech: localDirTech,
            localProjectManager: localProjectManager,
            localSalesManager: localSalesManager,
            localSiteManager: localSiteManager,
            localTechnicians: localTechnicians,
            localRoad: localRoad
        )
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
        record["tentLest"] = tentLest as CKRecordValue
        record["tentAccessories"] = tentAccessories as CKRecordValue
        record["stageStruct"] = stageStruct as CKRecordValue
        
        record["powerSource"] = powerSource as CKRecordValue
        record["powerRequirement"] = powerRequirement as CKRecordValue
        record["outletCount"] = outletCount as CKRecordValue
        record["cableType"] = cableType as CKRecordValue
        record["connectionType"] = connectionType as CKRecordValue
        record["circuitBreakers"] = circuitBreakers as CKRecordValue
        record["surgeProtection"] = surgeProtection as CKRecordValue
        record["groundingDetails"] = groundingDetails as CKRecordValue
        record["cableWay"] = cableWay as CKRecordValue
        record["electroContact"] = electroContact as CKRecordValue
        
        record["soundSystemType"] = soundSystemType as CKRecordValue
        record["speakerCount"] = speakerCount as CKRecordValue
        record["soundCoverArea"] = soundCoverArea as CKRecordValue
        record["soundExpectedAudience"] = soundExpectedAudience as CKRecordValue
        record["soundSpaceContraint"] = soundSpaceContraint as CKRecordValue
        record["maxLoad"] = maxLoad as CKRecordValue
        record["soundRig"] = soundRig as CKRecordValue
        
        record["lightingType"] = lightingType as CKRecordValue
        record["lightingCount"] = lightingCount as CKRecordValue
        record["lightingPower"] = lightingPower as CKRecordValue
        record["lightingSubnject"] = lightingSubnject as CKRecordValue
        record["lightSpaceContraint"] = lightSpaceContraint as CKRecordValue
        record["lightRig"] = lightRig as CKRecordValue
        
        record["videoType"] = videoType as CKRecordValue
        record["videoRig"] = videoRig as CKRecordValue
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
        record["stageDress"] = stageDress as CKRecordValue
        record["ctsDress"] = ctsDress as CKRecordValue
        record["cabinDress"] = cabinDress as CKRecordValue
        
        record["projectManager"] = projectManager as CKRecordValue
        record["salesManager"] = salesManager as CKRecordValue
        record["siteManager"] = siteManager as CKRecordValue
        record["technicians"] = technicians as CKRecordValue
        record["setupDate"] = setupDate as CKRecordValue
        record["operationStartDate"] = operationStartDate as CKRecordValue
        record["operationEndDate"] = operationEndDate as CKRecordValue
        record["teardownDate"] = teardownDate as CKRecordValue
        
        record["brameDirTech"] = brameDirTech as CKRecordValue
        record["brameProjectManager"] = brameProjectManager as CKRecordValue
        record["brameSalesManager"] = brameSalesManager as CKRecordValue
        record["brameSiteManager"] = brameSiteManager as CKRecordValue
        record["brameSechnicians"] = brameSechnicians as CKRecordValue
        record["brameRoad"] = brameRoad as CKRecordValue
        record["localDirTech"] = localDirTech as CKRecordValue
        record["localProjectManager"] = localProjectManager as CKRecordValue
        record["localSalesManager"] = localSalesManager as CKRecordValue
        record["localSiteManager"] = localSiteManager as CKRecordValue
        record["localTechnicians"] = localTechnicians as CKRecordValue
        record["localRoad"] = localRoad as CKRecordValue
        
        let photoAssets = photoURLs.map { CKAsset(fileURL: $0) }
        record["photoURLs"] = photoAssets as CKRecordValue
        
        let taskList = tasks as [CKRecordValue]
        record["tasks"] = taskList as CKRecordValue
        
        print("Record Keys: \(record.allKeys())")
        print("Record Values: \(record.dictionaryWithValues(forKeys: record.allKeys()))")
        
        return record
    }
}

extension Project: Equatable {
    static func ==(lhs: Project, rhs: Project) -> Bool {
        return lhs.id == rhs.id
            && lhs.name == rhs.name
            && lhs.description == rhs.description
            && lhs.agencyName == rhs.agencyName
            && lhs.agencyContact == rhs.agencyContact
            && lhs.agencyMail == rhs.agencyMail
            && lhs.agencyPhone == rhs.agencyPhone
            && lhs.eventDate == rhs.eventDate
            && lhs.eventLocation == rhs.eventLocation
            && lhs.tentType == rhs.tentType
            && lhs.stageStruct == rhs.stageStruct
            && lhs.tentDimensions == rhs.tentDimensions
            && lhs.tentHeight == rhs.tentHeight
            && lhs.tentCover == rhs.tentCover
            && lhs.tentHeating == rhs.tentHeating
            && lhs.tentAC == rhs.tentAC
            && lhs.tentFlooring == rhs.tentFlooring
            && lhs.tentAccessories == rhs.tentAccessories
            && lhs.tentLest == rhs.tentLest
            && lhs.powerSource == rhs.powerSource
            && lhs.powerRequirement == rhs.powerRequirement
            && lhs.outletCount == rhs.outletCount
            && lhs.cableType == rhs.cableType
            && lhs.connectionType == rhs.connectionType
            && lhs.circuitBreakers == rhs.circuitBreakers
            && lhs.surgeProtection == rhs.surgeProtection
            && lhs.groundingDetails == rhs.groundingDetails
            && lhs.cableWay == rhs.cableWay
            && lhs.electroContact == rhs.electroContact
            && lhs.soundSystemType == rhs.soundSystemType
            && lhs.speakerCount == rhs.speakerCount
            && lhs.soundCoverArea == rhs.soundCoverArea
            && lhs.soundExpectedAudience == rhs.soundExpectedAudience
            && lhs.soundSpaceContraint == rhs.soundSpaceContraint
            && lhs.maxLoad == rhs.maxLoad
            && lhs.soundRig == rhs.soundRig
            && lhs.lightingType == rhs.lightingType
            && lhs.lightingCount == rhs.lightingCount
            && lhs.lightingPower == rhs.lightingPower
            && lhs.lightingSubnject == rhs.lightingSubnject
            && lhs.lightSpaceContraint == rhs.lightSpaceContraint
            && lhs.lightRig == rhs.lightRig
            && lhs.videoType == rhs.videoType
            && lhs.videoRig == rhs.videoRig
            && lhs.screenType == rhs.screenType
            && lhs.screenDimensions == rhs.screenDimensions
            && lhs.videoResolution == rhs.videoResolution
            && lhs.videoCaptation == rhs.videoCaptation
            && lhs.videoProduction == rhs.videoProduction
            && lhs.videoStreaming == rhs.videoStreaming
            && lhs.videoMultiplex == rhs.videoMultiplex
            && lhs.theme == rhs.theme
            && lhs.style == rhs.style
            && lhs.flowerDetails == rhs.flowerDetails
            && lhs.furnitureDetails == rhs.furnitureDetails
            && lhs.decorativeElements == rhs.decorativeElements
            && lhs.stageDress == rhs.stageDress
            && lhs.ctsDress == rhs.ctsDress
            && lhs.cabinDress == rhs.cabinDress
            && lhs.projectManager == rhs.projectManager
            && lhs.salesManager == rhs.salesManager
            && lhs.siteManager == rhs.siteManager
            && lhs.technicians == rhs.technicians
            && lhs.photoURLs == rhs.photoURLs
            && lhs.tasks == rhs.tasks
            && lhs.setupDate == rhs.setupDate
            && lhs.operationStartDate == rhs.operationStartDate
            && lhs.operationEndDate == rhs.operationEndDate
            && lhs.teardownDate == rhs.teardownDate
            && lhs.brameDirTech == rhs.brameDirTech
            && lhs.brameProjectManager == rhs.brameProjectManager
            && lhs.brameSalesManager == rhs.brameSalesManager
            && lhs.brameSiteManager == rhs.brameSiteManager
            && lhs.brameSechnicians == rhs.brameSechnicians
            && lhs.brameRoad == rhs.brameRoad
            && lhs.localDirTech == rhs.localDirTech
            && lhs.localProjectManager == rhs.localProjectManager
            && lhs.localSalesManager == rhs.localSalesManager
            && lhs.localSiteManager == rhs.localSiteManager
            && lhs.localTechnicians == rhs.localTechnicians
            && lhs.localRoad == rhs.localRoad
    }
}
