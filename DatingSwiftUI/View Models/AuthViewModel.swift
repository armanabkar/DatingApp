//
//  AuthViewModel.swift
//  DatingSwiftUI
//
//  Created by Arman Abkar on 12/3/21.
//

import SwiftUI

final class AuthViewModel: ObservableObject {
    
    @Published var phoneNumber: String = ""
    @Published var name: String = ""
    @Published var age: String = ""
    
}
