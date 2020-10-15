import Foundation
import MapKit

struct Scooter: Identifiable {
    
    enum Speed: String {
        
        case normal = "Normal"
        case fast = "Fast"
        
    }
    
    let id: Int
    let name: String
    let batteryCharge: Int
    let reservationFee: Double
    let costPerMinute: Double
    let speed: Speed
    let location: CLLocationCoordinate2D

}
