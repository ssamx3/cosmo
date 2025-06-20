import SwiftUI
import SwiftData

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            if #available(iOS 17.0, *) {
                ContentView()
                    .modelContainer(for: Entry.self)
                    .preferredColorScheme(.dark)
            } else {
                // Fallback on earlier versions
                Text("This app requires iOS 17 or later")
            }
        }
    }
}
