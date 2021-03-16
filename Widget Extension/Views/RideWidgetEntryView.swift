import SwiftUI

struct RideWidgetEntryView: View {
    
    @Environment(\.widgetFamily) var family
    
    var entry: RideTimelineProvider.Entry

    var body: some View {
        switch entry.scooter != nil {
        case true:
            rideStatusView
        case false:
            emptyRideView
        }
    }
    
    var emptyRideView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 15) {
                Image("scooter-yellow")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                Spacer()
                Text("RIDE")
                    .foregroundColor(Color(red: 115 / 255, green: 85 / 255, blue: 7 / 255))
                    .font(Font.system(size: 16, weight: .bold, design: .rounded))
                    .padding([.top, .bottom], 15)
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 248 / 255, green: 220 / 255, blue: 150 / 255))
                    .cornerRadius(16)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(15)
        .background(Color(red: 251 / 255, green: 236 / 255, blue: 197 / 255))
    }
    
    var rideStatusView: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack(alignment: .center, spacing: 10) {
                HStack {
                    Image("scooter-yellow")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                }
                Text("\(entry.scooter?.name ?? "")")
                    .foregroundColor(Color(red: 58 / 255, green: 42 / 255, blue: 3 / 255))
                    .font(.system(size: 20, weight: .bold, design: .rounded))
            }
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 5) {
                    HStack(spacing: 5) {
                        Image(systemName: "battery.100.bolt")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(EdgeInsets(top: 5, leading: 6, bottom: 5, trailing: 4))
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .background(getBatteryStatusColor(entry.remainingCharge))
                            .clipShape(Circle())
                        (Text("\(entry.remainingCharge)") + Text("%"))
                            .foregroundColor(Color(red: 78 / 255, green: 57 / 255, blue: 4 / 255))
                            .font(Font.system(size: 16, weight: .semibold, design: .rounded))
                    }
                    HStack(spacing: 5) {
                        Image(systemName: "dollarsign.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.green)
                        Text(String(format: "%.0f", entry.cost))
                            .foregroundColor(Color(red: 78 / 255, green: 57 / 255, blue: 4 / 255))
                            .font(Font.system(size: 16, weight: .semibold, design: .rounded))
                    }
                }
                Spacer()
                if family == .systemMedium,
                   entry.configuration.showTimer?.boolValue ?? true {
                    Text(entry.startDate ?? Date(), style: .timer)
                        .font(Font.system(size: 24, weight: .semibold, design: .rounded))
                        .foregroundColor(Color(red: 115 / 255, green: 85 / 255, blue: 7 / 255))
                        .multilineTextAlignment(.trailing)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(15)
        .background(Color(red: 251 / 255, green: 236 / 255, blue: 197 / 255))
    }
    
    func getBatteryStatusColor(_ charge: Int) -> Color {
        if charge >= 90 {
            return Color.green.opacity(0.7)
        }
        if charge < 90, charge >= 30 {
            return Color.yellow
        }
        return Color.red.opacity(0.7)
    }

}
