//
//  EnvironmentObject_in_swiftApp.swift
//  EnvironmentObject in swift
//
//  Created by Sameer,s Macbook on 1/23/25.
//

import SwiftUI

@main
struct EnvironmentObject_in_swiftApp: App {
    
    @State private var appState = Appstate()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appState)
        }
    }
}
