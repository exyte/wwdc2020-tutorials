import SwiftUI
import WidgetKit

struct RideWidget: Widget {

    let kind: String = "ScooterRideWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: RideTimelineProvider()) { entry in
            RideWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Ride Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }

}
