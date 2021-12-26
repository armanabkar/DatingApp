//
//  DatingApp.swift
//  DatingApp
//
//  Created by Arman Abkar on 12/8/21.
//

import SwiftUI

@main
struct TestApp: App {
    
    init() {
        Task.init {
            let _ = try await WebService.shared.startServer()
        }
    }
    
    var body: some Scene {
        WindowGroup {
            AuthView()
        }
    }
}
