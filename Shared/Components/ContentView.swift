import SwiftUI
import MapKit

struct ContentView: View {
    
    @EnvironmentObject private var model: AppModel

    var body: some View {
        NavigationView {
            MainView()
                .navigationBarItems(
                    leading: Text("")
                        .foregroundColor(.black)
                        .font(Font.system(size: 36, weight: .bold, design: .rounded)),
                    trailing: Button(action: { model.isChatPresented.toggle() }) {
                        HStack(spacing: 10) {
                            Image(systemName: "questionmark.circle.fill")
                        }
                        .padding(10)
                        .background(Color.white)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray.opacity(0.2), lineWidth: 0.5))
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 0)
                        .accentColor(Color.black.opacity(0.7))
                    }
                    .fullScreenCover(isPresented: $model.isChatPresented, content: SupportChatView.init)
                )
                .environmentObject(model)
        }
    }
}
