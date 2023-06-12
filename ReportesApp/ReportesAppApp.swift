//
//  ReportesAppApp.swift
//  ReportesApp
//
//  Created by Yery Castro on 13/3/23.
//

import SwiftUI

@main
struct ReportesAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
