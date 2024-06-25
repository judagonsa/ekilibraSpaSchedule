//
//  RegisterModel.swift
//  SkilibraSpa
//
//  Created by Julian González on 25/06/24.
//

class UserModel: Codable {
    var name: String
    var lastName: String
    var phoneNumber: String
    var age: String
    var observations: String
    
    init(name: String, lastName: String, phoneNumber: String, age: String, observations: String) {
        self.name = name
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.age = age
        self.observations = observations
    }
}
