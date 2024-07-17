import SwiftUI

struct PrealignementDelayView: View {
    let speakerOptions = ["L2", "K1", "K2", "K3", "KARA II", "KIVA II", "A15", "A10", "X15", "X12"]
    let subOptions = ["SB28", "KS28", "SB18", "KS21", "SB15M"]
    let subPresets = ["60", "60C", "60Cx", "100", "100C", "100Cx"]
    
    let speakerSubCompatibility: [String: [String]] = [
        "L2": ["KS28"],
        "K1": ["SB28", "KS28"],
        "K2": ["SB28", "KS28"],
        "K3": ["KS28", "KS21"],
        "KARA II": ["SB18", "KS21", "SB28", "KS28"],
        "KIVA II": ["SB15M"],
        "A15": ["KS21"],
        "A10": ["KS21"],
        "X15": ["SB18", "KS21"],
        "X12": ["SB18", "KS21", "SB15M"]
    ]
    
    @State private var selectedSpeaker = 0
    @State private var selectedSub = 0
    @State private var selectedSubPreset = 0
    @State private var selectedConfiguration = 0
    
    var validSubsForSelectedSpeaker: [String] {
        let selectedSpeakerOption = speakerOptions[selectedSpeaker]
        let subsForSpeaker = topDelayData[selectedSpeakerOption]?.flatMap { $0.value.keys } ?? []
        let sortedSubs = Array(Set(subsForSpeaker)).sorted()
        return sortedSubs
    }
    
    var validPresetsForSelectedSubAndSpeaker: [String] {
        guard validSubsForSelectedSpeaker.indices.contains(selectedSub) else { return [] }
        let selectedSubOption = validSubsForSelectedSpeaker[selectedSub]
        let selectedSpeakerOption = speakerOptions[selectedSpeaker]
        
        // Filtrer les presets basés sur la présence de valeurs de délai pour le sub et le haut-parleur sélectionnés
        let presetsForSubAndSpeaker = topDelayData[selectedSpeakerOption]?.compactMap { preset, subDelays in
            let delayValue = subDelays[selectedSubOption]
            return delayValue != nil && delayValue! >= 0 ? preset : nil
        }
        
        let sortedPresets = presetsForSubAndSpeaker?.sorted() ?? []
        return sortedPresets
    }
    
    func updateSubsAndPresets(speakerIndex: Int) {
        selectedSpeaker = speakerIndex
        
        let validSubs = validSubsForSelectedSpeaker
        selectedSub = !validSubs.isEmpty ? subOptions.firstIndex(where: validSubs.contains) ?? 0 : 0
        updatePresetsForSelectedSub()
    }
    
    func updatePresetsForSelectedSub() {
        guard validSubsForSelectedSpeaker.indices.contains(selectedSub) else {
            selectedSubPreset = 0
            return
        }
        let validPresets = validPresetsForSelectedSubAndSpeaker
        selectedSubPreset = !validPresets.isEmpty ? subPresets.firstIndex(where: validPresets.contains) ?? 0 : 0
    }
    
    
    
