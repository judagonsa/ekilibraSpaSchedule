//
//  RegisterModel.swift
//  SkilibraSpa
//
//  Created by Julian González on 25/06/24.
//
import SwiftUI

class UserModel: Codable {
    var name: String
    var lastName: String
    var phoneNumber: String
    var age: String
    var gender: String
    var observations: String
    var photo: Data?
    
    init(name: String, lastName: String, phoneNumber: String, age: String, gender: String, observations: String, photo: Data?) {
        self.name = name
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.age = age
        self.gender = gender
        self.observations = observations
        self.photo = photo
    }
    
    func printData() -> String {
        return "name: \(name), lastName: \(lastName), phoneNumber: \(phoneNumber), age: \(age), gender: \(gender), observation: \(observations)"
    }
}
