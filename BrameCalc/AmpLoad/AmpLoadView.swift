import SwiftUI

struct AmpLoadCalcView: View {
    @StateObject private var data = AmpLoadData()
    @State private var selectedAmpIndex = 0
    @State private var selectedSpeakerIndex = 0
    @State private var selectedCategory: Category = .K {
        didSet {
            selectedSpeakerIndex = 0
        }
    }
    
    
    // Utilisation de la fonction pour obtenir des haut-parleurs filtrés
    var filteredSpeakers: [Speaker] {
        return getSpeakers(for: selectedCategory)
    }
    
    func getSpeakers(for category: Category) -> [Speaker] {
        let filtered = data.speakers.filter { $0.category == category }
        print("Filtered speakers for category \(category): \(filtered)")  // Debugging
        return filtered
    }
    
    // Gestion des erreurs pour les indices
    var selectedSpeaker: Speaker {
        guard selectedSpeakerIndex < filteredSpeakers.count else {
            return Speaker.defaultSpeaker
        }
        return filteredSpeakers[selectedSpeakerIndex]
    }
    
    var selectedAmp: Amp {
        guard selectedAmpIndex < selectedSpeaker.compatibleAmps.count else {
            return Amp.defaultAmp
        }
        return selectedSpeaker.compatibleAmps[selectedAmpIndex]
    }
    
    
    var maxSpeakerCount: Int {
        return selectedAmp.maxSpeakerLoads[selectedSpeaker.name]?.total ?? 0
    }
    
    var speakersPerChannel: Int {
        return (selectedAmp.maxSpeakerLoads[selectedSpeaker.name]?.perChannel ?? 0) / selectedSpeaker.channelsUsed
    }
    
    
    enum Category: String, CaseIterable, Identifiable {
        case K, A, X, S, SUB, LEGACY
        
        var id: String { self.rawValue }
    }
    
    var body: some View {
        VStack {
            ScrollView{

            HeaderView()
            //            Spacer()
                
                CategoryPicker(selectedCategory: $selectedCategory)
                    .onChange(of: selectedCategory) { newValue in
                        selectedSpeakerIndex = 0
                        selectedAmpIndex = 0
                        // Additional logic if needed
                    }
                
                
                
                SpeakerAndAmpPicker(
                    selectedSpeakerIndex: $selectedSpeakerIndex,
                    selectedAmpIndex: $selectedAmpIndex,
                    filteredSpeakers: filteredSpeakers,
                    selectedSpeaker: selectedSpeaker
                )
                //            Spacer()
                InfoView(
                    selectedAmp: selectedAmp,
                    selectedSpeaker: selectedSpeaker
                    //                speakersPerChannel: speakersPerChannel,
                    //                maxSpeakerCount: maxSpeakerCount
                )
                Spacer()
                
            }
        }
    }
}
struct HoverEffectButton: View {
    var title: String
    @State private var isHovering = false

    var body: some View {
        Text(title)
            .padding()
            .font(.system(size: isHovering ? 20 : 16))
            .background(isHovering ? Color.gray.opacity(0.3) : Color.clear)
            .cornerRadius(10)
            .onLongPressGesture(minimumDuration: 0.1, pressing: { isPressing in
                withAnimation {
                    isHovering = isPressing
                }
            }) { }
    }
}

struct HeaderView: View {
    var body: some View {
        VStack {
            Text("AmpLoad")
                .font(.largeTitle)
                .bold()
                .padding(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
            
            Text("Enclosure drive capacity per L-Acoustics amplified controller")
                .font(.system(size: 12))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(10)
        }
    }
}

struct CategoryPicker: View {
    @Binding var selectedCategory: AmpLoadCalcView.Category
    
    var body: some View {
            
           


        VStack {
            Text("L-ACOUSTICS SERIES")
            Picker("Catégorie", selection: $selectedCategory) {
                ForEach(AmpLoadCalcView.Category.allCases) { category in
                    Text(category.rawValue.uppercased()).tag(category)
                }
            }
            
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
            //        Spacer()
        }

       }
   }
struct SpeakerAndAmpPicker: View {
    @Binding var selectedSpeakerIndex: Int
    @Binding var selectedAmpIndex: Int
    var filteredSpeakers: [Speaker]
    var selectedSpeaker: Speaker

