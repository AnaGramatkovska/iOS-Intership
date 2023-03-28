//
//  SignUpViewModel.swift
//  CustomRegistrationApp
//
//  Created by Ana Gramatkovska on 27.1.23.
//

import Foundation
import SwiftUI
import Firebase
import Alamofire


class SignUpViewModel: ObservableObject{
 
    
    func signup(firstName: String, lastName: String, email: String, password: String, completionHandler:@escaping (_ response: TokenInfo?) -> Void){
        AuthenticationAPI.register(firstName: firstName, lastName: lastName, email: email, password: password) { response, error in
            if let error = error {
                print("greska")
                return
            }
     
            // ako se dobie token, treba da se zacuva vo userdefaults, vo saveAUTH
            if let response = response {
                UserDefaultsWorker.saveAuthToken(tokens: response)
                
            }
            
        }
        
    }
    
}

