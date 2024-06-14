import SwiftUI
import Combine

struct WaveLengthView: View {
    @State private var frequency: String = ""
    @State private var wavelength: String = ""
    @State private var quarterWavelength: String = ""
    @State private var halfWavelength: String = ""
    @State private var period: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
            Text("Wave Length")
                .font(.largeTitle)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
            Spacer(minLength: 30)
                VStack(alignment: .leading) {
                    Text("Wave Length (λ) :")
                        .font(.callout)
                        .bold()
                        .padding(.bottom, 5)
                    Text("  λ = c / f")
                        .font(.callout)
                    Text("  λ : Wave Length in meter")
                        .font(.callout)
                    Text("  c : speed of sound in air (343 m/s)")
                        .font(.callout)
                    Text("  f : frequency in Hz")
                        .font(.callout)
                        .padding(.bottom, 10)
                    
                    //                        Spacer(minLength: 30)
                    
                    VStack {
                        HStack {
                            Text("Frequency (Hz)")
                                .padding(.horizontal, 30.0)
                                .font(.callout)
                            
                            Spacer()
                        }
                        TextField("Enter frequency", text: $frequency)
                                       .toolbar {
                                           ToolbarItemGroup(placement: .keyboard) {
                                               Spacer()
                                               Button("Done") {
                                               }
                                           }
                                       }
                            .onReceive(Just(frequency)) { value in
                                calculateWavelength()
                            }
                        
                        HStack {
                            Text("Wave Length (M)")
                                .padding(.horizontal, 30.0)
                                .font(.callout)
                            Spacer()
                        }
                        TextField("Wave Length (M)", text: $wavelength)
                            .font(.callout)
                            .padding(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .onReceive(Just(wavelength)) { value in
                                calculateWavelength()
                            }
                        HStack {
                            Text("1/2 Wave Length (L)")
                                .padding(.horizontal, 30.0)
                                .font(.callout)
                            Spacer()
                        }
                        TextField("1/2 Wave Length (M)", text: $halfWavelength)
                            .font(.callout)
                            .padding(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .onReceive(Just(halfWavelength)) { value in
                                calculateWavelength()
                            }
                        
                        HStack {
                            Text("1/4 Wave Length (M)")
                                .padding(.horizontal, 30.0)
                                .font(.callout)
                            Spacer()
                        }
                        TextField("1/4 Wave Length (M)", text: $quarterWavelength)
                            .padding(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .onReceive(Just(quarterWavelength)) { value in
                                calculateWavelength()
                            }
                        //                            Spacer()
                        //                            VStack(alignment: .leading) {
                        //
                        //                                Text("Calcul de la période (T) :")
                        //                                    .font(.callout)
                        //                                    .padding(.bottom, 5)
                        //
                        //                                Text("  T : 1 / f")
                        //                                    .font(.callout)
                        //                                Text("  T : période en secondes")
                        //                                    .font(.callout)
                        //                                Text("  f : fréquence en Hz")
                        //                                    .font(.callout)
                        //                                    .padding(.bottom, 10)
                        //
                        //                                HStack {
                        //                                    Text("Période (ms)")
                        //                                        .padding(.horizontal, 30.0)
                        //                                        .font(.callout)
                        //                                    Spacer()
                        //                                }
                        //                                TextField("Période (ms)", text: $period)
                        //                                    .font(.callout)
                        //                                    .keyboardType(.decimalPad)
                        //                                    .padding(20)
                        //                                    .overlay(
                        //                                        RoundedRectangle(cornerRadius: 10)
                        //                                            .stroke(Color.gray, lineWidth: 1)
                        //                                    )
                        //                                    .onReceive(Just(period)) { value in
                        //                                        calculateWavelength()
                        //                                    }
                        //                            }
                    }
                }
            }
            //            Spacer()
        }
        .padding()
    }
    
    
    private func calculateWavelength() {
        guard let frequencyInHz = Double(frequency) else {
            wavelength = ""
            quarterWavelength = ""
            halfWavelength = ""
            period = ""
            return
        }
        let wavelengthValue = 343 / frequencyInHz
        wavelength = String(format: "%.2f", wavelengthValue)
        quarterWavelength = String(format: "%.2f", wavelengthValue / 4)
        halfWavelength = String(format: "%.2f", wavelengthValue / 2)
        period = String(format: "%.2f", 1 / frequencyInHz * 1000) // convert to milliseconds
    }
}
