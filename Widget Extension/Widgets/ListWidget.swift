import SwiftUI
import WidgetKit

struct ListWidget: Widget {

    let kind: String = "ScooterListWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: ListTimelineProvider()) { entry in
            ListWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("List Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemLarge])
    }

}
