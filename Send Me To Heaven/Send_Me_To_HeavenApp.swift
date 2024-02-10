//
//  Send_Me_To_HeavenApp.swift
//  Send Me To Heaven
//
//  Created by Zachary MacConnell on 2/1/24.
//

import SwiftUI
import SwiftData

@main
struct Send_Me_To_HeavenApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            AltitudeTrackerView() // Change ContentView() to AltitudeTrackerView()
                .environmentObject(sharedModelContainer) // Pass the shared model container if necessary
        }
    }
}
