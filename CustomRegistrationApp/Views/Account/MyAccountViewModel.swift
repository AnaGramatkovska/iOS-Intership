//
//  MyAccountViewModel.swift
//  CustomRegistrationApp
//
//  Created by Ana Gramatkovska on 1.2.23.
//
import Foundation
import SwiftUI
import Firebase


class MyAccountViewModel: ObservableObject {
//   
//    init(){
//        getUser()
//    }
//    
//    func getUser(){
//        UserAPI.getUser { response, error in
//            if let error = error {
//                print("Greska vo user")
//                return
//            }
//            if let response = response {
//                print("Uspesen user ")
//                return
//            }
//        }
//    }
    func updatePw(oldPassword: String, newPassword: String, reNewPassword:String, completionHandler:@escaping (_ success: Bool) -> Void){
        
        if reNewPassword == newPassword{
            print("password is correct")
            completionHandler(true)
            
            
            UserAPI.changePassword(oldPassword: oldPassword, newPassword: newPassword){ response, error in
                if let error = error {
                    print("greska")
                    return
                }
                if let response = response {
                    print("Uspesna e promenata ")
                    return
                }
                
            }
        }
    }
    
    func updateUser(firstName: String, lastName: String, completionHandler:@escaping (_ success: Bool) -> Void){
        
        UserAPI.updateUserInfo(firstName: firstName, lastName: lastName ){ response, error in
            if let error = error {
                print("greska")
                return
            }
            if let response = response {
                print("Uspesna promena")
                return
                
            }
        }
    }
    
}



