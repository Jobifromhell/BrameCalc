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

    var filteredSpeakers: [Speaker] {
        return getSpeakers(for: selectedCategory)
    }
    
    func getSpeakers(for category: Category) -> [Speaker] {
        let filtered = data.speakers.filter { $0.category == category }
        return filtered
    }
    
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
        VStack(spacing: 20) {
            HStack {
                Text("AmpLoad")
                    .font(.largeTitle)
                    .bold()
                    .padding()
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(Color.gray, lineWidth: 1)
//                    )
                Text("Enclosure drive capacity per L-Acoustics amplified controller")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(10)
//                Spacer()
            }
            .padding(.horizontal)

            Divider()
            
            VStack(alignment: .leading) {
                
                
                CategoryPicker(selectedCategory: $selectedCategory)
                    .onChange(of: selectedCategory) { newValue in
                        selectedSpeakerIndex = 0
                        selectedAmpIndex = 0
                    }
                
                SpeakerAndAmpPicker(
                    selectedSpeakerIndex: $selectedSpeakerIndex,
                    selectedAmpIndex: $selectedAmpIndex,
                    filteredSpeakers: filteredSpeakers,
                    selectedSpeaker: selectedSpeaker
                )
                
                InfoView(
                    selectedAmp: selectedAmp,
                    selectedSpeaker: selectedSpeaker
                )
                
                Spacer()
            }
            .padding()
        }
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
                .font(.headline)
                .padding(.bottom, 5)
            
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
        }
        .padding()
    }
}

struct SpeakerAndAmpPicker: View {
    @Binding var selectedSpeakerIndex: Int
    @Binding var selectedAmpIndex: Int
    var filteredSpeakers: [Speaker]
    var selectedSpeaker: Speaker

    var body: some View {
        VStack(spacing: 20) {
            VStack {
                Text("SPEAKER")
                    .font(.headline)
                    .padding(.bottom, 5)
                
                Picker("Select speaker", selection: $selectedSpeakerIndex) {
                    ForEach(0..<filteredSpeakers.count, id: \.self) { index in
                        Text(filteredSpeakers[index].name)
                            .tag(index)
                            .padding(10)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
            }

            VStack {
                Text("AMPLIFIER")
                    .font(.headline)
                    .padding(.bottom, 5)
                
                Picker("Select amp", selection: $selectedAmpIndex) {
                    ForEach(0..<selectedSpeaker.compatibleAmps.count, id: \.self) { index in
                        Text(selectedSpeaker.compatibleAmps[index].name)
                            .tag(index)
                            .padding(10)
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
        return selectedAmp.maxSpeakerLoads[selectedSpeaker.name]?.perChannel ?? 0
    }
    var maxSpeakerCount: Int {
        return selectedAmp.maxSpeakerLoads[selectedSpeaker.name]?.total ?? 0
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text("# CH USED: \(selectedSpeaker.channelsUsed)")
                .font(.headline)
                .padding(.bottom, 2)
            
            Divider()
            
            Text("PER OUTPUT: \(speakersPerChannel)")
                .font(.headline)
                .padding(.vertical, 2)
            
            Divider()
            
            Text("TOTAL: \(maxSpeakerCount)")
                .font(.headline)
                .padding(.bottom, 2)
            
            Spacer()
            
            Text("Maximum Load @ High SPL")
                .font(.callout)
                .padding()
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .shadow(radius: 5)
        .foregroundColor(.primary)
    }
}

struct AmpLoadCalcView_Previews: PreviewProvider {
    static var previews: some View {
        AmpLoadCalcView()
    }
}
