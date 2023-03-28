//
//  UserDefaultsWorker.swift
//  CustomRegistrationApp
//
//  Created by Ana Gramatkovska on 2.2.23.
//

import Foundation

class UserDefaultsWorker {
    
//    static let shared = UserDefaultsWorker()

    static let shared = UserDefaultsWorker()
    private let userDefaults: UserDefaults
    init() {
        userDefaults = UserDefaults.standard
    }
    func saveString(_ value: String, forKey key: String) {
        userDefaults.set(value, forKey: key)
    }
    func getString(forKey key: String) -> String? {
        return userDefaults.string(forKey: key)
    }
    
    
    
    private static let KEY_ACCESS_TOKEN = "auth_token"
    private static let KEY_ACCESS_TOKEN_EXPIRE = "auth_token_expire"
    private static let KEY_REFRESH_TOKEN = "refresh_token"
    
   static func saveAuthToken(tokens: TokenInfo) {
        let defaults = UserDefaults.standard
        defaults.set(tokens.token, forKey: UserDefaultsWorker.KEY_ACCESS_TOKEN)
        defaults.set(tokens.expiresIn, forKey: UserDefaultsWorker.KEY_ACCESS_TOKEN_EXPIRE)
        defaults.set(tokens.refreshToken, forKey: UserDefaultsWorker.KEY_REFRESH_TOKEN)
       
    }
    
    static func getAccessToken() -> TokenInfo {
        let defaults = UserDefaults.standard
        let token = defaults.object(forKey: UserDefaultsWorker.KEY_ACCESS_TOKEN) as? String ?? ""
        let expiresAt = defaults.object(forKey: UserDefaultsWorker.KEY_ACCESS_TOKEN_EXPIRE) as? Int64 ?? 0
        return TokenInfo(token: token, expiresIn: expiresAt, refreshToken: nil)
    }
    
    static func getRefreshToken() -> TokenInfo {
        let defaults = UserDefaults.standard
        let token = defaults.object(forKey: UserDefaultsWorker.KEY_REFRESH_TOKEN) as? String ?? ""
        return TokenInfo(token: nil, expiresIn: nil, refreshToken: token)
    }
    
    static func haveAuthToken() -> Bool {
         let accessToken = self.getAccessToken()
        if let token = accessToken.token, !token.isEmpty
        {
            return true
        }
        return false
    }
    
    static func dropTokens() {
        let defaults = UserDefaults.standard
        defaults.set("", forKey: UserDefaultsWorker.KEY_ACCESS_TOKEN)
        defaults.set(0 as Int64, forKey: UserDefaultsWorker.KEY_ACCESS_TOKEN_EXPIRE)
        defaults.set("", forKey: UserDefaultsWorker.KEY_REFRESH_TOKEN)
    }

}

