
import SwiftUI

struct RSEAccomplishmentView: View {
    @State private var accomplishments: [RSEAccomplishment] = []
    
    var body: some View {
        VStack {
            List {
                ForEach(accomplishments) { accomplishment in
                    NavigationLink(destination: RSEAccomplishmentDetailView(accomplishment: accomplishment)) {
                        Text(accomplishment.title)
                    }
                }
                .onDelete(perform: deleteAccomplishment)
            }
            .navigationTitle("Réalisations RSE")
            
            Button(action: addAccomplishment) {
                Label("Ajouter une Réalisation", systemImage: "plus")
            }
            .padding()
        }
    }
    
    private func addAccomplishment() {
        let newAccomplishment = RSEAccomplishment()
        accomplishments.append(newAccomplishment)
    }
    
    private func deleteAccomplishment(at offsets: IndexSet) {
        accomplishments.remove(atOffsets: offsets)
    }
}

struct RSEAccomplishmentDetailView: View {
    @ObservedObject var accomplishment: RSEAccomplishment
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            TextField("Titre", text: $accomplishment.title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Description", text: $accomplishment.description)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            DatePicker("Date d'Achèvement", selection: $accomplishment.completionDate, displayedComponents: .date)
            Spacer()
        }
        .padding()
    }
}

struct RSEAccomplishmentView_Previews: PreviewProvider {
    static var previews: some View {
        RSEAccomplishmentView()
    }
}