    var body: some View {
        VStack {
            ScrollView {
            VStack{
                Text("Alignement Data")
                    .font(.largeTitle)
                    .bold()
                    .padding(10)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(Color.gray, lineWidth: 1)
//                    )
            }
            Spacer(minLength: 30)
                
                VStack {
                    HStack {
                        Button(action: {
                            if selectedSpeaker > 0 {
                                selectedSpeaker -= 1
                            }
                        }) {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.gray)
                                .opacity(speakerOptions.count > 1 ? 1 : 0)
                        }
                        
                        Text("L-ACOUSTICS SPEAKER")
                            .foregroundColor(.white)
                        
                        Button(action: {
                            if selectedSpeaker < speakerOptions.count - 1 {
                                selectedSpeaker += 1
                            }
                        }) {
                            Image(systemName: "arrow.right")
                                .foregroundColor(.gray)
                                .opacity(speakerOptions.count > 1 ? 1 : 0)
                        }
                    }
                    
                    ScrollView(.horizontal, showsIndicators: true) {
                        Picker("Speaker", selection: $selectedSpeaker) {
                            ForEach(0..<speakerOptions.count, id: \.self) { index in
                                Text(self.speakerOptions[index]).tag(index)
                            }
                        }
                        .onChange(of: selectedSpeaker) { newValue in
                            updateSubsAndPresets(speakerIndex: newValue)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        //                           }
                        //                       }
                        
                        //                               .onChange(of: selectedSpeaker) { newValue in
                        //                                   selectedSub = 0
                        //                                   selectedSubPreset = 0
                        //                               }
                        .onChange(of: selectedSpeaker) { newValue in
                            // Update available subs based on the selected speaker.
                            let validSubs = speakerSubCompatibility[speakerOptions[selectedSpeaker]] ?? []
                            // If the current selected sub is not in the new list of valid subs, reset selection.
                            if !validSubs.contains(where: { $0 == subOptions[selectedSub] }) {
                                selectedSub = 0 // Reset to default or another appropriate value.
                                selectedSubPreset = 0 // Similarly, reset the preset if needed.
                            }
                            // Proceed with any additional updates or UI feedback as necessary.
                        }
                        
                        
                        
                    }
                }
                
                // Sélection du sub
                Text("SUB")
                    .foregroundColor(.white)
                
                Picker("Sub", selection: $selectedSub) {
                    ForEach(0..<validSubsForSelectedSpeaker.count, id: \.self) {
                        Text(self.validSubsForSelectedSpeaker[$0])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
                
                // Sélection du preset
                Picker("Sub Presets", selection: $selectedSubPreset) {
                    ForEach(0..<validPresetsForSelectedSubAndSpeaker.count, id: \.self) {
                        Text(self.validPresetsForSelectedSubAndSpeaker[$0]).tag($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
                
                if let selectedSubOption = validSubsForSelectedSpeaker.indices.contains(selectedSub) ? validSubsForSelectedSpeaker[selectedSub] : nil,
                   let selectedPresetOption = validPresetsForSelectedSubAndSpeaker.indices.contains(selectedSubPreset) ? validPresetsForSelectedSubAndSpeaker[selectedSubPreset] : nil {
                    PhaseDelayView(
                        selectedSpeaker: speakerOptions[selectedSpeaker],
                        selectedSub: selectedSubOption,
                        selectedPreset: selectedPresetOption
                    )
                } else {
                    // Gérer le cas où les sélections ne sont pas valides
                    Text("Select Sub/Preset").padding()
                }
            }
        }
    }
}

struct PhaseDelayView: View {
    var selectedSpeaker: String
    var selectedSub: String
    var selectedPreset: String
    
    
    var body: some View {
        let topPhase = topPhaseData[selectedSpeaker]?[selectedPreset]?[selectedSub] ?? "?"
        let subPhase = subPhaseData[selectedSub]?[selectedPreset]?[selectedSpeaker] ?? "?"
        let topDelay = topDelayData[selectedSpeaker]?[selectedPreset]?[selectedSub] ?? 0.0
        let subDelay = subDelayData[selectedSub]?[selectedPreset]?[selectedSpeaker] ?? 0.0
        VStack(alignment: .leading) {
            HStack {
                Text(" ")
                    .frame(maxWidth: .infinity)
                Text(selectedSpeaker)
                    .frame(maxWidth: .infinity)
                Text(selectedSub)
                    .frame(maxWidth: .infinity)
            }
            .font(.body)
            .padding(10)
            //                        .blur(radius: 0.1)
            HStack {
                Text("Delay     ")
                    .frame(maxWidth: .infinity)
                Text("\(topDelay, specifier: "%.1f") ms")
                    .frame(maxWidth: .infinity)
                Text("\(subDelay, specifier: "%.1f") ms")
                    .frame(maxWidth: .infinity)
            }
            .font(.body)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
            HStack {
                Text("Phase")
                    .frame(maxWidth: .infinity)
                Text(topPhase)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(topPhase != "?" ? (topPhase == "+" ? Color.gray.opacity(0.5) : Color.red.opacity(0.8)) : Color.blue.opacity(0.5))
                    .cornerRadius(5)
                    .bold()
                Text(subPhase)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(subPhase != "?" ? (subPhase == "+" ? Color.gray.opacity(0.5) : Color.red.opacity(0.8)) : Color.blue.opacity(0.5))
                    .cornerRadius(5)
                    .bold()
            }
            .font(.body)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
        }
    }
}
