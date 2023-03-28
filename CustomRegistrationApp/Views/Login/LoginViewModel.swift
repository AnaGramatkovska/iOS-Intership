//
//  LoginViewModel.swift
//  CustomRegistrationApp
//
//  Created by Ana Gramatkovska on 23.1.23.
//

import Foundation
import Firebase
import GoogleSignIn
import SwiftUI
import Alamofire


class LoginViewModel: ObservableObject {

    func signInWithGoogle(completionHandler: @escaping(_ success: Bool) -> ()) {
        guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
        // Create Google Sign In configuration object.
        // Start the sign in flow!
        
        GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { googleUser, error in
            if let error = error {
                print("greska")
               completionHandler(false)
            }
            guard let token = googleUser?.user.idToken?.tokenString else {
                return
            }
            AuthenticationAPI.loginWithGoogle(token: token) { response, error in
                if let error = error{
                    completionHandler(false)
                }
                if let response = response {
                    UserDefaultsWorker.saveAuthToken(tokens: response)
                    completionHandler(true)
                }
            }
        }
        
    }

       
            func signin(email: String, password: String, completionHandler:@escaping (_ success: Bool) -> Void){
                AuthenticationAPI.login(email: email, password: password) { response, error in
                    if let error = error {
                        // ...
                        print("greska")
                        completionHandler(false)
                    }
                    if let response = response {
                        
                        UserDefaultsWorker.saveAuthToken(tokens: response)
                        UserAPI.getUser { userResponse, error in
                            if let error = error {
                                print("greska")
                                completionHandler(false)
                            }
                            if let user = userResponse{
                                print("odgovor")
                                DataSingleton.shared.user = user
                                completionHandler(true)
                            }
                            
                        }
                            
                    }
                }
                
            }
        }
 
