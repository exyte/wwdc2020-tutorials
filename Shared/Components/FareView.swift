import SwiftUI

struct FareView: View {
    
    @Binding var selectedScooter: Scooter?
    @State private var isPresented = false
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 5) {
                Text("Starts from ")
                    .font(Font.system(size: 16, weight: .regular, design: .default))
                    .foregroundColor(Color.secondary)
                + Text(String(format: "$%.0f", selectedScooter?.reservationFee ?? 0))
                    .font(Font.system(size: 16, weight: .medium, design: .default))
                Text(String(format: "$%.0f ", selectedScooter?.costPerMinute ?? 0))
                    .font(Font.system(size: 16, weight: .medium, design: .default))
                + Text("each minute")
                    .font(Font.system(size: 16, weight: .regular, design: .default))
                    .foregroundColor(Color.secondary)
            }
        }
    }
    
}
