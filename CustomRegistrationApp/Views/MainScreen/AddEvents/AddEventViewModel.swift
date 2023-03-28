//
//  AddEventViewModel.swift
//  CustomRegistrationApp
//
//  Created by Ana Gramatkovska on 14.2.23.
//

import Foundation

class AddEventViewModel: ObservableObject {
    
    func createEvent(collaboration: String,description: String, isPublic: Bool, location: String, name: String, tags: [String], completionHandler: @escaping (_ success: Bool)-> Void){
        EventAPI.createNewEvent(collaboration: collaboration, description: description, isPublic: isPublic, location: location, name: name, tags: tags) {response, error in
            if let error = error {
                print("neuspesno")
                completionHandler(false)
            }
            if let response = response {
                
                completionHandler(true)
            }
      
        }
    }

    
    
}


