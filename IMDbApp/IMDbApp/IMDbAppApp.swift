//
//  IMDbAppApp.swift
//  IMDbApp
//
//  Created by Jan Kazubski on 24/08/2024.
//

import SwiftUI
import SwiftData

@main
struct IMDbAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: MovieData.self)
    }
}
