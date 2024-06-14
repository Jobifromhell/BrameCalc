import SwiftUI


class AmpLoadData: ObservableObject {
    @Published var speakers: [Speaker] = []
    //    var category : String
    init() {
        let la12X = Amp(
            name: "LA12X",
            speakerLoad: [],
            maxSpeakerLoads: [
                "X4i": LoadInfo(total: 24, perChannel: 6),
                "5XT": LoadInfo(total: 24, perChannel: 12),
                "X8": LoadInfo(total: 12, perChannel: 3),
                "X12": LoadInfo(total: 12, perChannel: 3),
                "X15 HiQ": LoadInfo(total: 6, perChannel: 3),
                "8XT": LoadInfo(total: 12, perChannel: 3),
                "Active 12XT": LoadInfo(total: 6, perChannel: 3),
                "Passive 12XT": LoadInfo(total: 12, perChannel: 3),
                "112XT": LoadInfo(total: 6, perChannel: 3),
                "115XT HiQ": LoadInfo(total: 6, perChannel: 3),
                "115XT": LoadInfo(total: 6, perChannel: 3),
                "MTD108a": LoadInfo(total: 12, perChannel: 3),
                "MTD112b": LoadInfo(total: 8, perChannel: 2),
                "Active MTD115b": LoadInfo(total: 4, perChannel: 2),
                "Passive MTD115b": LoadInfo(total: 8, perChannel: 2),
                "Syva": LoadInfo(total: 12, perChannel: 3),
                "A10": LoadInfo(total: 12, perChannel: 3),
                "A15": LoadInfo(total: 12, perChannel: 3),
                "ARCS Wide/Focus": LoadInfo(total: 12, perChannel: 3),
                "ARCS II": LoadInfo(total: 6, perChannel: 3),
                "ARCS": LoadInfo(total: 6, perChannel: 3),
                "K1": LoadInfo(total: 2, perChannel: 2),
                "K1-SB": LoadInfo(total: 4, perChannel: 1),
                "K2": LoadInfo(total: 3, perChannel: 3),
                "K3": LoadInfo(total: 6, perChannel: 3),
                "KARA": LoadInfo(total: 6, perChannel: 3),
                "KARA II": LoadInfo(total: 6, perChannel: 3),
                "KIVA II": LoadInfo(total: 24, perChannel: 6),
//                "Kiva/Kilo": LoadInfo(total: 12, perChannel: 3),
                "Kudo": LoadInfo(total: 3, perChannel: 3),
                "V-DOSC": LoadInfo(total: 2, perChannel: 2),
                "dV-DOSC": LoadInfo(total: 6, perChannel: 3),
                "KS28": LoadInfo(total: 4, perChannel: 1),
                "SB28": LoadInfo(total: 4, perChannel: 1),
                "KS21": LoadInfo(total: 8, perChannel: 2),
                "SB18": LoadInfo(total: 12, perChannel: 3),
                "SB218": LoadInfo(total: 4, perChannel: 1),
                "SB118": LoadInfo(total: 8, perChannel: 2),
                "SB15": LoadInfo(total: 12, perChannel: 3),
                "SyvaLow": LoadInfo(total: 6, perChannel: 2),
                "SyvaSub": LoadInfo(total: 12, perChannel: 3),
                "SB10": LoadInfo(total: 8, perChannel: 2),
//                "SB6": LoadInfo(total: 4, perChannel: 1),
                "dVSUB": LoadInfo(total: 4, perChannel: 1)
            ]

        )
        let la4X = Amp(
            name: "LA4X",
            speakerLoad: [],
            maxSpeakerLoads: [
                "X4i": LoadInfo(total: 16, perChannel: 4),
                "5XT": LoadInfo(total: 16, perChannel: 4),
                "X8": LoadInfo(total: 8, perChannel: 2),
                "X12": LoadInfo(total: 4, perChannel: 1),
                "X15 HiQ": LoadInfo(total: 2, perChannel: 1),
                "8XT": LoadInfo(total: 8, perChannel: 2),
                "Active 12XT": LoadInfo(total: 4, perChannel: 2),
                "Passive 12XT": LoadInfo(total: 4, perChannel: 1),
                "112XT": LoadInfo(total: 4, perChannel: 2),
                "115XT HiQ": LoadInfo(total: 2, perChannel: 1),
                "115XT": LoadInfo(total: 2, perChannel: 1),
                "MTD108a": LoadInfo(total: 8, perChannel: 2),
                "MTD112b": LoadInfo(total: 4, perChannel: 1),
                "Active MTD115b": LoadInfo(total: 2, perChannel: 1),
                "Passive MTD115b": LoadInfo(total: 4, perChannel: 1),
                "Syva": LoadInfo(total: 4, perChannel: 1),
                "A10": LoadInfo(total: 8, perChannel: 2),
                "A15": LoadInfo(total: 4, perChannel: 1),
                "ARCS Wide/Focus": LoadInfo(total: 4, perChannel: 1),
                "ARCS II": LoadInfo(total: 2, perChannel: 1),
                "ARCS": LoadInfo(total: 2, perChannel: 1),
                "K2": LoadInfo(total: 1, perChannel: 1),
                "K3": LoadInfo(total: 2, perChannel: 1),
                "KARA": LoadInfo(total: 4, perChannel: 2),
                "KARA II": LoadInfo(total: 4, perChannel: 2),
                "KIVA II": LoadInfo(total: 8, perChannel: 2),
//                "KIVA/Kilo": LoadInfo(total: 8, perChannel: 2),
                "Kudo": LoadInfo(total: 1, perChannel: 1),
                "KS21": LoadInfo(total: 4, perChannel: 1),
                "SB18": LoadInfo(total: 4, perChannel: 1),
                "SB118": LoadInfo(total: 4, perChannel: 1),
                "SB15": LoadInfo(total: 4, perChannel: 1),
                "SyvaLow": LoadInfo(total: 4, perChannel: 1),
                "SyvaSub": LoadInfo(total: 4, perChannel: 1),
                "SB10": LoadInfo(total: 8, perChannel: 2),
//                "SB6": LoadInfo(total: 4, perChannel: 1)
            ]
        )

        let la8 = Amp(
            name: "LA8",
            speakerLoad: [],
            maxSpeakerLoads: [
                "X4i": LoadInfo(total: 24, perChannel: 6),
                "5XT": LoadInfo(total: 24, perChannel: 6),
                "X8": LoadInfo(total: 8, perChannel: 3),
                "X12": LoadInfo(total: 8, perChannel: 2),
                "X15 HiQ": LoadInfo(total: 4, perChannel: 2),
                "8XT": LoadInfo(total: 12, perChannel: 3),
                "Active 12XT": LoadInfo(total: 6, perChannel: 3),
                "Passive 12XT": LoadInfo(total: 8, perChannel: 2),
                "112XT": LoadInfo(total: 6, perChannel: 3),
                "115XT HiQ": LoadInfo(total: 4, perChannel: 2),
                "115XT": LoadInfo(total: 4, perChannel: 2),
                "MTD108a": LoadInfo(total: 12, perChannel: 3),
                "MTD112b": LoadInfo(total: 8, perChannel: 2),
                "Active MTD115b": LoadInfo(total: 4, perChannel: 2),
                "Passive MTD115b": LoadInfo(total: 8, perChannel: 2),
                "Syva": LoadInfo(total: 8, perChannel: 2),
                "A10": LoadInfo(total: 8, perChannel: 2),
                "A15": LoadInfo(total: 8, perChannel: 2),
                "ARCS Wide/Focus": LoadInfo(total: 8, perChannel: 2),
                "ARCS II": LoadInfo(total: 4, perChannel: 2),
                "ARCS": LoadInfo(total: 6, perChannel: 3),
                "K1": LoadInfo(total: 2, perChannel: 2),
                "K1-SB": LoadInfo(total: 4, perChannel: 1),
                "K2": LoadInfo(total: 3, perChannel: 3),
                "K3": LoadInfo(total: 4, perChannel: 2),
                "KARA": LoadInfo(total: 6, perChannel: 3),
                "KARA II": LoadInfo(total: 6, perChannel: 3),
                "KIVA II": LoadInfo(total: 16, perChannel: 4),
//                "Kiva/Kilo": LoadInfo(total: 12, perChannel: 3),
                "Kudo": LoadInfo(total: 3, perChannel: 3),
                "V-DOSC": LoadInfo(total: 2, perChannel: 2),
                "dV-DOSC": LoadInfo(total: 6, perChannel: 3),
                "SB28": LoadInfo(total: 4, perChannel: 1),
                "KS21": LoadInfo(total: 6, perChannel: 2),
                "SB18": LoadInfo(total: 6, perChannel: 2),
                "SB218": LoadInfo(total: 4, perChannel: 1),
                "SB118": LoadInfo(total: 8, perChannel: 2),
                "SB15": LoadInfo(total: 6, perChannel: 2),
                "SyvaLow": LoadInfo(total: 4, perChannel: 1),
                "SyvaSub": LoadInfo(total: 8, perChannel: 2),
                "SB10": LoadInfo(total: 12, perChannel: 3),
                "dVSUB": LoadInfo(total: 4, perChannel: 1)
            ]
        )


        let la4 = Amp(
            name: "LA4",
            speakerLoad: [],
            maxSpeakerLoads: [
                "X4i": LoadInfo(total: 16, perChannel: 4),
                "5XT": LoadInfo(total: 12, perChannel: 3),
                "8XT": LoadInfo(total: 8, perChannel: 2),
                "Active 12XT": LoadInfo(total: 4, perChannel: 2),
                "Passive 12XT": LoadInfo(total: 4, perChannel: 1),
                "112XT": LoadInfo(total: 4, perChannel: 2),
                "115XT HiQ": LoadInfo(total: 2, perChannel: 1),
                "115XT": LoadInfo(total: 2, perChannel: 1),
                "MTD108a": LoadInfo(total: 8, perChannel: 2),
                "MTD112b": LoadInfo(total: 4, perChannel: 1),
                "Active MTD115b": LoadInfo(total: 2, perChannel: 1),
                "Passive MTD115b": LoadInfo(total: 4, perChannel: 1),
//                "Syva": LoadInfo(total: 4, perChannel: 2),
                "ARCS Wide/Focus": LoadInfo(total: 4, perChannel: 1),
                "ARCS": LoadInfo(total: 2, perChannel: 1),
//                "Kiva/Kilo": LoadInfo(total: 8, perChannel: 2),
                "SB18": LoadInfo(total: 4, perChannel: 1),
                "SB118": LoadInfo(total: 4, perChannel: 1),
                "SB15": LoadInfo(total: 4, perChannel: 1),
                "SyvaSub": LoadInfo(total: 4, perChannel: 1)
            ]
        )

       
        let la7_16 = Amp(
            name: "LA7.16",
            speakerLoad: [],
            maxSpeakerLoads: [
                        "X4i": LoadInfo(total: 64, perChannel: 4),
                        "5XT": LoadInfo(total: 48, perChannel: 3),
                        "X8": LoadInfo(total: 16, perChannel: 1),
                        "X12": LoadInfo(total: 14, perChannel: 1),
                        "X15 HiQ": LoadInfo(total: 8, perChannel: 1),
                        "Syva": LoadInfo(total: 10, perChannel: 1),
                        "A10": LoadInfo(total: 16, perChannel: 1),
                        "A15": LoadInfo(total: 10, perChannel: 1),
                        "K2": LoadInfo(total: 4, perChannel: 1),
                        "K3": LoadInfo(total: 8, perChannel: 1),
                        "KARA II": LoadInfo(total: 8, perChannel: 1),
                        "KIVA II": LoadInfo(total: 32, perChannel: 2),
//                        "L2/L2D": LoadInfo(total: 1, perChannel: 1),
                        "KS21": LoadInfo(total: 8, perChannel: 1),
                        "SB18": LoadInfo(total: 6, perChannel: 1),
                        "SB15": LoadInfo(total: 9, perChannel: 1),
                        "SyvaLow": LoadInfo(total: 8, perChannel: 1),
                        "SyvaSub": LoadInfo(total: 16, perChannel: 1),
                        "SB10": LoadInfo(total: 32, perChannel: 2),
//                        "SB6": LoadInfo(total: 16, perChannel: 1)
            ]
        )

        let x4i = Speaker(name: "X4i", channelsUsed: 1, compatibleAmps: [la4, la4X, la12X, la8, la7_16], category: .X)
        let xt5 = Speaker(name: "5XT", channelsUsed: 1, compatibleAmps: [la4, la4X, la12X, la8, la7_16], category: .LEGACY)
        let x12 = Speaker(name: "X12", channelsUsed: 1, compatibleAmps: [ la4X, la12X, la8, la7_16], category: .X)
        let x8 = Speaker(name: "X8", channelsUsed: 1, compatibleAmps: [la4X, la12X, la8, la7_16], category: .X)
        let x15HiQ = Speaker(name: "X15 HiQ", channelsUsed: 2, compatibleAmps: [ la4X, la12X, la8, la7_16], category: .X)
        let xt8 = Speaker(name: "8XT", channelsUsed: 1, compatibleAmps: [la4, la4X, la12X, la8], category: .LEGACY)
        let active12XT = Speaker(name: "Active 12XT", channelsUsed: 2, compatibleAmps: [la4, la4X, la12X, la8], category: .LEGACY)
        let passive12XT = Speaker(name: "Passive 12XT", channelsUsed: 1, compatibleAmps: [la4, la4X, la12X, la8], category: .LEGACY)
        let XT112 = Speaker(name: "112XT", channelsUsed: 2, compatibleAmps: [la4, la4X, la12X, la8], category: .LEGACY)
        let XT115 = Speaker(name: "115XT", channelsUsed: 2, compatibleAmps: [la4, la4X, la12X, la8], category: .LEGACY)
        let XT115HiQ = Speaker(name: "115XT HiQ", channelsUsed: 2, compatibleAmps: [la4, la4X, la12X, la8], category: .LEGACY)
        let MTD108a = Speaker(name: "MTD108a", channelsUsed: 2, compatibleAmps: [la4, la4X, la12X, la8], category: .LEGACY)
        let MTD112b = Speaker(name: "MTD112b", channelsUsed: 2, compatibleAmps: [la4, la4X, la12X, la8], category: .LEGACY)
        let AMTD115b = Speaker(name: "Active MTD115b", channelsUsed: 2, compatibleAmps: [la4, la4X, la12X, la8], category: .LEGACY)
        let PMTD115b = Speaker(name: "Passive MTD115b", channelsUsed: 1, compatibleAmps: [la4, la4X, la12X, la8], category: .LEGACY)
        let syva = Speaker(name: "Syva", channelsUsed: 1, compatibleAmps: [ la4X, la12X, la8, la7_16], category: .S)
        let a15 = Speaker(name: "A15", channelsUsed: 1, compatibleAmps: [ la4X, la12X, la8, la7_16], category: .A)
        let a10 = Speaker(name: "A10", channelsUsed: 1, compatibleAmps: [ la4X, la12X, la8, la7_16], category: .A)
        let arcsWideFocus = Speaker(name: "ARCS Wide/Focus", channelsUsed: 2, compatibleAmps: [la4, la4X, la12X, la8], category: .LEGACY)
        let arcsII = Speaker(name: "ARCS II", channelsUsed: 2, compatibleAmps: [la4X, la12X, la8], category: .LEGACY)
        let arcs = Speaker(name: "ARCS", channelsUsed: 2, compatibleAmps: [ la4X, la12X, la8], category: .LEGACY)
        let k1_sb = Speaker(name: "K1-SB", channelsUsed: 1, compatibleAmps: [la12X, la8], category: .SUB)
        let kara = Speaker(name: "KARA", channelsUsed: 2, compatibleAmps: [la4X, la12X, la8], category: .LEGACY)
        let karaII = Speaker(name: "KARA II", channelsUsed: 2, compatibleAmps: [la4X, la12X, la8, la7_16], category: .K)
        let kivaII = Speaker(name: "KIVA II", channelsUsed: 1, compatibleAmps: [la4X, la12X, la8, la7_16], category: .K)
//        let kivaKilo = Speaker(name: "Kiva/Kilo", channelsUsed: 1, compatibleAmps: [la4, la4X, la12X, la8], category: .LEGACY)
        let kudo = Speaker(name: "Kudo", channelsUsed: 1, compatibleAmps: [ la4X, la12X, la8], category: .LEGACY)
        let v_dosc = Speaker(name: "V-DOSC", channelsUsed: 2, compatibleAmps: [ la12X, la8], category: .LEGACY)
        let dv_dosc = Speaker(name: "dV-DOSC", channelsUsed: 2, compatibleAmps: [ la12X, la8], category: .LEGACY)
//        l/*et l2_l2d = Speaker(name: "L2/L2D", channelsUsed: 16, compatibleAmps: [*/la7_16], category: .L)
        let k1 = Speaker(name: "K1", channelsUsed: 4, compatibleAmps: [la12X, la8], category: .K)
        let k2 = Speaker(name: "K2", channelsUsed: 4, compatibleAmps: [la4X, la12X, la8, la7_16], category: .K)
        let k3 = Speaker(name: "K3", channelsUsed: 2, compatibleAmps: [la4X, la12X, la8, la7_16], category: .K)
        let syvaSub = Speaker(name: "SyvaSub", channelsUsed: 1, compatibleAmps: [la4X, la12X, la8, la7_16], category: .SUB)
        let syvaLow = Speaker(name: "SyvaLow", channelsUsed: 1, compatibleAmps: [la4X, la12X, la8, la7_16], category: .SUB)
        let ks28 = Speaker(name: "KS28", channelsUsed: 1, compatibleAmps: [la12X], category: .SUB)
        let sb28 = Speaker(name: "SB28", channelsUsed: 1, compatibleAmps: [la12X, la8], category: .SUB)
        let ks21 = Speaker(name: "KS21", channelsUsed: 1, compatibleAmps: [la4X, la12X, la8, la7_16], category: .SUB)
        let sb18 = Speaker(name: "SB18", channelsUsed: 1, compatibleAmps: [la4X, la12X, la8], category: .SUB)
        let sb15m = Speaker(name: "SB15", channelsUsed: 1, compatibleAmps: [la4X, la12X, la8, la7_16], category: .SUB)
        let sb218 = Speaker(name: "SB218", channelsUsed: 1, compatibleAmps: [la12X, la8], category: .LEGACY)
        let sb118 = Speaker(name: "SB118", channelsUsed: 1, compatibleAmps: [la12X, la8], category: .LEGACY)
        let sb10 = Speaker(name: "SB10", channelsUsed: 1, compatibleAmps: [la4X, la12X, la8, la7_16], category: .LEGACY)
//        let sb6 = Speaker(name: "SB6", channelsUsed: 1, compatibleAmps: [la4X, la12X, la8, la7_16], category: .LEGACY)
        let dvSub = Speaker(name: "dVSUB", channelsUsed: 1, compatibleAmps: [la12X, la8], category: .LEGACY)
        
        
        // Pour l'ampli LA4
        la4.compatibleSpeakers = [
            x4i.name,
            xt5.name,
            xt8.name,
            active12XT.name,
            passive12XT.name,
            XT112.name,
            XT115.name,
            XT115HiQ.name,
            MTD108a.name,
            MTD112b.name,
            AMTD115b.name,
            PMTD115b.name,
            arcsWideFocus.name,
//            kivaKilo.name,
            sb18.name,
            sb15m.name,
            syvaSub.name
        ]
        
        // Pour l'ampli LA4X
        la4X.compatibleSpeakers = [
            x4i.name,
            xt5.name,
            x8.name,
            x12.name,
            x15HiQ.name,
            active12XT.name,
            passive12XT.name,
            XT112.name,
            XT115.name,
            XT115HiQ.name,
            MTD108a.name,
            MTD112b.name,
            AMTD115b.name,
            PMTD115b.name,
            syva.name,
            a10.name,
            a15.name,
            arcsWideFocus.name,
//            kivaKilo.name,
            sb18.name,
            sb15m.name,
            syvaSub.name,
            arcsII.name,
            arcs.name,
            k2.name,
            k3.name,
            kara.name,
            karaII.name,
            kivaII.name,
//            kivaKilo.name,
            kudo.name,
            ks21.name,
            sb18.name,
            sb118.name,
            sb15m.name,
            syvaLow.name,
            syvaSub.name,
            sb10.name,
//            sb6.name
        ]
        
        
        // Pour l'ampli LA12X
        la12X.compatibleSpeakers = [
            x4i.name,
            xt5.name,
            x8.name,
            x12.name,
            x15HiQ.name,
            xt8.name,
            active12XT.name,
            passive12XT.name,
            XT112.name,
            XT115.name,
            XT115HiQ.name,
            MTD108a.name,
            MTD112b.name,
            AMTD115b.name,
            PMTD115b.name,
            syva.name,
            a10.name,
            a15.name,
            arcsWideFocus.name,
            arcsII.name,
            arcs.name,
            k1.name,
            k1_sb.name,
            k2.name,
            k3.name,
            kara.name,
            karaII.name,
            kivaII.name,
//            kivaKilo.name,
            kudo.name,
            v_dosc.name,
            dv_dosc.name,
            ks28.name,
            sb28.name,
            ks21.name,
            sb18.name,
            sb218.name,
            sb118.name,
            sb15m.name,
            syvaLow.name,
            syvaSub.name,
            sb10.name,
//            sb6.name,
            dvSub.name
        ]
        
        
        
        // Pour l'ampli LA8
        la8.compatibleSpeakers = [
            x4i.name,
            xt5.name,
            x8.name,
            x12.name,
            x15HiQ.name,
            xt8.name,
            active12XT.name,
            passive12XT.name,
            XT112.name,
            XT115.name,
            XT115HiQ.name,
            MTD108a.name,
            MTD112b.name,
            AMTD115b.name,
            PMTD115b.name,
            syva.name,
            arcsWideFocus.name,
            a10.name,
            a15.name,
            arcsII.name,
            arcs.name,
//            kivaKilo.name,
            k1.name,
            k1_sb.name,
            k2.name,
            k3.name,
            kara.name,
            karaII.name,
            kivaII.name,
//            kivaKilo.name,
            kudo.name,
            v_dosc.name,
            dv_dosc.name,
            sb28.name,
            ks21.name,
            sb18.name,
            sb218.name,
            sb118.name,
            sb15m.name,
            syvaLow.name,
            syvaSub.name,
            sb10.name,
            dvSub.name,
            sb18.name,
            sb15m.name,
            syvaSub.name]
        
        la7_16.compatibleSpeakers = [
            x4i.name,
            xt5.name,
            x8.name,
            x12.name,
            x15HiQ.name,
            syva.name,
            a10.name,
            a15.name,
            k1.name,
            k1_sb.name,
            k2.name,
            k3.name,
//            kara.name,
            karaII.name,
            kivaII.name,
            x4i.name,
            xt5.name,
//            kivaKilo.name,
            kudo.name,
            v_dosc.name,
            dv_dosc.name,
//            l2_l2d.name
        ]
        
        
        self.speakers = [
            x4i,
            xt5,
            x8,
            x12,
            x15HiQ,
            xt8,
            active12XT,
            passive12XT,
            XT112,
            XT115,
            XT115HiQ,
            MTD108a,
            MTD112b,
            AMTD115b,
            PMTD115b,
            syva,
            k1,
            k1_sb,
            k2,
            k3,
            karaII,
            kara,
            a15,
            a10,
            arcsWideFocus,
            arcsII,
            arcs,
            kivaII,
//            kivaKilo,
            kudo,
            v_dosc,
            dv_dosc,
            ks28,
            sb28,
            ks21,
            sb18,
            sb218,
            sb118,
            sb15m,
            syvaLow,
            syvaSub,
            sb10,
//            sb6,
            dvSub,
//            l2_l2d
        ]
        
    }
}
