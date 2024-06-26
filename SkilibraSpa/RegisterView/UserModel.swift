//
//  RegisterModel.swift
//  SkilibraSpa
//
//  Created by Julian González on 25/06/24.
//

class UserModel: Codable {
    var name: String
    var lastName: String
    var numberPhone: String
    var age: String
    var gender: String
    var observations: String
    
    init(name: String, lastName: String, numberPhone: String, age: String, gender: String, observations: String) {
        self.name = name
        self.lastName = lastName
        self.numberPhone = numberPhone
        self.age = age
        self.gender = gender
        self.observations = observations
    }
}
