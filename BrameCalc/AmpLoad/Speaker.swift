import SwiftUI

struct Speaker: Identifiable {
    let id = UUID()
    var name: String
    var channelsUsed: Int
    var compatibleAmps: [Amp]
    var category: AmpLoadCalcView.Category

    static var defaultSpeaker: Speaker {
            return Speaker(
                name: "X8",
                channelsUsed: 1,
                compatibleAmps: [Amp.defaultAmp],  // Utilisez la valeur par défaut de Amp ici
                category: .X
            )
        }
    enum Category: String, CaseIterable, Identifiable {
        case coaxial, colinear, wst, sub
        var id: String { self.rawValue }
    }

    init(name: String = "X8",
         channelsUsed: Int = 1,
         maxSpeakersPerChannel: Int = 1, // Nouveau paramètre
         compatibleAmps: [Amp] = [],
         category: AmpLoadCalcView.Category = .X
    ) {
        self.name = name
        self.channelsUsed = channelsUsed
        self.compatibleAmps = compatibleAmps
        self.category = category

    }
}
