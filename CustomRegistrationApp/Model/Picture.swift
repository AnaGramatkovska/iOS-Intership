//
//  Picture.swift
//  CustomRegistrationApp
//
//  Created by Ana Gramatkovska on 27.2.23.
//

import Foundation

struct Picture: Identifiable,Codable{
    var createdBy: User?
    var dateCreated: Int64?
    var fileName: String?
    var id: String?
    var urlLink: String?
    
}
