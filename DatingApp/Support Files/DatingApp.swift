//
//  DatingApp.swift
//  DatingApp
//
//  Created by Arman Abkar on 12/8/21.
//

import SwiftUI

@main
struct TestApp: App {
    
    @StateObject private var model = HomeViewModel()
    
    init() {
        model.startServer()
    }
    
    var body: some Scene {
        WindowGroup {
            if model.isLogin {
                TabsView()
                    .environmentObject(model)
            } else {
                AuthView()
                    .environmentObject(model)
            }
        }
    }
}
