//
//  RegisterViewModel.swift
//  SkilibraSpa
//
//  Created by Julian González on 25/06/24.
//

import Foundation
import Combine

class RegisterViewModel: ObservableObject {
    @Published var isRegister = false
    
    @Published var name = ""
    @Published var isValidName = true
    
    @Published var lastName = ""
    @Published var isValidLastName = true
    
    @Published var age = ""
    @Published var isValidAge = true
    
    @Published var phoneNumber = ""
    @Published var isValidPhoneNumber = true
    
    @Published var gender = ""
    @Published var isValidGender = true
    
    @Published var password = ""
    @Published var isValidPassword = true
    
    @Published var confirmPassword = ""
    @Published var isValidConfirmPassword = true
    @Published var isSamePasswords = true
    
    @Published var showObservationsInfo = false
    @Published var observations = ""
    
    @Published var showPhoneInfo = false
    @Published var showPassword = true
    @Published var showConfirmPassword = true
    
    @Published var isRealTime = false
    var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        $name
            .receive(on: RunLoop.main)
            .map { name in
                return self.isRealTime ? name.count > 3 : true
            }
            .assign(to: \.isValidName, on: self)
            .store(in: &cancellableSet)
        
        $lastName
            .receive(on: RunLoop.main)
            .map { lastName in
                return self.isRealTime ? lastName.count > 3 : true
            }
            .assign(to: \.isValidLastName, on: self)
            .store(in: &cancellableSet)
        
        $age
            .receive(on: RunLoop.main)
            .map { age in
                return self.isRealTime ? (Int(age) ?? 0 >= 15 && Int(age) ?? 0 < 80) : true
            }
            .assign(to: \.isValidAge, on: self)
            .store(in: &cancellableSet)
        
        //TODO: validación indicativo
        
        $phoneNumber
            .receive(on: RunLoop.main)
            .map { numberPhone in
                return self.isRealTime ? numberPhone.count == 10 : true
            }
            .assign(to: \.isValidPhoneNumber, on: self)
            .store(in: &cancellableSet)
        
        $gender
            .receive(on: RunLoop.main)
            .map { gender in
                return self.isRealTime ? gender != "" : true
            }
            .assign(to: \.isValidGender, on: self)
            .store(in: &cancellableSet)
        
        if isRegister {
            $password
                .receive(on: RunLoop.main)
                .map { password in
                    return self.isRealTime ? self.isValidPasswordRegex(password: password) : true
                }
                .assign(to: \.isValidPassword, on: self)
                .store(in: &cancellableSet)
            
            $confirmPassword
                .receive(on: RunLoop.main)
                .map { confirmPassword in
                    return self.isRealTime ? self.isSomePassword(confirmPassword: confirmPassword) : true
                }
                .assign(to: \.isValidConfirmPassword, on: self)
                .store(in: &cancellableSet)
        }
    }
    
    func isValidPasswordRegex(password: String) -> Bool {
        if password.isEmpty {
            return false
        }
        let pattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{6,}$"
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: password)
    }
    
    func isSomePassword(confirmPassword: String) -> Bool {
        if password.isEmpty || confirmPassword.isEmpty {
            return false
        }
        return password == confirmPassword
    }
    
    func validationField() -> Bool {
        isValidName = name.count > 3
        isValidLastName = lastName.count > 3
        isValidAge = age != "" ? ((Int(age)! >= 15 && Int(age)! < 80) ? true : false) : false
        isValidPhoneNumber = phoneNumber.count == 10
        isValidGender = !gender.isEmpty
        
        if isRegister {
            isValidPassword = isValidPasswordRegex(password: password)
            isValidConfirmPassword = isSomePassword(confirmPassword: confirmPassword)
            return isValidName && isValidLastName && isValidAge && isValidPhoneNumber && isValidGender && isValidPassword && isValidConfirmPassword
        }
        
        return isValidName && isValidLastName && isValidAge && isValidPhoneNumber && isValidGender
        
    }
}
