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
    @Published var showCurrentPassword = true
    @Published var isValidCurrentPassword = true
    
    @Published var newPassword = ""
    @Published var showNewPassword = true
    @Published var isValidNewPassword = true
    
    
    @Published var repeatNewPassword = ""
    @Published var showRepeatNewPassword = true
    @Published var isValidRepeatNewPassword = true
    
    
    @Published var isRealTime = false
    var cancellableSet: Set<AnyCancellable> = []
    
    init() {
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
    
    func isPasswordSave() -> Bool {
        return currentPassword == KeychainManager.shared.getPassword()
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
        isValidCurrentPassword = isPasswordSave()
        isValidNewPassword = isValidPasswordRegex(password: newPassword)
        isValidRepeatNewPassword = isSomePassword(confirmPassword: repeatNewPassword)
        
        return isValidCurrentPassword && isValidNewPassword && isValidRepeatNewPassword
    }
}
