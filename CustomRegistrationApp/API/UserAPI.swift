//
//  API.swift
//  CustomRegistrationApp
//
//  Created by Ana Gramatkovska on 3.2.23.
//

import Foundation
import Alamofire
import UIKit
import MobileCoreServices

class UserAPI {
    
    //getLoggedUser
    static func getUser(/*id: Int,*/ completionHandler: @escaping (_ response: User?, _ error: Error?) -> Void){
        let url = Constants.Host.hostUrl + Constants.Service.user + Constants.Endpoints.getLoggedUser
        //        let params = [ Constants.Parameters.id: id ]
        let header = HTTPHeader(name: "Authorization", value: "Bearer \(UserDefaultsWorker.getAccessToken().token)")
        AuthenticationAPI.requestDecodable(url: url, method: .get/*, parameters: params*/, headers: [header]) { response, error, statusCode in
            completionHandler(response, error)
        }
    }
    //changePassword
    static func changePassword(oldPassword: String, newPassword: String, completionHandler: @escaping (_ response: UpdatePassword?, _ error: Error?) -> Void){
        let url = Constants.Host.hostUrl + Constants.Service.user + Constants.Endpoints.updatePassword
        let header = HTTPHeader(name: "Authorization", value: "Bearer \(UserDefaultsWorker.getAccessToken().token)")

        let params = [
            Constants.Parameters.oldPassword: oldPassword,
            Constants.Parameters.newPassword: newPassword ]
        AuthenticationAPI.requestDecodable(url: url, method: .post, parameters: params, headers: [header]) { response, error, statusCode in
            completionHandler(response, error)
        }
    }
    
    //updateUserInfo
    static func updateUserInfo(firstName: String, lastName: String, completionHandler: @escaping (_ response: UpdateUserInfo?, _ error: Error?) -> Void){
        let url = Constants.Host.hostUrl + Constants.Service.user + Constants.Endpoints.updateUserInfo
        let header = HTTPHeader(name: "Authorization", value: "Bearer \(UserDefaultsWorker.getAccessToken().token)")

        let params = [
            Constants.Parameters.firstName: firstName,
            Constants.Parameters.lastName: lastName]
        AuthenticationAPI.requestDecodable(url: url, method: .post, parameters: params, headers: [header]) { response, error, statusCode in
            completionHandler(response, error)
        }
    }
    //setProfilePicture
    static func uploadPhoto(url: String, image: ImagePicker, completionHandler: @escaping(_ response: UpdateUserInfo?, _ error: Error? ) ->Void ){
        let url = Constants.Host.hostUrl + Constants.Service.user + Constants.Endpoints.setPicture
        let header = HTTPHeader(name: "Authorization", value: "Bearer \(UserDefaultsWorker.getAccessToken().token)")
        let params = [
            Constants.Parameters.url: url,
            Constants.Parameters.image: image
        ] as [String : Any]
        AuthenticationAPI.requestDecodable(url: url, method: .post,parameters: params, headers: [header]) { response, error, statusCode in
            completionHandler(response, error)
        }
    
}
    
    //list-favourite-event
    static func listFavouriteEvents( completionHandler: @escaping (_ response: UpdateUserInfo?, _ error: Error?) -> Void){
        let url = Constants.Host.hostUrl + Constants.Service.user + Constants.Endpoints.listFavouriteEvents
        let header = HTTPHeader(name: "Authorization", value: "Bearer \(UserDefaultsWorker.getAccessToken().token)")
        AuthenticationAPI.requestDecodable(url: url, method: .get, headers: [header]) { response, error, statusCode in
            completionHandler(response, error)
            
        }
    }
    //list-favourite-photos-and-videos
    static func listFavouriteImagesAndVideos( completionHandler: @escaping (_ response: UpdateUserInfo?, _ error: Error?) -> Void){
        let url = Constants.Host.hostUrl + Constants.Service.user + Constants.Endpoints.listFavouriteEvents
        let header = HTTPHeader(name: "Authorization", value: "Bearer \(UserDefaultsWorker.getAccessToken().token)")
        AuthenticationAPI.requestDecodable(url: url, method: .get, headers: [header]) { response, error, statusCode in
            completionHandler(response, error)
            
        }
    }
    
    
}
