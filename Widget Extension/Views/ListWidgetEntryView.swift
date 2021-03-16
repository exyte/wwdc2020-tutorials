import SwiftUI

struct ListWidgetEntryView: View {
    
    var entry: ListTimelineProvider.Entry

    var body: some View {
        ZStack {
            Color(red: 251 / 255, green: 236 / 255, blue: 197 / 255)
            VStack(alignment: .leading, spacing: 15) {
                Image("scooter-yellow")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                Spacer()
                ForEach(entry.scooters, id: \.self) { scooter in
                    Link(destination: URL(string: "scooter://scooters?id=\(scooter.id)")!) {
                        HStack {
                            VStack(alignment: .leading, spacing: 10) {
                                Text(scooter.name)
                                    .foregroundColor(Color(red: 58 / 255, green: 42 / 255, blue: 3 / 255))
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                HStack(alignment: .center) {
                                    HStack(alignment: .top) {
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text("Starts from ")
                                                .font(Font.system(size: 18, weight: .medium, design: .rounded))
                                                .foregroundColor(Color(red: 115 / 255, green: 85 / 255, blue: 7 / 255))
                                            + Text(String(format: "$%.0f", scooter.reservationFee))
                                                .foregroundColor(Color(red: 78 / 255, green: 57 / 255, blue: 4 / 255))
                                                .font(Font.system(size: 18, weight: .medium, design: .rounded))
                                            Text(String(format: "$%.0f ", scooter.costPerMinute))
                                                .foregroundColor(Color(red: 78 / 255, green: 57 / 255, blue: 4 / 255))
                                                .font(Font.system(size: 18, weight: .medium, design: .rounded))
                                            + Text("each minute")
                                                .font(Font.system(size: 18, weight: .regular, design: .rounded))
                                                .foregroundColor(Color(red: 115 / 255, green: 85 / 255, blue: 7 / 255))
                                        }
                                    }
                                    Spacer()
                                }
                            }
                            Image(systemName: "battery.100.bolt")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(EdgeInsets(top: 8, leading: 9, bottom: 8, trailing: 7))
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                                .background(getBatteryStatusColor(scooter.batteryCharge))
                                .clipShape(Circle())
                    }
                        .padding(15)
                        .background(Color(red: 249 / 255, green: 223 / 255, blue: 159 / 255))
                        .cornerRadius(16)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(15)
        }
        
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
