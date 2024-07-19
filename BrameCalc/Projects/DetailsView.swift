import SwiftUI

struct GeneralDetailsView: View {
    @ObservedObject var project: Project
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Section(header: Text("Nom et Description du Projet").font(.headline)) {
                    CardView {
                        VStack(alignment: .leading, spacing: 10) {
                            LabeledTextField(label: "Nom du projet", text: $project.name)
                            LabeledTextEditor(label: "Description", text: $project.description)
                            LabeledTextField(label: "Société", text: $project.agencyName)
                            LabeledTextField(label: "Contact client", text: $project.agencyContact)
                            LabeledTextField(label: "Mail client", text: $project.agencyMail)
                            LabeledTextField(label: "Téléphone client", text: $project.agencyPhone)
                        }
                    }
                }
                
                Section(header: Text("Lieu et Date de l'Événement").font(.headline)) {
                    CardView {
                        VStack(alignment: .leading, spacing: 10) {
                            LabeledTextField(label: "Lieu", text: $project.eventLocation)
                            //                            LabeledDatePicker(label: "Date", date: $project.eventDate)
                            HStack{
                                LabeledDatePicker(label: "Montage", date: $project.setupDate)
                                LabeledDatePicker(label: "Début d'exploitation", date: $project.operationStartDate)
                                LabeledDatePicker(label: "Fin d'exploitation", date: $project.operationEndDate)
                                LabeledDatePicker(label: "Démontage", date: $project.teardownDate)
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

import SwiftUI

struct CTSDetailsView: View {
    @ObservedObject var project: Project
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Section(header: Text("CTS").font(.headline)) {
                CardView {
                    VStack(alignment: .leading, spacing: 10) {
                        LabeledTextField(label: "Type de tente", text: $project.tentType)
                        LabeledTextField(label: "Dimensions", text: $project.tentDimensions)
                        LabeledTextField(label: "Hauteur", text: $project.tentHeight)
                        LabeledTextField(label: "Bâche", text: $project.tentCover)
                        LabeledTextField(label: "Chauffage", text: $project.tentHeating)
                        LabeledTextField(label: "Climatisation", text: $project.tentAC)
                        LabeledTextField(label: "Parquet", text: $project.tentFlooring)
                        LabeledTextField(label: "Lestage/Piquetage", text: $project.tentLest)

                    }
                }
            }
            
            Section(header: Text("Accessoires CTS").font(.headline)) {
                CardView {
                    VStack(alignment: .leading, spacing: 10) {
                        LabeledTextField(label: "Accessoires", text: $project.tentAccessories)
                    }
                }
            }
            Section(header: Text("Scène/Podium").font(.headline)) {
                CardView {
                    VStack(alignment: .leading, spacing: 10) {
                        LabeledTextField(label: "Scène/Podium", text: $project.stageStruct)
                    }
                }
            }
        }
        .padding()
    }
}

import SwiftUI

struct DistribDetailsView: View {
    @ObservedObject var project: Project
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Section(header: Text("Distribution Électrique").font(.headline)) {
                CardView {
                    VStack(alignment: .leading, spacing: 10) {
                        LabeledTextField(label: "Source d'alimentation", text: $project.powerSource)
                        LabeledTextField(label: "Puissance disponible (kW)", text: $project.powerRequirement)
                        LabeledTextField(label: "Type de connexion", text: $project.connectionType)
                        LabeledTextField(label: "Nombre et type de prises", text: $project.outletCount)
                        LabeledTextField(label: "Type de câbles", text: $project.cableType)
                        LabeledTextField(label: "Passage de câbles", text: $project.cableWay)
                        LabeledTextField(label: "Contact Electro", text: $project.electroContact)

                    }
                }
            }
            
//            Section(header: Text("").font(.headline)) {
//                CardView {
//                    VStack(alignment: .leading, spacing: 10) {
//                        LabeledTextField(label: "Disjoncteurs", text: $project.circuitBreakers)
//                        LabeledTextField(label: "Parafoudres", text: $project.surgeProtection)
//                        LabeledTextField(label: "Mise à la terre", text: $project.groundingDetails)
//                    }
//                }
//            }
        }
        .padding()
    }
}

import SwiftUI

struct AVDetailsView: View {
    @ObservedObject var project: Project
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Section(header: Text("Sonorisation").font(.headline)) {
                CardView {
                    VStack(alignment: .leading, spacing: 10) {
                        LabeledTextField(label: "Type de système", text: $project.soundSystemType)
                        LabeledTextField(label: "Nombre de haut-parleurs", text: $project.speakerCount)
                        LabeledTextField(label: "Zone à couvrir", text: $project.soundCoverArea)
                        LabeledTextField(label: "Audience attendue", text: $project.soundExpectedAudience)
                        LabeledTextField(label: "Contraintes d'espace", text: $project.soundSpaceContraint)
                        LabeledTextField(label: "Charge maximum (Kg)", text: $project.maxLoad)
                        LabeledTextField(label: "Rigg son", text: $project.soundRig)

                    }
                }
            }
            
