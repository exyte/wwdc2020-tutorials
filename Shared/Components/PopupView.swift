import SwiftUI

struct PopupView: View {
    
    @Binding var selectedScooter: Scooter?
    @State var isPresented: Bool = false

    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                VStack(alignment: .center) {
                    VStack(alignment: .center, spacing: 15) {
                        Text(selectedScooter?.name ?? "")
                            .font(Font.system(size: 22, weight: .semibold, design: .rounded))
                        Text((selectedScooter?.speed.rawValue ?? "").uppercased())
                            .foregroundColor(selectedScooter?.speed == .normal ? Color.orange : Color.green)
                            .font(Font.system(size: 14, weight: .bold, design: .rounded))
                            .padding(5)
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(selectedScooter?.speed == .normal ? Color.orange : Color.green, lineWidth: 2))
                    }
                    .padding(.bottom, 15)
                    .padding(.top, 50)
                    
                    HStack(alignment: .top) {
                        FareView(selectedScooter: $selectedScooter)
                        Spacer()
                        VStack(alignment: .trailing, spacing: 5) {
                            HStack {
                                Image(systemName: "battery.100.bolt").foregroundColor(getBatteryStatusColor(selectedScooter?.batteryCharge ?? 0))
                                (Text("\(selectedScooter?.batteryCharge ?? 0)") + Text("%"))
                                    .foregroundColor(getBatteryStatusColor(selectedScooter?.batteryCharge ?? 0))
                                    .font(Font.system(size: 16, weight: .medium, design: .rounded))
                            }
                            Text("≈ 15 minutes or 8 km")
                                .font(Font.system(size: 16, weight: .regular, design: .default))
                                .foregroundColor(Color.secondary)
                        }
                    }
                    
                }
                .padding()
                
                Button("RIDE") {
                    isPresented.toggle()
                }
                .frame(width: 90, height: 90)
                .foregroundColor(Color.white)
                .font(Font.system(size: 20, weight: .bold, design: .rounded))
                .background(Color.orange)
                .clipShape(Circle())
                .shadow(color: Color.orange.opacity(0.4), radius: 15, x: 0, y: 0)
                .padding([.top, .bottom], 25)
                .popover(isPresented: $isPresented, content: UnlockedView.init)
            }
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.3), radius: 25, x: 0, y: 5)

            ScooterIconView()
                .overlay(Circle().stroke(selectedScooter?.speed == .normal ? Color.orange.opacity(0.5) : Color.green.opacity(0.5), lineWidth: 3))
                .padding(.top, -45)
        }.padding([.leading, .trailing], 15)
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
