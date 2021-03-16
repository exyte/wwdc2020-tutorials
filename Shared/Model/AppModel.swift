import Foundation
import MapKit

class AppModel: ObservableObject {
    
    @Published var selectedScooter: Scooter?
    @Published var isChatPresented: Bool = false
    
    @Published var scooters: [Scooter] = [
        Scooter(
            id: 1,
            name: "S001",
            batteryCharge: 24,
            chargeConsumptionPerMinute: 1,
            reservationFee: 10,
            costPerMinute: 2,
            speed: .normal,
            location: CLLocationCoordinate2D(latitude: 40.735563, longitude: -73.991496)
        ),
        Scooter(
            id: 2,
            name: "S002",
            batteryCharge: 70,
            chargeConsumptionPerMinute: 1,
            reservationFee: 11,
            costPerMinute: 3,
            speed: .normal,
            location: CLLocationCoordinate2D(latitude: 40.737126, longitude: -73.994350)
        ),
        Scooter(
            id: 3,
            name: "S003",
            batteryCharge: 50,
            chargeConsumptionPerMinute: 2,
            reservationFee: 11,
            costPerMinute: 3,
            speed: .fast,
            location: CLLocationCoordinate2D(latitude: 40.740239, longitude: -73.989490))
        ,
        Scooter(
            id: 4,
            name: "S004",
            batteryCharge: 91,
            chargeConsumptionPerMinute: 2,
            reservationFee: 12,
            costPerMinute: 3,
            speed: .fast,
            location: CLLocationCoordinate2D(latitude: 40.741908, longitude: -73.990445)
        ),
        Scooter(
            id: 5,
            name: "S005",
            batteryCharge: 76,
            chargeConsumptionPerMinute: 2,
            reservationFee: 10,
            costPerMinute: 2,
            speed: .fast,
            location: CLLocationCoordinate2D(latitude: 40.750463, longitude: -73.989393)
        ),
        Scooter(
            id: 6,
            name: "S006",
            batteryCharge: 100,
            chargeConsumptionPerMinute: 1,
            reservationFee: 12,
            costPerMinute: 3,
            speed: .normal,
            location: CLLocationCoordinate2D(latitude: 40.747839, longitude: -73.996646)
        ),
        Scooter(
            id: 7,
            name: "S007",
            batteryCharge: 57,
            chargeConsumptionPerMinute: 2,
            reservationFee: 10,
            costPerMinute: 2.5,
            speed: .fast,
            location: CLLocationCoordinate2D(latitude: 40.744264, longitude: -73.996031)
        ),
        Scooter(
            id: 8,
            name: "S008",
            batteryCharge: 2,
            chargeConsumptionPerMinute: 1,
            reservationFee: 10,
            costPerMinute: 1.5,
            speed: .normal,
            location: CLLocationCoordinate2D(latitude: 40.748400, longitude: -73.986518)
        )
    ]
    
    func findScooterById(_ id: Int) -> Scooter? {
        return scooters.first(where: { $0.id == id })
    }
    
    private static let appGroup = "group.company.ScooterRentalApp"
    
    func setRideStartDate(_ date: Date) {
        UserDefaults(suiteName: AppModel.appGroup)?.setValue(date, forKey: "startDate")
    }
    
    func getRideStartDate() -> Date? {
        UserDefaults(suiteName: AppModel.appGroup)?.value(forKey: "startDate") as? Date
    }
    
    func resetRideStartDate() {
        UserDefaults(suiteName: AppModel.appGroup)?.setValue(nil, forKey: "startDate")
    }
    
    func setSelectedScooter(_ id: Int) {
        UserDefaults(suiteName: AppModel.appGroup)?.setValue(id, forKey: "selectedScooter")
    }
    
    func getSelectedScooter() -> Scooter? {
        guard let id = UserDefaults(suiteName: AppModel.appGroup)?.value(forKey: "selectedScooter") as? Int else {
            return nil
        }
        return findScooterById(id)
    }
    
    func resetSelectedScooter() {
        UserDefaults(suiteName: AppModel.appGroup)?.setValue(nil, forKey: "selectedScooter")
    }

}
