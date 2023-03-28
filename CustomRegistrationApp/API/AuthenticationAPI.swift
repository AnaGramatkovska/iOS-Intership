//
//  AuthenticationSignUpAPI.swift
//  CustomRegistrationApp
//
//  Created by Ana Gramatkovska on 27.1.23.
//

import Foundation
import Alamofire

class AuthenticationAPI{
    //SignUp auth
    static func register(firstName: String, lastName: String, email: String, password: String, completionHandler: @escaping (_ response: TokenInfo?, _ error: Error?) -> Void){
        let url = Constants.Host.hostUrl + Constants.Service.oauth + Constants.Endpoints.register
        let params = [
            Constants.Parameters.email: email.lowercased(),
            Constants.Parameters.firstName: firstName,
            Constants.Parameters.lastName: lastName,
            Constants.Parameters.password: password]
        requestDecodable(url: url, method: .post, parameters: params) { response, error, statusCode in
            completionHandler(response, error)
        }
        //        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { odgovor
        //            in
        //            print(odgovor)
        //        }
    }
    //SignIn auth
    static func  login (email: String, password: String, completionHandler: @escaping(_ response: TokenInfo?, _ error: Error?) -> Void){
        let url = Constants.Host.hostUrl + Constants.Service.oauth + Constants.Endpoints.login
        let params = [
            Constants.Parameters.email: email.lowercased(),
            Constants.Parameters.password: password]
        
        requestDecodable(url: url, method: .post, parameters: params) { response, error, statusCode in
            completionHandler(response, error)
        }
//           AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { odgovor
//                    in
//                    print(odgovor)
//                }
        
        
    }
    
    //LogInWihGoogle
    static func  loginWithGoogle (token: String ,completionHandler: @escaping(_ response: TokenInfo?, _ error: Error?) -> Void){
        let url = Constants.Host.hostUrl + Constants.Service.oauth + Constants.Endpoints.login_google
        let params = [token: token]
        requestDecodable(url: url, method: .post, parameters: params) { response, error, statusCode in
            completionHandler(response, error)
        }
     
    }
    
    //generateNewToken
    static func generateNewToken (refreshToken: String, completionHandler: @escaping(_ response: TokenInfo?, _ error: Error?) -> Void){
        let url = Constants.Host.hostUrl + Constants.Service.oauth + Constants.Endpoints.login_google
        let params = [
            refreshToken: refreshToken]
        requestDecodable(url: url, method: .post, parameters: params) { response, error, statusCode in
            completionHandler(response, error)
        }
        
    }
    
    
    
    //requestDecodable
    static func requestDecodable<Element: Codable>(url: URLConvertible, method: HTTPMethod = .get, parameters: [String: Any]? = nil, encoding: Any = JSONEncoding.default, headers: HTTPHeaders? = nil, completionHandler: @escaping (_ response: Element?, _ error: Error?, _ statusCode: Int?) -> Void) {
        
        AF.request(url, method: method, parameters: parameters, encoding: encoding as! ParameterEncoding, headers: headers).responseDecodable { (response: DataResponse<Element?, AFError>) in
            
            switch response.result{
            case .success(let data):
                completionHandler(data, nil, response.response?.statusCode)
            case .failure(let error):
                completionHandler(nil, error, response.response?.statusCode)
            }
        }
    }
    
}
