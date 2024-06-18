//import Foundation
//
//extension ScheduleView {
//    func endTimeOfLastShow(on Stage: String) -> Date? {
//        var StagesToCheck = [Stage]
//        if Stage == "Stage 1" {
//            StagesToCheck.append("Stage 2")
//        } else if Stage == "Stage 2" {
//            StagesToCheck.append("Stage 1")
//        }
//        
//        var lastEndTimes: [Date] = []
//        for Stage in StagesToCheck {
//            let showsOnStage = artists.filter { $0.Stage == Stage }
//            if let lastShow = showsOnStage.sorted(by: { $0.showTime < $1.showTime }).last {
//                let endTime = lastShow.showTime.addingTimeInterval(lastShow.showDuration)
//                lastEndTimes.append(endTime)
//            }
//        }
//        
//        return lastEndTimes.max()
//    }
//    
//    
//    func doesShowOverlap(with showTime: Date, duration: TimeInterval) -> Bool {
//        let newShowEndTime = showTime.addingTimeInterval(duration)
//        for artist in artists {
//            let showEndTime = artist.showTime.addingTimeInterval(artist.showDuration)
//            if (showTime >= artist.showTime && showTime < showEndTime) ||
//                (newShowEndTime > artist.showTime && newShowEndTime <= showEndTime) {
//                return true
//            }
//        }
//        return false
//    }
//    func doesSoundcheckOverlapWithSoundcheck(startTime: Date, duration: TimeInterval, on Stage: String) -> Bool {
//        let newSoundcheckEndTime = startTime.addingTimeInterval(duration)
//        for artist in artists {
//            if let soundcheckStartTime = artist.soundcheckStartTime {
//                let soundcheckEndTime = soundcheckStartTime.addingTimeInterval(artist.soundcheckDuration)
//                if (startTime >= soundcheckStartTime && startTime < soundcheckEndTime) ||
//                    (newSoundcheckEndTime > soundcheckStartTime && newSoundcheckEndTime <= soundcheckEndTime) {
//                    if artist.Stage != Stage {
//                        return true
//                    }
//                }
//            }
//        }
//        return false
//    }
//
//    func doesSoundcheckOverlapWithShow(startTime: Date, duration: TimeInterval, on Stage: String) -> Bool {
//        let newSoundcheckEndTime = startTime.addingTimeInterval(duration)
//        for artist in artists {
//            let showEndTime = artist.showTime.addingTimeInterval(artist.showDuration)
//            if (startTime >= artist.showTime && startTime < showEndTime) ||
//                (newSoundcheckEndTime > artist.showTime && newSoundcheckEndTime <= showEndTime) {
//                if artist.Stage != Stage {
//                    return true
//                }
//            }
//        }
//        return false
//    }
//    func findNonOverlappingTime(for artist: ArtistInfo, startingFrom initialTime: Date) -> Date {
//        var adjustedTime = initialTime
//        var iterationCount = 0
//        let overlapOption = UserDefaults.standard.string(forKey: "overlapSoundcheckOption") ?? "Aucun"
//
//        while iterationCount < Constants.maxIterations {
//            let showOverlap = doesShowOverlap(with: adjustedTime, duration: artist.showDuration, on: artist.Stage)
//            var soundcheckOverlap = false
//            
//            switch overlapOption {
//            case "Aucun":
//                soundcheckOverlap = doesSoundcheckOverlapWithSoundcheck(startTime: adjustedTime, duration: artist.soundcheckDuration, on: artist.Stage) ||
//                                    doesSoundcheckOverlapWithShow(startTime: adjustedTime, duration: artist.soundcheckDuration, on: artist.Stage)
//            case "Avec Show":
//                soundcheckOverlap = doesSoundcheckOverlapWithSoundcheck(startTime: adjustedTime, duration: artist.soundcheckDuration, on: artist.Stage)
//            case "Avec Soundcheck":
//                soundcheckOverlap = doesSoundcheckOverlapWithShow(startTime: adjustedTime, duration: artist.soundcheckDuration, on: artist.Stage)
//            default:
//                break
//            }
//            
//            if !showOverlap && !soundcheckOverlap {
//                break
//            }
//            
//            adjustedTime = adjustedTime.addingTimeInterval(5 * 60) // Increment by 5 minutes
//            iterationCount += 1
//        }
//        
//        if iterationCount == Constants.maxIterations {
//            print("Error: Unable to find non-overlapping time for \(artist.name).")
//        }
//        
//        return adjustedTime
//    }
//
//
//    func adjustSoundcheckStartTime(for artist: inout ArtistInfo, with overlapOption: String) {
//        let soundcheckDuration = artist.soundcheckDuration
//        var soundcheckStartTime = artist.showTime.addingTimeInterval(-soundcheckDuration)
//        
//        switch overlapOption {
//        case "Aucun":
//            while doesSoundcheckOverlapWithSoundcheck(startTime: soundcheckStartTime, duration: soundcheckDuration, on: artist.Stage) ||
//                  doesSoundcheckOverlapWithShow(startTime: soundcheckStartTime, duration: soundcheckDuration, on: artist.Stage) {
//                soundcheckStartTime = soundcheckStartTime.addingTimeInterval(-5 * 60) // Decrement by 5 minutes
//            }
//            
//        case "Avec Show":
//            while doesSoundcheckOverlapWithSoundcheck(startTime: soundcheckStartTime, duration: soundcheckDuration, on: artist.Stage) {
//                soundcheckStartTime = soundcheckStartTime.addingTimeInterval(-5 * 60) // Decrement by 5 minutes
//            }
//            
//        case "Avec Soundcheck":
//            while doesSoundcheckOverlapWithShow(startTime: soundcheckStartTime, duration: soundcheckDuration, on: artist.Stage) {
//                soundcheckStartTime = soundcheckStartTime.addingTimeInterval(-5 * 60) // Decrement by 5 minutes
//            }
//            
//        default: // "Tous" ou autre valeur
//            // Pas besoin de changer soundcheckStartTime
//            break
//        }
//        
//        artist.soundcheckStartTime = soundcheckStartTime
//    }
//
//    /// Vérifie si un spectacle chevauche d'autres spectacles.
//    func doesShowOverlap(with showTime: Date, duration: TimeInterval, on Stage: String) -> Bool {
//        let newShowEndTime = showTime.addingTimeInterval(duration)
//        for artist in artists {
//            let showEndTime = artist.showTime.addingTimeInterval(artist.showDuration)
//            if (showTime >= artist.showTime && showTime < showEndTime) ||
//                (newShowEndTime > artist.showTime && newShowEndTime <= showEndTime) {
//                if artist.Stage == Stage {
//                    return true
//                }
//            }
//        }
//        return false
//    }
//    
////    /// Vérifie si la configuration chevauche le soundcheck.
////    func doesSetupOverlapWithSoundcheck(setupStartTime: Date, duration: TimeInterval, on Stage: String) -> Bool {
////        for artist in artists {
////            if artist.Stage != Stage, let soundcheckStart = artist.soundcheckStartTime {
////                let soundcheckEndTime = soundcheckStart.addingTimeInterval(artist.soundcheckDuration)
////                if setupStartTime >= soundcheckStart && setupStartTime < soundcheckEndTime {
////                    return true
////                }
////                let newSetupEndTime = setupStartTime.addingTimeInterval(duration)
////                if newSetupEndTime > soundcheckStart && newSetupEndTime <= soundcheckEndTime {
////                    return true
////                }
////            }
////        }
////        return false
////    }
////    /// Vérifie si un soundcheck chevauche d'autres soundchecks ou spectacles.
////    func doesSoundcheckOverlap(with startTime: Date, duration: TimeInterval, on Stage: String) -> Bool {
////        let newSoundcheckEndTime = startTime.addingTimeInterval(duration)
////        for artist in artists {
////            let showEndTime = artist.showTime.addingTimeInterval(artist.showDuration)
////            if (startTime >= artist.showTime && startTime < showEndTime) ||
////                (newSoundcheckEndTime > artist.showTime && newSoundcheckEndTime <= showEndTime) ||
////                (startTime >= artist.soundcheckStartTime! && startTime < artist.soundcheckStartTime!.addingTimeInterval(artist.soundcheckDuration)) ||
////                (newSoundcheckEndTime > artist.soundcheckStartTime! && newSoundcheckEndTime <= artist.soundcheckStartTime!.addingTimeInterval(artist.soundcheckDuration)) {
////                if artist.Stage == Stage {
////                    return true
////                }
////            }
////        }
////        return false
////    }
//
//    /// Vérifie si un soundcheck chevauche d'autres soundchecks.
////    func doesSoundcheckOverlapWithSoundcheck(startTime: Date, duration: TimeInterval, on Stage: String) -> Bool {
////        let newSoundcheckEndTime = startTime.addingTimeInterval(duration)
////        for artist in artists {
////            if let soundcheckStartTime = artist.soundcheckStartTime {
////                let soundcheckEndTime = soundcheckStartTime.addingTimeInterval(artist.soundcheckDuration)
////                if (startTime >= soundcheckStartTime && startTime < soundcheckEndTime) ||
////                    (newSoundcheckEndTime > soundcheckStartTime && newSoundcheckEndTime <= soundcheckEndTime) {
////                    if artist.Stage == Stage {
////                        return true
////                    }
////                }
////            }
////        }
////        return false
////    }
//
//}
//// MARK: - Constants
//
//extension ViewController {
//    struct Constants {
//        static let changeOverTime: TimeInterval = 15 * 60 // 15 minutes
//        static let maxIterations: Int = 100
//    }
//}
