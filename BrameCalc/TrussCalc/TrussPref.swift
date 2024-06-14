import SwiftUI
import Combine

struct SettingsView: View {
    @ObservedObject var stockManager: StockManager
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Text("Paramètres")
                    .font(.title)
                    .padding()
                Spacer()
                Button("Terminé") {
                    stockManager.saveStock()
                    presentationMode.wrappedValue.dismiss()
                }
                .padding()
            }
            .padding(.horizontal)
//            .background(Color(.systemBackground)) // Ensure background color is set properly

            Divider()
//                .background(Color(.separator)) // Ensure divider is visible

            List {
                Section(header: Text("Disponibilité des éléments Eurotruss")) {
                    ForEach(eurotrussFD34, id: \.id) { element in
                        Toggle(isOn: Binding(
                            get: { stockManager.stock[element.name, default: true] },
                            set: { stockManager.stock[element.name] = $0 }
                        )) {
                            Text(element.name)
                        }
                    }
                }
            }
//            .listStyle(InsetGroupedListStyle()) // Use a style that is known to work well on macOS
        }
        .preferredColorScheme(.dark)
        .frame(minWidth: 400, minHeight: 600) // Set minimum frame size if needed
    }
}
