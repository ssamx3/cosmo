import SwiftUI
import SwiftData

@available(iOS 17.0, *)
struct ContentView: View {
    @State private var welcomeSheet = false
    
    
    
    var body: some View {
        if #available(iOS 18.0, *) {
                
                TabView {
                    
                    ScrollHomepage()
                        .tabItem {
                            Label("Home", systemImage: "sparkles")
                        }
                    
                    AddView()
                        .tabItem {
                            Label("Add", systemImage: "square.and.pencil")
                        }
                    ToolboxView()
                        .tabItem {
                            Label("Toolbox", systemImage: "heart.circle.fill")
                        }
                        
                    
                    
                }.tabViewStyle(.sidebarAdaptable)
                    .sheet(isPresented: $welcomeSheet) {
                        WelcomePage()
                    }
                
            .onAppear{
                let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
                if launchedBefore == false {
                    welcomeSheet = true
                    UserDefaults.standard.set(true, forKey: "launchedBefore")
                }
            }
            
            
        } else {
            TabView {
                
                ScrollHomepage()
                    .tabItem {
                        Label("Home", systemImage: "sparkles")
                    }
                
                AddView()
                    .tabItem {
                        Label("Add", systemImage: "square.and.pencil")
                    }
                ToolboxView()
                    .tabItem {
                        Label("Toolbox", systemImage: "heart.circle")
                    }
                
                
            }// Fallback on earlier versions
        }
    }
}

