//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Esteban SEMELLIER on 29/04/2023.
//

import SwiftUI

@main
struct TodoAppApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var todoVM = TodoViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(todoVM)
                .preferredColorScheme(.dark)
            
        }
    }
}
