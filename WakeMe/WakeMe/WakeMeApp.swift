//
//  WakeMeApp.swift
//  WakeMe
//
//  Created by Madhav Raj Verma on 8/12/21.
//

import SwiftUI
import CoreData

@main
struct WakeMeApp: App {
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) var scenePhase
    @AppStorage("SignIn") var signIn:Bool = false


    var body: some Scene {
        WindowGroup {
            if signIn {
                ContentView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }else {
                SignInView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
            
        }.onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
        
    }
}
