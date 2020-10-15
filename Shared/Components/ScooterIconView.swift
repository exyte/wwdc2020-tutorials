import SwiftUI

struct ScooterIconView: View {
    
    var body: some View {
        Image("scooter")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(20)
            .frame(width: 100, height: 100)
            .background(Color.white)
            .clipShape(Circle())
    }
    
}
