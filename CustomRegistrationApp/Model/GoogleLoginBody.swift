//
//  googleLoginBody.swift
//  CustomRegistrationApp
//
//  Created by Ana Gramatkovska on 3.2.23.
//

import Foundation

struct GoogleLoginBody: Codable{
    var expiresIn: Int64?
    var refreshToken: String?
    var token: String?
}
