import SwiftUI
import WidgetKit

@main
struct ScooterRentalAppWidgetExtensionBundle: WidgetBundle {
    
    @WidgetBundleBuilder
    var body: some Widget {
        RideWidget()
        ListWidget()
    }

}
