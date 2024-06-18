import SwiftUI

struct Department: Identifiable {
    let id = UUID()
    let name: String
    let logo: String
    let phone: String
    let email: String
    let managerFirstName: String
    let managerLastName: String
    
    var fullName: String {
        return "\(managerFirstName) \(managerLastName)"
    }
}

let departments = [
    Department(name: "REGIE GENERALE", logo: "person.2.fill", phone: "123-456-7895", email: "arnaud.gandon@groupe-brame.com", managerFirstName: "Arnaud", managerLastName: "Gandon"),
    Department(name: "ANIMATION", logo: "star.fill", phone: "123-456-7894", email: "normann.negri@groupe-brame.com", managerFirstName: "Normann", managerLastName: "Negri"),
    Department(name: "COMMERCIAL", logo: "briefcase.fill", phone: "123-456-7890", email: "elodie.faugier@groupe-brame.com", managerFirstName: "Elodie", managerLastName: "Faugier"),

    Department(name: "ADMIN CTS", logo: "folder.fill", phone: "123-456-7890", email: "pamela.desa@groupe-brame.com", managerFirstName: "Pamela", managerLastName: "Desa"),
    Department(name: "TECHNIQUE CTS", logo: "hammer.fill", phone: "123-456-7890", email: "jerome.ruiz@groupe-brame.com", managerFirstName: "Jerome", managerLastName: "Ruiz"),
    Department(name: "DECO", logo: "paintbrush.fill", phone: "123-456-7896", email: "henrique.barbossa@groupe-brame.com", managerFirstName: "Henrique", managerLastName: "Barbossa"),
   
    Department(name: "SON", logo: "speaker.fill", phone: "123-456-7891", email: "olivier.jobin@groupe-brame.com", managerFirstName: "Olivier", managerLastName: "Jobin"),
    Department(name: "LIGHT", logo: "lightbulb.fill", phone: "123-456-7890", email: "julien.breton@groupe-brame.com", managerFirstName: "Julien", managerLastName: "Breton"),
    Department(name: "VIDEO", logo: "video.fill", phone: "123-456-7890", email: "guillaume.triphon@groupe-brame.com", managerFirstName: "Guillaume", managerLastName: "Triphon"),

    Department(name: "ELECTRICITE", logo: "bolt.fill", phone: "123-456-7892", email: "julien.breton@groupe-brame.com", managerFirstName: "Julien", managerLastName: "Breton"),
    Department(name: "TRUSS", logo: "scalemass.fill", phone: "123-456-7892", email: "guillaume.grabowski@groupe-brame.com", managerFirstName: "Guillaume", managerLastName: "Grabowski"),
    Department(name: "ACHATS", logo: "cart.fill", phone: "123-456-7892", email: "remy.lesacq@groupe-brame.com", managerFirstName: "Remy", managerLastName: "Lesacq"),
  
    Department(name: "RH", logo: "person.3.fill", phone: "123-456-7890", email: "sandrine.mahier@groupe-brame.com", managerFirstName: "Sandrine", managerLastName: "Mahier"),
    Department(name: "COMPTABILITE", logo: "dollarsign.circle.fill", phone: "123-456-7890", email: "catherine.behrendt@groupe-brame.com", managerFirstName: "Catherine", managerLastName: "Behrendt"),
    Department(name: "VEHICULES", logo: "car.fill", phone: "123-456-7896", email: "guillaume.grabowski@groupe-brame.com", managerFirstName: "Guillaume", managerLastName: "Grabowski")
]
