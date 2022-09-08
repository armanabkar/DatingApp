//
//  DatingApp.swift
//  DatingApp
//
//  Created by Arman Abkar on 12/8/21.
//

import SwiftUI

@main
struct TestApp: App {
    
    @StateObject private var model: HomeViewModel
    
    init() {
        self._model = StateObject(wrappedValue: HomeViewModel())
    }
    
    var body: some Scene {
        WindowGroup {
            if model.isLogin {
                ContentView()
                    .environmentObject(model)
            } else {
                AuthView()
                    .environmentObject(model)
            }
        }
    }
}
