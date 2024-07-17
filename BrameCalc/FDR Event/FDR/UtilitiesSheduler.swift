//import Foundation
//
//extension ScheduleView {
//    func generateTimeDurations() -> [String] {
//        var durations: [String] = []
//        for hour in 0...3 {
//            for minute in stride(from: 0, to: 60, by: 5) {
//                let durationString = String(format: "%02d:%02d", hour, minute)
//                durations.append(durationString)
//            }
//        }
//        return durations
//    }
//    func generateBreakDurations() -> [String] {
//        var durations: [String] = []
//        for minute in stride(from: 5, to: 180, by: 5) {
//            let durationString = String(format: "00:%02d", minute)
//            durations.append(durationString)
//        }
//        return durations
//    }
//    
//    
//    func generateTimeSlots() -> [String] {
//        var times: [String] = []
//        for hour in 0...23 {
//            for minute in stride(from: 0, to: 60, by: 5) {
//                let timeString = String(format: "%02d:%02d", hour, minute)
//                times.append(timeString)
//            }
//        }
//        return times
//    }
//    func timeInterval(from timeString: String) -> TimeInterval {
//        if let interval = safeTimeInterval(from: timeString) {
//            return interval
//        } else {
//            // Gérez l'erreur ici, par exemple en affichant un message à l'utilisateur
//            // ou en renvoyant une valeur par défaut.
//            return 0.0 // ou toute autre valeur par défaut que vous jugez appropriée
//        }
//    }
//    
//    
//    func safeTimeInterval(from timeString: String) -> TimeInterval? {
//        let components = timeString.split(separator: ":")
//        guard components.count == 2,
//              let hours = Int(components[0]),
//              let minutes = Int(components[1]) else {
//            return nil
//        }
//        return TimeInterval(hours * 3600 + minutes * 60)
//    }
//    
//    func updateArtistsList() {
//        let sortedArtists = artists.sorted {
//            if $0.showTime == $1.showTime {
//                return $0.Stage < $1.Stage
//            }
//            return $0.showTime < $1.showTime
//        }
//        
//        let displayText = sortedArtists.map { artist in
//            let showDurationString = string(fromTimeInterval: artist.showDuration)
//            return "\(artist.name) - \(artist.Stage) - Show: \(dateFormatter.string(from: artist.showTime)) (Duration: \(showDurationString))"
//        }
//        //        artistsList.string = displayText.joined(separator: "\n")
//        //        artistsList.textColor = NSColor.labelColor
//    }
//    
//    
//    func string(fromTimeInterval interval: TimeInterval) -> String {
//        let hours = Int(interval) / 3600
//        let minutes = (Int(interval) % 3600) / 60
//        return String(format: "%02d:%02d", hours, minutes)
//    }
//}
//
