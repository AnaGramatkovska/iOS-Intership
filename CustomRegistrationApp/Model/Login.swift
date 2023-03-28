//
//  login.swift
//  CustomRegistrationApp
//
//  Created by Ana Gramatkovska on 3.2.23.
//

import Foundation

//ova go vrakja response
struct Login: Codable {
    var expiresIn: Int64?
    var refreshToken: String?
    var token: String?
}