    var body: some View {
        VStack {
            VStack {
                            Text("SPEAKER")
                    .padding()
                            Picker("Select speaker", selection: $selectedSpeakerIndex) {
                                ForEach(0..<filteredSpeakers.count, id: \.self) { index in
                                    Text(filteredSpeakers[index].name)
//                                        .font(.system(size: 30))
                                        .tag(index)
                                        .padding(20)
//                                        .frame(maxWidth: 50)
                                }
                            }
//                            .pickerStyle(WheelPickerStyle())
                            .frame(minHeight: 60)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                                
                            )
                        }

            VStack {
                Text("AMPLIFIER")
                    .padding()
                Picker("Select amp", selection: $selectedAmpIndex) {
                    ForEach(0..<selectedSpeaker.compatibleAmps.count, id: \.self) { index in
                        Text(selectedSpeaker.compatibleAmps[index].name).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
            }
        }
        .padding()
    }
}


struct InfoView: View {

    var selectedAmp: Amp
    var selectedSpeaker: Speaker
    var speakersPerChannel: Int {
        // Supposons que selectedAmp.maxSpeakerLoads[selectedSpeaker.name] retourne un objet LoadInfo
        return selectedAmp.maxSpeakerLoads[selectedSpeaker.name]?.perChannel ?? 0
    }
    var maxSpeakerCount: Int {
        // Supposons que selectedAmp.maxSpeakerLoads[selectedSpeaker.name] retourne un objet LoadInfo
        return selectedAmp.maxSpeakerLoads[selectedSpeaker.name]?.total ?? 0
    }
    var body: some View {
        VStack {
            Text("# CH USED: \(selectedSpeaker.channelsUsed)")
                .font(.headline) // Taille de police plus grande pour les titres
                .padding(.bottom, 2)

            Divider() // Utiliser Divider au lieu de Text pour une séparation

            Text("PER OUTPUT: \(speakersPerChannel)")
                .font(.headline) // Police un peu plus grande pour les sous-titres
                .padding(.vertical, 2) // Ajouter un espace vertical
            Divider() // Utiliser Divider au lieu de Text pour une séparation

            Text("TOTAL: \(maxSpeakerCount)")
                .font(.headline)
                .padding(.bottom, 2)

            Spacer()
            
            Text("Maximum Load @ High SPL")
                .font(.callout)
                            .padding()
        }
        .padding()
        .background(Color.black.opacity(5)) // Fond semi-transparent noir pour le mode sombre
        .foregroundColor(.white) // Texte en blanc pour le mode sombre
        .cornerRadius(10) // Coins arrondis pour le fond
        .shadow(radius: 5) // Ombre légère pour donner de la profondeur
        .preferredColorScheme(.dark) // Utiliser le thème sombre
        //                .padding()
//        Text("Enceinte : \(selectedSpeakerInfo.name)")
//            Text("Max SPL : \(selectedSpeakerInfo.maxSPL) dB")
//            Text("Bandwidth : \(selectedSpeakerInfo.bandwidth.low) Hz - \(selectedSpeakerInfo.bandwidth.high) Hz")
//        Text("Transducteurs : LF: \(selectedSpeakerInfo.transducers["LF"] ?? "N/A"), HF: \(selectedSpeakerInfo.transducers["HF"] ?? "N/A")")
//            Text("Poids : \(selectedSpeakerInfo.weight) kg")
//            Text("Directivité : H: \(selectedSpeakerInfo.directivity.H.map { String($0) }.joined(separator: ", "))°, V: \(selectedSpeakerInfo.directivity.V)°")

    }
}

struct AmpLoadCalcView_Previews: PreviewProvider {
    static var previews: some View {
        AmpLoadCalcView()
    }
}
