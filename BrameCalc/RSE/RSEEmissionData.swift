import SwiftUI


struct EmissionFactors {
    static let tentEmissionFactor = 20.0 // kg CO2 per m2
    static let stageEmissionFactor = 500.0 // kg CO2 per stage
    static let attendeeEmissionFactor = 0.5 // kg CO2 per attendee per hour
    static let lightingEmissionFactor = 50.0 // kg CO2 per hour
    static let soundEmissionFactor = 30.0 // kg CO2 per hour
    static let videoProjectionEmissionFactor = 40.0 // kg CO2 per hour
}
