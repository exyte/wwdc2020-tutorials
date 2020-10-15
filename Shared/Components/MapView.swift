import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    @Binding var scooters: [Scooter]
    @Binding var selectedScooter: Scooter?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, selectedScooter: $selectedScooter)
    }
    
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.delegate = context.coordinator
        
        let coordinate = CLLocationCoordinate2D(latitude: 40.736212, longitude: -73.993406)
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
        
        if scooters.count != uiView.annotations.count {
            uiView.removeAnnotations(uiView.annotations)
            uiView.addAnnotations(scooters.map {
                let annotation = ScooterAnnotation()
                annotation.coordinate = $0.location
                annotation.scooter = $0
                return annotation
            })
        }
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        
        var parent: MapView
        @Binding var selectedScooter: Scooter?

        init(_ parent: MapView, selectedScooter: Binding<Scooter?>) {
            self.parent = parent
            self._selectedScooter = selectedScooter
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard !(annotation is MKUserLocation) else {
                return .none
            }
            let identifier = "ScooterAnnotation"
            let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            annotationView.canShowCallout = false
            return annotationView
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            guard let annotation = view.annotation as? ScooterAnnotation else {
                return
            }
            withAnimation {
                selectedScooter = annotation.scooter
            }
            mapView.setCenter(view.annotation!.coordinate, animated: true)
        }
        
        func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
            withAnimation {
                selectedScooter = nil
            }
        }
        
    }
    
}
