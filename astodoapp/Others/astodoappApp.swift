//
//  astodoappApp.swift
//  astodoapp
//
//  Created by asdirector on 14.12.2023.
//

import SwiftUI
import FirebaseCore

@main
struct astodoappApp: App {
    
    init (){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
