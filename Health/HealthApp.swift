//
//  HealthApp.swift
//  Health
//
//  Created by Haruka Nakano on 2022/12/12.
//

import SwiftUI

@main
struct HealthApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
