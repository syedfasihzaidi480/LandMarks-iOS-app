//
//  LandmaksApp.swift
//  Landmaks
//
//  Created by fasih zaidi on 08/07/2024.
//

import SwiftUI

@main
struct LandmaksApp: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
