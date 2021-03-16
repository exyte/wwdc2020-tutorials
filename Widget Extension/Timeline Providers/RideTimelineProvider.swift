import WidgetKit

struct RideTimelineProvider: IntentTimelineProvider {
    
    typealias Entry = ScooterEntry
    
    func placeholder(in context: Context) -> Entry {
        Entry(configuration: ConfigurationIntent(), date: Date(), startDate: nil, scooter: nil, remainingCharge: 0, cost: 0)
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Entry) -> ()) {
        let entry = Entry(configuration: context.isPreview ? ConfigurationIntent() : configuration, date: Date(), startDate: nil, scooter: nil, remainingCharge: 0, cost: 0)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let model = AppModel()
        guard let selectedScooter = model.getSelectedScooter(),
              let startDate = model.getRideStartDate(),
              let endDate = selectedScooter.fullDischargeDate(startDate) else {
            completion(Timeline(entries: [
                Entry(configuration: configuration, date: Date(), startDate: nil, scooter: nil, remainingCharge: 0, cost: 0)
            ], policy: .never))
            return
        }
        
        let oneMinute: TimeInterval = 60
        var currentDate = Date()
        var entries: [Entry] = []
        
        while currentDate <= endDate {
            let remainingCharge = selectedScooter.calculateRemainingCharge(startDate, toDate: currentDate)
            let cost = selectedScooter.calculateCost(startDate, toDate: currentDate)
            let entry = Entry(configuration: configuration, date: currentDate, startDate: startDate, scooter: selectedScooter, remainingCharge: remainingCharge, cost: cost)

            currentDate += oneMinute
            entries.append(entry)
        }

        completion(Timeline(entries: entries, policy: .atEnd))
    }

}
