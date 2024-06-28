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
    
    @Published var password = ""
    @Published var isValidPasword = true
    
    @Published var isRealTime = false
    var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        $phoneNumber
            .receive(on: RunLoop.main)
            .map { numberPhone in
                return self.isRealTime ? numberPhone.count == 10 : true
            }
            .assign(to: \.isValidPhoneNumber, on: self)
            .store(in: &cancellableSet)
        
        $password
            .receive(on: RunLoop.main)
            .map { password in
                return self.isRealTime ? !password.isEmpty : true
            }
            .assign(to: \.isValidPasword, on: self)
            .store(in: &cancellableSet)
    }
    
    func validationField() -> Bool {
        isValidPhoneNumber = phoneNumber.count == 10
        isValidPasword = !password.isEmpty
        
        return isValidPhoneNumber && isValidPasword
    }
}
