import SwiftUI

struct OrganigramView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Organigramme")
                    .font(.largeTitle)
                    .padding(.top, 20)
                
                OrganigramNode(name: "Président", systemImage: "crown.fill")
                
                VStack(spacing: 20) {
                    OrganigramNode(name: "Directeur Financier", systemImage: "dollarsign.circle.fill")
                    OrganigramNode(name: "Directeur Commercial", systemImage: "briefcase.fill")
                    OrganigramNode(name: "Directeur Technique", systemImage: "gearshape.fill")
                }
                .padding(.leading, 40)
                
                VStack(spacing: 20) {
                    OrganigramNode(name: "Dessinateur Technique", systemImage: "pencil.and.outline")
                    OrganigramNode(name: "Responsable Logistique", systemImage: "truck.fill")
                    OrganigramNode(name: "Planificateur", systemImage: "calendar")
                }
                .padding(.leading, 80)
                
                VStack(spacing: 20) {
                    OrganigramNode(name: "Commercial Agence", systemImage: "person.fill")
                    OrganigramNode(name: "Commercial AV", systemImage: "video.fill")
                    OrganigramNode(name: "Commercial CTS", systemImage: "wrench.fill")
                    OrganigramNode(name: "Commercial Déco", systemImage: "paintbrush.fill")
                }
                .padding(.leading, 120)
                
                VStack(spacing: 20) {
                    OrganigramNode(name: "Technicien", systemImage: "hammer.fill")
                }
                .padding(.leading, 160)
                
                Spacer()
            }
            .padding()
        }
    }
}

struct OrganigramNode: View {
    let name: String
    let systemImage: String
    
    var body: some View {
        HStack {
            Image(systemName: systemImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .padding()
                .background(Color.blue.opacity(0.1))
                .clipShape(Circle())
            
            Text(name)
                .font(.headline)
                .multilineTextAlignment(.leading)
                .padding(.leading, 10)
        }
        .frame(height: 60)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal, 20)
    }
}

struct OrganigramView_Previews: PreviewProvider {
    static var previews: some View {
        OrganigramView()
    }
}
