//
//  EventAPI.swift
//  CustomRegistrationApp
//
//  Created by Ana Gramatkovska on 13.2.23.
//

import Foundation
import Alamofire
import UIKit

class EventAPI{
    
    //createNewEvent
    static func createNewEvent(collaboration: String,description: String, isPublic: Bool, location: String, name: String, tags: [String], completionHandler: @escaping (_ response: Event?, _ error: Error?) -> Void){
        let url = Constants.Host.hostUrl + Constants.Service.event + Constants.Endpoints.createNewEvent
        let header = HTTPHeader(name: "Authorization", value: "Bearer \(UserDefaultsWorker.getAccessToken().token)")
        
        let params = [
            Constants.Parameters.collaboration: collaboration,
            Constants.Parameters.description: description,
            Constants.Parameters.isPublic: isPublic,
            Constants.Parameters.location: location,
            Constants.Parameters.name: name,
            Constants.Parameters.tags: tags
        ] as [String : Any]
        
        
        //        AuthenticationAPI.requestDecodable(url: url, method: .post, parameters: params ,headers: [header]) { response, error, statusCode in
        //            completionHandler(response, error)
        //        }
        AF.request(url, method: .post, parameters: params,  encoding: JSONEncoding.default as! ParameterEncoding, headers:[header]).responseJSON { odgovor
            in
            print(odgovor)
        }
    }
    
    //listEventsByValue
    static func listAllEvents(value:String, completionHandler: @escaping (_ response: [Event]?, _ error: Error?) -> Void){
        let url = Constants.Host.hostUrl + Constants.Service.event + Constants.Endpoints.findEventsByParameter
        var header = HTTPHeader(name: "", value: "")
        if let token = UserDefaultsWorker.getAccessToken().token{
            header = HTTPHeader(name: "Authorization", value: "Bearer \(token)")
        }
        
        
        let params = [
            Constants.Parameters.value: value]
        
        AuthenticationAPI.requestDecodable(url: url, method: .get, parameters: params,encoding: URLEncoding.default, headers: [header]) { response, error, statusCode in
            completionHandler(response, error)
        }
//                AF.request(url, method: .get, parameters: params,  encoding: JSONEncoding.default as! ParameterEncoding, headers:[header]).responseJSON { odgovor
//                            in
//                            print(odgovor)
//                        }
        
    }
    
    //searchByNameLocationDescription
    static func searchEvents(text:String, completionHandler: @escaping (_ response: [Event]?, _ error: Error?) -> Void){
        let url = Constants.Host.hostUrl + Constants.Service.event + Constants.Endpoints.search + Constants.Endpoints.searchEvent
        let header = HTTPHeader(name: "Authorization", value: "Bearer \(UserDefaultsWorker.getAccessToken().token)")
        
        let params = [
            Constants.Parameters.text: text]
        
        AuthenticationAPI.requestDecodable(url: url, method: .get, parameters: params, headers: [header]) { response, error, statusCode in
            completionHandler(response, error)
        }
    }
    
    //changeEventDetails
    static func changeEventDetails(collaboration: String,description: String,eventId:String, isPublic: Bool, location: String, name: String, tags: [String], completionHandler: @escaping (_ response: Message?, _ error: Error?) -> Void){
        let url = Constants.Host.hostUrl + Constants.Service.event + Constants.Endpoints.changeEvent
        let header = HTTPHeader(name: "Authorization", value: "Bearer \(UserDefaultsWorker.getAccessToken().token)")
        
        let params = [
            Constants.Parameters.collaboration: collaboration,
            Constants.Parameters.description: description,
            Constants.Parameters.eventId: eventId,
            Constants.Parameters.isPublic: isPublic,
            Constants.Parameters.location: location,
            Constants.Parameters.name: name,
            Constants.Parameters.tags: tags
        ]as [String : Any]
        
        AuthenticationAPI.requestDecodable(url: url, method: .post, parameters: params, headers: [header]) { response, error, statusCode in
            completionHandler(response, error)
        }
    }
    //getEventId
    static func getEventId(id:String, completionHandler: @escaping (_ response: Event?, _ error: Error?) -> Void){
        let url = Constants.Host.hostUrl + Constants.Service.event + Constants.Endpoints.findById + id
        let header = HTTPHeader(name: "Authorization", value: "Bearer \(UserDefaultsWorker.getAccessToken().token)")
        
//        let params = [
//            Constants.Parameters.id: id]
        
        AuthenticationAPI.requestDecodable(url: url, method: .get, encoding: URLEncoding.default) { response, error, statusCode in
            completionHandler(response, error)
        }
//        AF.request(url, method: .get, encoding: URLEncoding.default as! ParameterEncoding).responseJSON { odgovor
//                                 in
//                                 print(odgovor)
//                             }
    }
    
