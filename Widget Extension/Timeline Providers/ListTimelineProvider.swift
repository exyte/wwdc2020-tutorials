import WidgetKit

struct ListTimelineProvider: TimelineProvider {

    typealias Entry = ScooterListEntry

    func placeholder(in context: Context) -> Entry {
        let scooters = Array(AppModel().scooters[0...1])
        return Entry(date: Date(), scooters: scooters)
    }

    func getSnapshot(in context: Context, completion: @escaping (Entry) -> ()) {
        let scooters = Array(AppModel().scooters[0...1])
        completion(Entry(date: Date(), scooters: scooters))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let scooters = Array(AppModel().scooters.shuffled()[0...1])
        completion(Timeline(entries: [Entry(date: Date(), scooters: scooters)], policy: .never))
    }

}
