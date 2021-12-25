//
//  AuthViewModel.swift
//  DatingApp
//
//  Created by Arman Abkar on 12/3/21.
//

import SwiftUI

final class AuthViewModel: ObservableObject {
    
    @AppStorage("isLogin") var isLogin = false
    @Published var phoneNumber: String = ""
    @Published var name: String = ""
    @Published var age: String = ""
    
    func login() {
        isLogin = true
    }
    
    func logout() {
        isLogin = false
    }
    
    func areFieldsFilled() -> Bool {
        !phoneNumber.isEmpty &&
        !name.isEmpty &&
        !age.isEmpty ? true : false
    }
    
}
