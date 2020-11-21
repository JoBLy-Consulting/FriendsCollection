//
//  FriendsCollectionApp.swift
//  FriendsCollection
//
//  Created by Johan Guenaoui on 01/10/2020.
//

import SwiftUI

@main
struct FriendsCollectionApp: App {
    @Environment(\.scenePhase) var _scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: _scenePhase) { newPhase in
            switch newPhase {
            case .active: print("active")
            case .inactive: print("inactive")
            case .background: print("background")
            default: print("other")
            }
        }
    }
}

struct FriendsCollectionApp_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
