import SwiftUI

struct GeneralDetailsView: View {
    @ObservedObject var project: Project
    
    var body: some View {
        Form {
            Section(header: Text("Nom et Description du Projet").font(.headline)) {
                HStack {
                    Text("Nom du projet")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.name)
                }
                HStack {
                    Text("Description")
                    Spacer()
                    ModernTextEditor(placeholder: "", text: $project.description)
                        .frame(height: 100)
                }
                HStack {
                    Text("Société")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.agencyName)
                }
                HStack {
                    Text("Contact client")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.agencyContact)
                }
                HStack {
                    Text("Mail client")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.agencyMail)
                }
                HStack {
                    Text("Téléphone client")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.agencyPhone)
                }
            }
            
            Section(header: Text("Lieu et Date de l'Événement").font(.headline)) {
                HStack {
                    Text("Lieu")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.eventLocation)
                }
                HStack {
                    Text("Date")
                    Spacer()
                    DatePicker("", selection: $project.eventDate, displayedComponents: .date)
                        .labelsHidden()
                }
            }
        }
    }
}

struct CTSDetailsView: View {
    @ObservedObject var project: Project
    
    var body: some View {
        Form {
            Section(header: Text("CTS").font(.headline)) {
                HStack {
                    Text("Type de tente")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.tentType)
                }
                HStack {
                    Text("Dimensions")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.tentDimensions)
                }
                HStack {
                    Text("Hauteur")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.tentHeight)
                }
                HStack {
                    Text("Bâche")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.tentCover)
                }
                HStack {
                    Text("Chauffage")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.tentHeating)
                }
                HStack {
                    Text("Climatisation")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.tentAC)
                }
                HStack {
                    Text("Parquet")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.tentFlooring)
                }
            }
            Section(header: Text("Accessoires de la tente").font(.headline)) {
                HStack {
                    Text("Accessoires")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.tentAccessories)
                }
            }
        }
        .navigationTitle(Text(project.name.isEmpty ? "Nouveau Projet" : project.name))
    }
}

struct DistribDetailsView: View {
    @ObservedObject var project: Project
    
    var body: some View {
        Form {
            Section(header: Text("Distribution Électrique").font(.headline)) {
                HStack {
                    Text("Source d'alimentation")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.powerSource)
                }
                HStack {
                    Text("Puissance requise (kW)")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.powerRequirement)
                }
                HStack {
                    Text("Nombre de prises")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.outletCount)
                }
                HStack {
                    Text("Type de câbles")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.cableType)
                }
                HStack {
                    Text("Type de connexion")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.connectionType)
                }
            }
            Section(header: Text("").font(.headline)) {
                HStack {
                    Text("Disjoncteurs")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.circuitBreakers)
                }
                HStack {
                    Text("Parafoudres")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.surgeProtection)
                }
                HStack {
                    Text("Mise à la terre")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.groundingDetails)
                }
            }
        }
        .navigationTitle(Text(project.name.isEmpty ? "Nouveau Projet" : project.name))
    }
}

struct AVDetailsView: View {
    @ObservedObject var project: Project
    
    var body: some View {
        Form {
            Section(header: Text("Sonorisation").font(.headline)) {
                HStack {
                    Text("Type de système")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.soundSystemType)
                }
                HStack {
                    Text("Nombre de haut-parleurs")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.speakerCount)
                }
                HStack {
                    Text("Zone à couvrir")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.soundCoverArea)
                }
            }
            
            Section(header: Text("Éclairage").font(.headline)) {
                HStack {
                    Text("Type de projecteurs")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.lightingType)
                }
                HStack {
                    Text("Nombre de projecteurs")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.lightingCount)
                }
                HStack {
                    Text("Puissance (W)")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.lightingPower)
                }
            }
            
            Section(header: Text("Vidéo - Détails").font(.headline)) {
                HStack {
                    Text("Type d'écran")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.screenType)
                }
                HStack {
                    Text("Dimensions de l'écran")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.screenDimensions)
                }
                HStack {
                    Text("Résolution")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.videoResolution)
                }
                HStack {
                    Text("Captation")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.videoCaptation)
                }
                HStack {
                    Text("Réalisation")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.videoProduction)
                }
                HStack {
                    Text("Streaming")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.videoStreaming)
                }
                HStack {
                    Text("Multiplex")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.videoMultiplex)
                }
            }
        }
        .navigationTitle(Text(project.name.isEmpty ? "Nouveau Projet" : project.name))
    }
}

struct DecoDetailsView: View {
    @ObservedObject var project: Project
    
    var body: some View {
        Form {
            Section(header: Text("Décoration - Thème et Style").font(.headline)) {
                HStack {
                    Text("Thème")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.theme)
                }
                HStack {
                    Text("Style")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.style)
                }
            }
            Section(header: Text("Décoration").font(.headline)) {
                HStack {
                    Text("Fleurs")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.flowerDetails)
                }
                HStack {
                    Text("Mobilier")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.furnitureDetails)
                }
                HStack {
                    Text("Éléments décoratifs")
                    Spacer()
                    ModernTextField(placeholder: "", text: $project.decorativeElements)
                }
            }
        }
        .navigationTitle(Text(project.name.isEmpty ? "" : project.name))
    }
}

struct TeamView: View {
    var body: some View {
        VStack {
            Text("Team")
            // Add content for the Team tab here
        }
    }
}

struct ModernTextField: View {
    var placeholder: String
    @Binding var text: String
    var body: some View {
        TextField(placeholder, text: $text)
            .padding(2)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
            .padding(.horizontal)
    }
}

struct ModernTextEditor: View {
    var placeholder: String
    @Binding var text: String
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color.gray)
                    .padding(.top, 8)
                    .padding(.leading, 4)
            }
            TextEditor(text: $text)
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                .padding(.horizontal)
        }
    }
}