    //uploadMultipleFiles
    static func uploadMultipleFiles(eventId: String, file: Data, completionHandler: @escaping(_ response: Message?, _ error: Error?)-> Void){
        let url = Constants.Host.hostUrl + Constants.Service.event + Constants.Endpoints.uploadMultipleFiles
        let header = HTTPHeader(name: "Authorization", value: "Bearer \(UserDefaultsWorker.getAccessToken().token)")
        let params = [
            Constants.Parameters.eventId: eventId,
            Constants.Parameters.file: file
        ]as [String : Any]
        
        AF.upload(multipartFormData: { multiPart in
            for (key, value) in params {
                if let temp = value as? String {
                    multiPart.append(temp.data(using: .utf8)!, withName: key)
                }
                if let temp = value as? Int {
                    multiPart.append("\(temp)".data(using: .utf8)!, withName: key)
                }
                if let temp = value as? NSArray {
                    temp.forEach({ element in
                        let keyObj = key + "[]"
                        if let string = element as? String {
                            multiPart.append(string.data(using: .utf8)!, withName: keyObj)
                        } else
                        if let num = element as? Int {
                            let value = "\(num)"
                            multiPart.append(value.data(using: .utf8)!, withName: keyObj)
                        }
                    })
                }
            }
            multiPart.append(file, withName: "file", fileName: "file.png", mimeType: "image/png")
        }, with: url as! URLRequestConvertible)
        .uploadProgress(queue: .main, closure: { progress in
            //Current upload progress of file
            print("Upload Progress: \(progress.fractionCompleted)")
        })
        .responseJSON(completionHandler: { data in
            //Do what ever you want to do with response
        })
    }
    
    //insertEventIntoFAVOURITES
    static func insertIntoFavourites(eventId:String, completionHandler: @escaping (_ response: [Event]?, _ error: Error?) -> Void){
        
        let url = Constants.Host.hostUrl + Constants.Service.event + Constants.Endpoints.insertEventIntoFavourites
        var header = HTTPHeader(name: "", value: "")
        if let token = UserDefaultsWorker.getAccessToken().token{
            header = HTTPHeader(name: "Authorization", value: "Bearer \(token)")
        }
        
        
        let params = [
            Constants.Parameters.eventId: eventId]
        
        AuthenticationAPI.requestDecodable(url: url, method: .post, parameters: params,encoding: URLEncoding.default, headers: [header]) { response, error, statusCode in
            completionHandler(response, error)
        }
        //        AF.request(url, method: .get, parameters: params,  encoding: JSONEncoding.default as! ParameterEncoding, headers:[header]).responseJSON { odgovor
        //                    in
        //                    print(odgovor)
        //                }
        
    }
    
    //listAAllPhotosThatUserCreated
    static func listAllPhotos(eventId:String, userId: String, completionHandler: @escaping (_ response: [Picture]?, _ error: Error?) -> Void){
        
        let url = Constants.Host.hostUrl + Constants.Service.event + Constants.Endpoints.listAllPhotosThatUserCreated
        let header = HTTPHeader(name: "Authorization", value: "Bearer \(UserDefaultsWorker.getAccessToken().token)")
        
        let params = [
            Constants.Parameters.eventId: eventId,
            Constants.Parameters.userId: userId
        ]
        
        AuthenticationAPI.requestDecodable(url: url, method: .get, parameters: params, headers: [header]) { response, error, statusCode in
            completionHandler(response, error)
            //        AF.request(url, method: .get, parameters: params,  encoding: JSONEncoding.default as! ParameterEncoding, headers:[header]).responseJSON { odgovor
            //                    in
            //                    print(odgovor)
            //                }
            
        }
        
        
    }
    
    
    
}
