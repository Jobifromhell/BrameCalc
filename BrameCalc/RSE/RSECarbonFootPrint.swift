import Foundation

struct CarbonFootprintCalculator {
    static func calculateCO2(tentSize: (width: Double, depth: Double, height: Double),
                             stageType: String,
                             attendeeCount: Int,
                             eventDurationHours: Double) -> Double {
        
        let tentArea = tentSize.width * tentSize.depth
        let tentCO2 = tentArea * EmissionFactors.tentEmissionFactor
        
        let stageCO2: Double
        switch stageType {
        case "AlphaStage240":
            stageCO2 = EmissionFactors.stageEmissionFactor
        default:
            stageCO2 = 0.0
        }
        
        let attendeeCO2 = Double(attendeeCount) * eventDurationHours * EmissionFactors.attendeeEmissionFactor
        let lightingCO2 = eventDurationHours * EmissionFactors.lightingEmissionFactor
        let soundCO2 = eventDurationHours * EmissionFactors.soundEmissionFactor
        let videoProjectionCO2 = eventDurationHours * EmissionFactors.videoProjectionEmissionFactor
        
        return tentCO2 + stageCO2 + attendeeCO2 + lightingCO2 + soundCO2 + videoProjectionCO2
    }
}
