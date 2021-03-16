import WidgetKit

struct ScooterEntry: TimelineEntry {

    let configuration: ConfigurationIntent
    let date: Date

    let startDate: Date?
    let scooter: Scooter?
    let remainingCharge: Int
    let cost: Double

}
