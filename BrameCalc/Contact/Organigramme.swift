import SwiftUI

struct OrganizationChartView: View {
    var body: some View {
        VStack {
            Text("Organigramme du Groupe BRAME")
                .font(.largeTitle)
                .padding()

            HStack {
                VStack {
                    Image("logo_cts")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    Text("CTS")
                }
                VStack {
                    Image("logo_av")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    Text("AV")
                }
                VStack {
                    Image("logo_electricite")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    Text("ELECTRICITE")
                }
            }

            HStack {
                VStack {
                    Image("logo_truss_rig")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    Text("TRUSS/RIG")
                }
                VStack {
                    Image("logo_agence")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    Text("AGENCE")
                }
                VStack {
                    Image("logo_regie_generale")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    Text("REGIE GENERALE")
                }
                VStack {
                    Image("logo_deco")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    Text("DECO")
                }
            }
        }
        .padding()
    }
}
