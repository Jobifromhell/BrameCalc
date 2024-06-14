import SwiftUI

struct LoadInfo {
    var total: Int
    var perChannel: Int
}

class Amp {
    let name: String
    var speakerLoad: [String]
    var maxSpeakerLoads: [String: LoadInfo]
    var compatibleSpeakers: [String]
    
    static var defaultAmp: Amp {
        return Amp(
            name: "LA7.16",
            speakerLoad: [],
            maxSpeakerLoads: ["X8": LoadInfo(total: 16, perChannel: 1)]
        )
    }

    
    init(name: String, speakerLoad: [String], maxSpeakerLoads: [String: LoadInfo], compatibleSpeakers: [String] = []) {
        self.name = name
        self.speakerLoad = speakerLoad
        self.compatibleSpeakers = compatibleSpeakers
        self.maxSpeakerLoads = maxSpeakerLoads // Set the maxSpeakerLoads
    }

}
