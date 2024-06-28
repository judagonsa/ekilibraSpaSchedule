//
//  LoginViewModel.swift
//  SkilibraSpa
//
//  Created by Julian González on 27/06/24.
//

import Foundation

import Combine

class LoginViewModel: ObservableObject {
    @Published var phoneNumber = ""
    @Published var isValidPhoneNumber = true
    
    @Published var email = ""
    @Published var isValidEmail = true
    
    @Published var isRealTime = false
    var cancellableSet: Set<AnyCancellable> = []
}
