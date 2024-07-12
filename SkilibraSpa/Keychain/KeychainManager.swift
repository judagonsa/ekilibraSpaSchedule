//
//  KeychainManager.swift
//  SkilibraSpa
//
//  Created by Julian González on 11/07/24.
//

import Foundation


protocol KeychainManagerType {
    func getPassword() -> String?
    func savePassword(_ password: String) -> Bool
    func deletePassword() -> Bool
    func updatePassword(_ passwordData: Data) -> Bool
}

class KeychainManager: KeychainManagerType {
    
    static let shared = KeychainManager()
    
    func getPassword() -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "user_account",
            kSecReturnData as String: true
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        guard status == errSecSuccess else { return nil }
        
        guard let passwordData = result as? Data, let password = String(data: passwordData, encoding: .utf8) else {
            return nil
        }
        
         return password
    }
    
    @discardableResult
    func savePassword(_ password: String) -> Bool {
        guard let passwordData = password.data(using: .utf8) else { return false }
        
        if getPassword() != nil {
            return updatePassword(passwordData)
        }else {
            
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: "user_account",
                kSecValueData as String: passwordData
            ]
            
            let status = SecItemAdd(query as CFDictionary, nil)
            
            return status == errSecSuccess
        }
    }
    
    func deletePassword() -> Bool {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "user_account"
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        
        return status == errSecSuccess
    }
    
    func updatePassword(_ passwordData: Data) -> Bool {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "user_account"
        ]
        
        let updateQuery: [String: Any] = [
            kSecValueData as String: passwordData
        ]
        
        let status = SecItemUpdate(query as CFDictionary, updateQuery as CFDictionary)
        
        return status == errSecSuccess
    }
}
