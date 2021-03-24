//
//  TikTok_Stats_ProfileApp.swift
//  TikTok Stats Profile
//
//  Created by Arrinal Sholifadliq on 03/03/21.
//

import SwiftUI

@main
struct TikTok_Stats_ProfileApp: App {
    
    let persistenceContainer = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
        }
    }
}
