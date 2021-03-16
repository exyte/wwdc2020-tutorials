import SwiftUI

@main
struct ScooterRentalApp: App {
    
    @StateObject private var model = AppModel()
    
    var body: some Scene {
        WindowGroup {
            #if APPCLIP
            ContentView()
                .environmentObject(model)
                .onContinueUserActivity(NSUserActivityTypeBrowsingWeb, perform: handleUserActivity)
            #else
            ContentView()
                .environmentObject(model)
                .onOpenURL(perform: { url in
                    guard let components = NSURLComponents(url: url, resolvingAgainstBaseURL: true) else {
                        return
                    }
                    if let queryItems = components.queryItems,
                       let scooterId = queryItems.first(where: { $0.name == "id" })?.value {
                        model.selectedScooter = model.findScooterById(Int(scooterId) ?? 0)
                    }
                })
            #endif
        }
    }
    
    #if APPCLIP
    func handleUserActivity(_ userActivity: NSUserActivity) {
        guard let incomingURL = userActivity.webpageURL,
              let components = NSURLComponents(url: incomingURL, resolvingAgainstBaseURL: true) else {
            return
        }
        switch components.path {
        case "/help":
            model.isChatPresented = true
        case "/scooters":
            if let queryItems = components.queryItems,
               let scooterId = queryItems.first(where: { $0.name == "id" })?.value {
                model.selectedScooter = model.findScooterById(Int(scooterId) ?? 0)
            }
        default:
            break
        }
    }
    #endif
    
}
