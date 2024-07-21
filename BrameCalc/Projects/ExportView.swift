import SwiftUI
import PDFKit
import Quartz

struct ExportView: View {
    @ObservedObject var project: Project
    @State private var pdfData: Data?
    @State private var showingPDFPreview = false
    
    var body: some View {
        VStack {
            HStack {
                Button(action: savePDF) {
                    Image(systemName: "square.and.arrow.down")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding()
                }
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.horizontal)
                .disabled(pdfData == nil) // Disable button if no PDF data
                
                Button(action: {
                    if let pdfData = pdfData {
                        sharePDF(data: pdfData)
                    }
                }) {
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding()
                }
                .background(Color.green)
                .cornerRadius(10)
                .padding(.horizontal)
                .disabled(pdfData == nil) // Disable button if no PDF data
                
                Button(action: {
                    if let pdfData = pdfData {
                        showingPDFPreview = true
                    }
                }) {
                    Image(systemName: "doc.text.magnifyingglass")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding()
                }
                .background(Color.gray)
                .cornerRadius(10)
                .padding(.horizontal)
                .disabled(pdfData == nil) // Disable button if no PDF data
                .sheet(isPresented: $showingPDFPreview) {
                    if let pdfData = pdfData {
                        PDFPreviewView(data: pdfData)
                    }
                }
            }
            .padding()
            
            Spacer()
        }
        .padding()
        .onAppear {
            generatePDF()
        }
    }
    
    private func generatePDF() {
        let pdfDocument = PDFDocument()
        var currentPage = PDFPage()
        var currentPoint = CGPoint(x: 20, y: 812) // Adjusted for margin
        
        func addPageIfNeeded() {
            if currentPoint.y < 40 {
                pdfDocument.insert(currentPage, at: pdfDocument.pageCount)
                currentPage = PDFPage()
                currentPoint = CGPoint(x: 20, y: 812) // Reset to top of new page
            }
        }
        
        func drawText(_ text: String, at point: CGPoint) -> CGPoint {
            guard !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
                return point
            }
            
            let textAttributes: [NSAttributedString.Key: Any] = [
                .font: NSFont.systemFont(ofSize: 14),
                .foregroundColor: NSColor.black
            ]
            let attributedText = NSAttributedString(string: text, attributes: textAttributes)
            let textSize = attributedText.boundingRect(with: CGSize(width: 555, height: CGFloat.greatestFiniteMagnitude), options: [.usesLineFragmentOrigin]).size
            
            if point.y - textSize.height < 40 { // Check if we need a new page
                addPageIfNeeded()
            }
            
            let textRect = CGRect(origin: point, size: CGSize(width: 555, height: textSize.height))
            attributedText.draw(in: textRect)
            
            return CGPoint(x: point.x, y: point.y - textSize.height - 20)
        }
        
        func drawSectionTitle(_ title: String, at point: CGPoint) -> CGPoint {
            let titleAttributes: [NSAttributedString.Key: Any] = [
                .font: NSFont.boldSystemFont(ofSize: 18),
                .foregroundColor: NSColor.black
            ]
            title.draw(at: point, withAttributes: titleAttributes)
            return CGPoint(x: point.x, y: point.y - 30)
        }
        
        func drawDivider(at point: CGPoint) -> CGPoint {
            let context = NSGraphicsContext.current?.cgContext
            context?.setStrokeColor(NSColor.gray.cgColor)
            context?.setLineWidth(1)
            context?.move(to: CGPoint(x: point.x, y: point.y))
            context?.addLine(to: CGPoint(x: 575, y: point.y))
            context?.strokePath()
            return CGPoint(x: point.x, y: point.y - 10)
        }
        
        func drawSection(_ title: String, details: String) {
            currentPoint = drawSectionTitle(title, at: currentPoint)
            currentPoint = drawText(details, at: currentPoint)
            currentPoint = drawDivider(at: currentPoint)
        }
        
        // Draw all sections
        drawSection("Nom et Description du Projet", details: """
            Nom: \(project.name)
            Description: \(project.description)
            Société: \(project.agencyName)
            Contact: \(project.agencyContact)
            Mail: \(project.agencyMail)
            Téléphone: \(project.agencyPhone)
            """)
        
        drawSection("Lieu et Date de l'Événement", details: """
            Lieu: \(project.eventLocation)
            Montage: \(formatDate(project.setupDate))
            Début d'exploitation: \(formatDate(project.operationStartDate))
            Fin d'exploitation: \(formatDate(project.operationEndDate))
            Démontage: \(formatDate(project.teardownDate))
            """)
        
        drawSection("CTS", details: """
            Type de tente: \(project.tentType)
            Dimensions: \(project.tentDimensions)
            Hauteur: \(project.tentHeight)
            Bâche: \(project.tentCover)
            Chauffage: \(project.tentHeating)
            Climatisation: \(project.tentAC)
            Parquet: \(project.tentFlooring)
            Lestage/Piquetage: \(project.tentLest)
            """)
        
        drawSection("Accessoires CTS", details: "Accessoires: \(project.tentAccessories)")
        
        drawSection("Scène/Podium", details: "Scène/Podium: \(project.stageStruct)")
        
        drawSection("Distribution Électrique", details: """
            Source d'alimentation: \(project.powerSource)
            Puissance disponible (kW): \(project.powerRequirement)
            Type de connexion: \(project.connectionType)
            Nombre et type de prises: \(project.outletCount)
            Type de câbles: \(project.cableType)
            Passage de câbles: \(project.cableWay)
            Contact Electro: \(project.electroContact)
            """)
        
        drawSection("Sonorisation", details: """
            Type de système: \(project.soundSystemType)
            Nombre de haut-parleurs: \(project.speakerCount)
            Zone à couvrir: \(project.soundCoverArea)
            Audience attendue: \(project.soundExpectedAudience)
            Contraintes d'espace: \(project.soundSpaceContraint)
            Charge maximum (Kg): \(project.maxLoad)
            Rigg son: \(project.soundRig)
            """)
        
        drawSection("Éclairage", details: """
            Type de plan de feu: \(project.lightingType)
            Nombre de projecteurs: \(project.lightingCount)
            Sujets à éclairer: \(project.lightingSubnject)
            Contraintes d'espace: \(project.lightSpaceContraint)
            Charge maximum (Kg): \(project.maxLoad)
            Rigg light: \(project.lightRig)
            Puissance disponible (Kw): \(project.lightingPower)
            """)
        
        drawSection("Vidéo", details: """
            Medium de diffusion: \(project.videoType)
            Type d'écran: \(project.screenType)
            Dimensions de l'écran: \(project.screenDimensions)
            Rigg vidéo: \(project.videoRig)
            Résolution: \(project.videoResolution)
            Captation: \(project.videoCaptation)
            Réalisation: \(project.videoProduction)
            Streaming: \(project.videoStreaming)
            Multiplex: \(project.videoMultiplex)
            """)
        
        drawSection("Décoration", details: """
            Thème: \(project.theme)
            Style: \(project.style)
            Habillage scène: \(project.stageDress)
            Habillage CTS: \(project.ctsDress)
            Cloisonnement: \(project.cabinDress)
            Mobilier: \(project.furnitureDetails)
            Éléments décoratifs: \(project.decorativeElements)
            Fleurs: \(project.flowerDetails)
            """)
        
        drawSection("Équipe Brame", details: """
            Équipe Brame:
            Directeur technique: \(project.brameDirTech)
            Chargé d'affaire: \(project.brameProjectManager)
            Commercial: \(project.brameSalesManager)
            Chef de chantier: \(project.brameSiteManager)
            Techniciens: \(project.brameSechnicians)
            Road: \(project.brameRoad)
            
            Équipe Prod/Locale:
            Directeur technique: \(project.localDirTech)
            Chargé d'affaire: \(project.localProjectManager)
            Commercial: \(project.localSalesManager)
            Chef de chantier: \(project.localSiteManager)
            Techniciens: \(project.localTechnicians)
            Road: \(project.localRoad)
            """)
        
        pdfDocument.insert(currentPage, at: pdfDocument.pageCount)
        pdfData = pdfDocument.dataRepresentation()
    }
    
    private func formatDate(_ date: Date?) -> String {
        guard let date = date else {
            return "N/A" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: date)
    }
    private func savePDF() {
        guard let pdfData = pdfData else { return }
        
        let savePanel = NSSavePanel()
        savePanel.allowedFileTypes = ["pdf"]
        savePanel.nameFieldStringValue = "ProjectDetails.pdf"
        savePanel.begin { response in
            if response == .OK, let url = savePanel.url {
                do {
                    try pdfData.write(to: url)
                } catch {
                    print("Failed to save PDF: \(error)")
                }
            }
        }
    }
    
    private func sharePDF(data: Data) {
        let temporaryDirectoryURL = URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
        let temporaryFileURL = temporaryDirectoryURL.appendingPathComponent("ProjectDetails.pdf")
        
        do {
            try data.write(to: temporaryFileURL)
            
            let sharingServicePicker = NSSharingServicePicker(items: [temporaryFileURL])
            if let window = NSApplication.shared.windows.first {
                sharingServicePicker.show(relativeTo: .zero, of: window.contentView!, preferredEdge: .minY)
            }
        } catch {
            print("Failed to write PDF data to temporary file: \(error)")
        }
    }
}

struct PDFPreviewView: View {
    let data: Data
    var body: some View {
        VStack {
            PDFKitView(data: data)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct PDFKitView: NSViewRepresentable {
    let data: Data
    func makeNSView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = PDFDocument(data: data)
        pdfView.autoScales = true
        return pdfView
    }
    func updateNSView(_ nsView: PDFView, context: Context) {
        nsView.document = PDFDocument(data: data)
    }
}
