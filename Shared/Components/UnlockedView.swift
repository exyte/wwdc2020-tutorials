import SwiftUI
import WidgetKit

struct UnlockedView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject private var model: AppModel
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "lock.open.fill").resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(10)
                    .frame(width: 40, height: 40)
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .clipShape(Circle())
                Text("Unlocked")
                    .font(Font.system(size: 48, weight: .bold, design: .rounded))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.green)
            }
            
            Text("Enjoy your ride")
                .font(Font.system(size: 36, weight: .semibold, design: .default))
                .multilineTextAlignment(.leading)

            Button(action: {
                model.resetRideStartDate()
                model.resetSelectedScooter()
                WidgetCenter.shared.reloadTimelines(ofKind: "ScooterRideWidget")
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "stop.fill").resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(35)
                    .frame(width: 100, height: 100)
                    .background(Color.red)
                    .foregroundColor(Color.white)
                    .clipShape(Circle())
                    .shadow(color: Color.red.opacity(0.4), radius: 15, x: 0, y: 0)
                    .offset(y: 50)
            }
            
        }
    }
    
}
