//
//  UserdefaultHelper.swift
//  SkilibraSpa
//
//  Created by Julian González on 11/07/24.
//

import Foundation

class UserdefaultHelper {
    
    static let shared = UserdefaultHelper()
    
    func saveProfile(_ profile: UserModel) -> Bool {
        if let userData = try? JSONEncoder().encode(profile) {
            UserDefaults.standard.setValue(userData, forKey: "profile")
            return true
        }
        return false
    }
    
    func getProfile() -> UserModel?{
        if let userData = UserDefaults.standard.object(forKey: "profile") as? Data {
            if let userModel = try? JSONDecoder().decode(UserModel.self, from: userData) {
                return userModel
            }
        }
        
        return nil
    }
    
    func isFirstTime() -> Bool {
        if let firstTime = UserDefaults.standard.object(forKey: "firstTime") as? Bool {
            return firstTime
        }else {
            UserDefaults.standard.setValue(false, forKey: "firstTime")
        }
        return false
    }
}
