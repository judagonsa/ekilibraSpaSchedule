//
//  RegisterViewModel.swift
//  SkilibraSpa
//
//  Created by Julian González on 25/06/24.
//

import Foundation
import Combine

class RegisterViewModel: ObservableObject {
    @Published var name = ""
    @Published var isValidName = true
    
    @Published var lastName = ""
    @Published var isValidLastName = true
    
    @Published var age = ""
    @Published var isValidAge = true
    
    @Published var numberPhone = ""
    @Published var isValidNumberPhone = true
    
    @Published var gender = ""
    @Published var isValidGender = true
    
    @Published var observations = ""
    
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
        
        $numberPhone
            .receive(on: RunLoop.main)
            .map { numberPhone in
                return self.isRealTime ? numberPhone.count == 10 : true
            }
            .assign(to: \.isValidNumberPhone, on: self)
            .store(in: &cancellableSet)
        
        $gender
            .receive(on: RunLoop.main)
            .map { gender in
                return self.isRealTime ? gender != "" : true
            }
            .assign(to: \.isValidGender, on: self)
            .store(in: &cancellableSet)
    }
    
    func validationField() -> Bool {
        isValidName = name.count > 3
        isValidLastName = lastName.count > 3
        isValidAge = age != "" ? ((Int(age)! >= 15 && Int(age)! < 80) ? true : false) : false
        isValidNumberPhone = numberPhone.count == 10
        isValidGender = !gender.isEmpty
        
        return isValidName && isValidLastName && isValidAge && isValidNumberPhone && isValidGender
    }
}
