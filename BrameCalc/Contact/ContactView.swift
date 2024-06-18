import SwiftUI

struct ContactView: View {
    @State private var selectedDepartment: Department?

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        VStack {
            Text("Contactez nos départements")
                .font(.largeTitle)
                .padding()

            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(departments) { department in
                        Button(action: {
                            selectedDepartment = department
                        }) {
                            VStack {
                                Image(systemName: department.logo)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .padding()
                                Text(department.name)
                                    .font(.headline)
//                                Text(department.fullName)
//                                    .font(.subheadline)
//                                    .foregroundColor(.secondary)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }

            if let department = selectedDepartment {
                VStack {
                    Text("Contact \(department.name)")
                        .font(.title2)
                        .padding()
                    Text("Responsable : \(department.fullName)")
                    Text("Téléphone : \(department.phone)")
                    Text("Email : \(department.email)")
                }
                .padding()
            }

            Spacer()
        }
        .padding()
    }
}

