import SwiftUI
import MapKit

struct MapView: NSViewRepresentable {
    @Binding var region: MKCoordinateRegion
    @Binding var annotations: [MKPointAnnotation]

    func makeNSView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateNSView(_ nsView: MKMapView, context: Context) {
        nsView.setRegion(region, animated: true)
        nsView.addAnnotations(annotations)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView

        init(_ parent: MapView) {
            self.parent = parent
        }
    }
}

struct PlansView: View {
    @ObservedObject var project: Project
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @State private var annotations: [MKPointAnnotation] = []

    var body: some View {
        VStack {
            MapView(region: $region, annotations: $annotations)
                .frame(height: 700)

            Button(action: {
                let newAnnotation = MKPointAnnotation()
                newAnnotation.coordinate = region.center
                annotations.append(newAnnotation)
            }) {
                Label("Ajouter un point", systemImage: "plus")
            }
            .padding()
        }
        .navigationTitle("Plans")
    }
}
