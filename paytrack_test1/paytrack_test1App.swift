//
//  paytrack_test1App.swift
//  paytrack_test1
//
//  Created by Stephen Dawes on 07/04/2025.
//

import SwiftUI
import SwiftData

@main
struct paytrack_test1App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Transaction.self)
    }
}
