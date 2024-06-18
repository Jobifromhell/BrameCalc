//import SwiftUI
//import Combine

import SwiftUI

struct ScheduleView: View {
    var body: some View {
        Text("PLANNER VIEW")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding()
    
    }
}


//    @StateObject private var artistManager = ArtistManager()
//    @State private var artistName: String = ""
//    @State private var setupDuration: String = "00:15"
//    @State private var soundcheckDuration: String = "00:45"
//    @State private var showDuration: String = "01:00"
//    @State private var showTime: String = "20:00"
//    @State private var stage: String = "Stage 1"
//    @State private var showPreferences = false
//    @State private var showFestivalPreferences = false
//    
//    var body: some View {
//        VStack {
//            HStack {
//                TextField("Artiste", text: $artistName)
//                TextField("Durée de setup", text: $setupDuration)
//                TextField("Durée de soundcheck", text: $soundcheckDuration)
//                TextField("Heure de show", text: $showTime)
//                TextField("Durée de show", text: $showDuration)
//                TextField("Stage", text: $stage)
//                Button("Ajouter Artiste") {
//                    addArtist()
//                }
//            }
//            .padding()
//
//            List(artistManager.artists) { artist in
//                HStack {
//                    Text(artist.name)
//                    Text("\(artist.setupDuration / 60, specifier: "%.0f") min")
//                    Text("\(artist.soundcheckDuration / 60, specifier: "%.0f") min")
//                    Text("\(artist.showTime, formatter: dateFormatter)")
//                    Text("\(artist.showDuration / 60, specifier: "%.0f") min")
//                    Text(artist.stage)
//                }
//            }
//            
//            HStack {
//                Button("Préférences") {
//                    showPreferences.toggle()
//                }
//                .sheet(isPresented: $showPreferences) {
//                    PreferencesView()
//
//                }
//                
//                Button("Préférences Festival") {
//                    showFestivalPreferences.toggle()
//                }
//                .sheet(isPresented: $showFestivalPreferences) {
//                    PreferencesFestivalView()
//                }
//            }
//            .padding()
//        }
//        .padding()
//    }
//    
//    func addArtist() {
//        guard let showDate = dateFormatter.date(from: showTime) else {
//            print("Erreur : Impossible de convertir \(showTime) en Date.")
//            return
//        }
//        
//        let setupInterval = timeInterval(from: setupDuration)
//        let soundcheckInterval = timeInterval(from: soundcheckDuration)
//        let showInterval = timeInterval(from: showDuration)
//        
//        let artist = ArtistInfo(name: artistName,
//                                setupDuration: setupInterval,
//                                soundcheckDuration: soundcheckInterval,
//                                showTime: showDate,
//                                showDuration: showInterval,
//                                setupStartTime: nil,
//                                soundcheckStartTime: nil,
//                                stage: stage)
//        
//        artistManager.artists.append(artist)
//    }
//    
////    func timeInterval(from string: String) -> TimeInterval {
////        let components = string.split(separator: ":")
////        guard components.count == 2,
////              let minutes = Double(components[0]),
////              let seconds = Double(components[1]) else {
////            return 0
////        }
////        return (minutes * 60) + seconds
////    }
//    
//    var dateFormatter: DateFormatter {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "HH:mm"
//        return formatter
//    }
//}
//
//
//
//
//
