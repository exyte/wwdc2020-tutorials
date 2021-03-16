import Foundation
import MapKit

struct Scooter: Identifiable, Hashable {
    
    enum Speed: String {
        
        case normal = "Normal"
        case fast = "Fast"
        
    }
    
    var id: Int
    let name: String
    let batteryCharge: Int
    let chargeConsumptionPerMinute: Int
    let reservationFee: Double
    let costPerMinute: Double
    let speed: Speed
    let location: CLLocationCoordinate2D
    
    func fullDischargeDate(_ fromDate: Date) -> Date? {
        let minutesUntilDischarge = batteryCharge / chargeConsumptionPerMinute
        return Calendar.current.date(byAdding: .minute, value: Int(minutesUntilDischarge), to: fromDate)
    }
    
    func calculateRemainingCharge(_ fromDate: Date, toDate: Date) -> Int {
        return batteryCharge - (Calendar.current.dateComponents([.minute], from: fromDate, to: toDate).minute ?? 0) * chargeConsumptionPerMinute
    }
    
    func calculateCost(_ fromDate: Date, toDate: Date) -> Double {
        return Double(Calendar.current.dateComponents([.minute], from: fromDate, to: toDate).minute ?? 0) * costPerMinute + reservationFee
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Scooter, rhs: Scooter) -> Bool {
        return lhs.id == rhs.id
    }

}
