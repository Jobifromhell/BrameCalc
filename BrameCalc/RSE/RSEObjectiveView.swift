import SwiftUI

struct RSEObjectiveView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("RSE")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                
//                Text("Introduction")
//                    .font(.title2)
//                    .fontWeight(.semibold)
                
                Text("""
                Notre groupe est  engagé dans une démarche de Responsabilité Sociétale des Entreprises (RSE). Conscients de notre impact environnemental, notamment en ce qui concerne le transport de matériel, nous avons défini une série d'objectifs RSE ambitieux visant à réduire notre empreinte carbone et à promouvoir des pratiques durables.
                """)
                
                Text("Objectifs RSE")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Group {
                    Text("1. Réduction de l'empreinte carbone liée au transport")
                        .font(.headline)
                    
                    Text("""
                    Le transport de matériel représente une part significative de nos émissions de CO2. Pour y remédier, nous mettons en place les actions suivantes :
                    - **Optimisation des trajets :** Nous analysons et optimisons les itinéraires de transport pour réduire les distances parcourues et le nombre de trajets nécessaires.
                    - **Utilisation de véhicules écologiques :** Nous investissons dans des véhicules à faibles émissions, tels que les camions électriques et hybrides, pour notre flotte de transport.
                    - **Regroupement des livraisons :** Nous coordonnons les livraisons de matériel afin de maximiser le remplissage des véhicules et de minimiser le nombre de trajets.
                    - **Partenariats logistiques :** Nous collaborons avec des partenaires logistiques engagés dans des démarches de réduction des émissions de CO2.
                    """)
                }
                
                Group {
                    Text("2. Gestion des déchets et recyclage")
                        .font(.headline)
                    
                    Text("""
                    La gestion des déchets générés lors des événements est cruciale pour minimiser notre impact environnemental :
                    - **Tri sélectif :** Mise en place de points de tri sélectif sur tous nos événements pour assurer le recyclage des déchets.
                    - **Réduction des plastiques à usage unique :** Priorité à l'utilisation de matériaux réutilisables et compostables.
                    - **Partenariats avec des entreprises de recyclage :** Collaboration avec des entreprises spécialisées dans le recyclage des matériaux événementiels.
                    """)
                }
                
                Group {
                    Text("3. Utilisation de matériaux durables")
                        .font(.headline)
                    
                    Text("""
                    Pour nos prestations de décoration et tapisserie, nous privilégions des matériaux respectueux de l'environnement :
                    - **Choix de matériaux écologiques :** Utilisation de tissus organiques, de bois certifié FSC, et d'autres matériaux durables.
                    - **Réemploi des décors :** Conception de décors modulables et réutilisables pour différents événements.
                    """)
                }
                
                Group {
                    Text("4. Sensibilisation et formation")
                        .font(.headline)
                    
                    Text("""
                    Nous croyons que la sensibilisation et la formation de nos équipes sont essentielles pour atteindre nos objectifs RSE :
                    - **Formations continues :** Programmes de formation pour nos collaborateurs sur les pratiques durables et la réduction de l'empreinte carbone.
                    - **Sensibilisation des clients :** Encouragement de nos clients à adopter des pratiques durables lors de la planification de leurs événements.
                    """)
                }
                
                Group {
                    Text("5. Innovation pour des événements verts")
                        .font(.headline)
                    
                    Text("""
                    Nous intégrons l'innovation au cœur de notre stratégie RSE :
                    - **Technologies vertes :** Utilisation de technologies économes en énergie pour l'éclairage, la sonorisation, et les équipements audiovisuels.
                    - **Événements zéro déchet :** Développement de concepts d'événements visant à minimiser la production de déchets et à maximiser le recyclage.
                    """)
                }
                
                Text("Engagement")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("""
                Notre engagement RSE est une priorité qui guide toutes nos actions. En réduisant notre empreinte carbone, en gérant efficacement nos déchets, en utilisant des matériaux durables, et en formant nos équipes, nous aspirons à organiser des événements qui respectent l'environnement tout en offrant des expériences mémorables et innovantes à nos clients.
                
                Nous sommes convaincus que chaque action compte et que, collectivement, nous pouvons faire une différence significative pour la planète.
                """)
            }
            .padding()
        }
        .frame(minWidth: 700, minHeight: 800)
    }
}

struct RSEObjectiveView_Previews: PreviewProvider {
    static var previews: some View {
        RSEObjectiveView()
    }
}
