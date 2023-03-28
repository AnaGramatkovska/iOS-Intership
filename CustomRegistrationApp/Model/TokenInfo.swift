//
//  Token.swift
//  CustomRegistrationApp
//
//  Created by Ana Gramatkovska on 3.2.23.
//

import Foundation

struct TokenInfo: Codable {
    var token: String?
    var expiresIn: Int64?
    var refreshToken: String?
    
}



