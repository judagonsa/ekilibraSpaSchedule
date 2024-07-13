//
//  ChangePasswordViewModel.swift
//  SkilibraSpa
//
//  Created by Julian González on 13/07/24.
//

import Foundation
import Combine

class ChangePasswordViewModel: ObservableObject {
    @Published var currentPassword = ""
    @Published var showCurrentPassword = false
    @Published var isValidCurrentPassword = true
    
    @Published var newPassword = ""
    @Published var showNewPassword = false
    @Published var isValidNewPassword = true
    
    
    @Published var repeatNewPassword = ""
    @Published var showRepeatNewPassword = false
    @Published var isValidRepeatNewPassword = true
    
    
    @Published var isRealTime = false
    var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        $currentPassword
            .receive(on: RunLoop.main)
            .map { currentPassword in
                return self.isRealTime ? self.isValidPasswordRegex(password: currentPassword) : true
            }
            .assign(to: \.isValidNewPassword, on: self)
            .store(in: &cancellableSet)
        
        $newPassword
            .receive(on: RunLoop.main)
            .map { newPassword in
                return self.isRealTime ? self.isValidPasswordRegex(password: newPassword) : true
            }
            .assign(to: \.isValidNewPassword, on: self)
            .store(in: &cancellableSet)
        
        $repeatNewPassword
            .receive(on: RunLoop.main)
            .map { repeatNewPassword in
                return self.isRealTime ? self.isSomePassword(confirmPassword: repeatNewPassword) : true
            }
            .assign(to: \.isValidRepeatNewPassword, on: self)
            .store(in: &cancellableSet)
    }
    
    func isValidPasswordRegex(password: String) -> Bool {
        if password.isEmpty {
            return false
        }
        let pattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{6,}$"
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: password)
    }
    
    func isSomePassword(confirmPassword: String) -> Bool {
        if newPassword.isEmpty || repeatNewPassword.isEmpty {
            return false
        }
        return newPassword == confirmPassword
    }
    
    func validationField() -> Bool {
        
        
        return true
    }
}