            Section(header: Text("Éclairage").font(.headline)) {
                CardView {
                    VStack(alignment: .leading, spacing: 10) {
                        LabeledTextField(label: "Type de plan de feu", text: $project.lightingType)
                        LabeledTextField(label: "Nombre de projecteurs", text: $project.lightingCount)
                        LabeledTextField(label: "Sujets à éclairer", text: $project.lightingSubnject)
                        LabeledTextField(label: "Contraintes d'espace", text: $project.lightSpaceContraint)
                        LabeledTextField(label: "Charge maximum (Kg)", text: $project.maxLoad)
                        LabeledTextField(label: "Rigg light", text: $project.lightRig)
                        LabeledTextField(label: "Puissance disponible (Kw)", text: $project.lightingPower)
                    }
                }
            }
            
            Section(header: Text("Vidéo").font(.headline)) {
                CardView {
                    VStack(alignment: .leading, spacing: 10) {
                        LabeledTextField(label: "Medium de diffusion", text: $project.videoType)
                        LabeledTextField(label: "Type d'écran", text: $project.screenType)
                        LabeledTextField(label: "Dimensions de l'écran", text: $project.screenDimensions)
                        LabeledTextField(label: "Rigg vidéo", text: $project.videoRig)
                        LabeledTextField(label: "Résolution", text: $project.videoResolution)
                        LabeledTextField(label: "Captation", text: $project.videoCaptation)
                        LabeledTextField(label: "Réalisation", text: $project.videoProduction)
                        LabeledTextField(label: "Streaming", text: $project.videoStreaming)
                        LabeledTextField(label: "Multiplex", text: $project.videoMultiplex)
                    }
                }
            }
        }
        .padding()
    }
}

import SwiftUI

struct DecoDetailsView: View {
    @ObservedObject var project: Project
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Section(header: Text("Décoration").font(.headline))
            {
                CardView {
                    VStack(alignment: .leading, spacing: 10) {
                        LabeledTextField(label: "Thème", text: $project.theme)
                        LabeledTextField(label: "Style", text: $project.style)
                    }
                }
            }
            Section(header: Text("Habillage").font(.headline))
            {
                CardView {
                    VStack(alignment: .leading, spacing: 10) {
                        LabeledTextField(label: "Habillage scène", text: $project.stageDress)
                        LabeledTextField(label: "Habillage CTS", text: $project.ctsDress)
                        LabeledTextField(label: "Cloisonnement", text: $project.cabinDress)

                    }
                }
            }
            Section(header: Text("Décoration").font(.headline)) {
                CardView {
                    VStack(alignment: .leading, spacing: 10) {
                        LabeledTextField(label: "Mobilier", text: $project.furnitureDetails)
                        LabeledTextField(label: "Éléments décoratifs", text: $project.decorativeElements)
                        LabeledTextField(label: "Fleurs", text: $project.flowerDetails)
                    }
                }
            }
        }
        .padding()
    }
}



struct TeamDetailsView: View {
    @ObservedObject var project: Project
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Section(header: Text("Équipe Brame").font(.headline)) {
                CardView {
                    VStack(alignment: .leading, spacing: 10) {
                        LabeledTextField(label: "Directeur technique", text: $project.brameDirTech)
                        LabeledTextField(label: "Chargé d'affaire", text: $project.brameProjectManager)
                        LabeledTextField(label: "Commercial", text: $project.brameSalesManager)
                        LabeledTextField(label: "Chef de chantier", text: $project.brameSiteManager)
                        LabeledTextField(label: "Techniciens", text: $project.brameSechnicians)
                        LabeledTextField(label: "Road", text: $project.brameRoad)

                    }
                }
            }
            Section(header: Text("Équipe Prod/Locale").font(.headline)) {
                CardView {
                    VStack(alignment: .leading, spacing: 10) {
                        LabeledTextField(label: "Directeur technique", text: $project.localDirTech)
                        LabeledTextField(label: "Chargé d'affaire", text: $project.localProjectManager)
                        LabeledTextField(label: "Commercial", text: $project.localSalesManager)
                        LabeledTextField(label: "Chef de chantier", text: $project.localSiteManager)
                        LabeledTextField(label: "Techniciens", text: $project.localTechnicians)
                        LabeledTextField(label: "Road", text: $project.localRoad)

                    }
                }
            }
        }
        .padding()
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


