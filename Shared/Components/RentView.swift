import SwiftUI

struct MainView: View {
    
    @EnvironmentObject private var model: AppModel
    @State var selectedScooter: Scooter?

    var body: some View {
        ZStack(alignment: .bottom) {
            MapView(scooters: $model.scooters, selectedScooter: $model.selectedScooter)
                .zIndex(0)
                .edgesIgnoringSafeArea(.all)

            if model.selectedScooter != nil {
                PopupView(selectedScooter: $model.selectedScooter)
                    .zIndex(1)
                    .transition(.moveAndFade)
            }
        }
    }

}
