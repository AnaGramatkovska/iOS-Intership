//
//  Constants.swift
//  CustomRegistrationApp
//
//  Created by Ana Gramatkovska on 27.1.23.
//

import Foundation

public struct Constants{
    
    struct Host{
        static let hostUrl = "http://88.85.111.72:37990"
    }
    
    struct Parameters{
        
        static let firstName: String = "firstName"
        static let lastName: String = "lastName"
        static let email: String = "email"
        static let password: String = "password"
//        static let file = "ImagePicker"
        static let id = "id"
        
        static let pictureUrl = "pictureUrl"
        static let url = "url"
        static let image = "image"
        
        static let newPassword = "newPassword"
        static let oldPassword = "oldPassword"
        static let userId = "userId"
        
        static let collaboration = "collabortaion"
        static let description = "description"
        static let isPublic = "isPublic"
        static let location = "location"
        static let name = "name"
        static let tags = "tags"
        
        static let value = "value"
        static let text = "text"
        
        static let eventId = "eventId"
        static let file = "file"
    }
    
    struct Service: Codable{
        //auth
        static let oauth = "/api/v1/auth"
        //event
        
        static let event = "/api/v2/event"
        
        //user
        static let user = "/api/v1/user"
    }
    
    struct Endpoints: Codable{
        //auth
        static let register = "/register"
        static let login = "/login"
        static let login_google = "/googleLogin"
        static let setPicture = "/setPicture"
        //user-rest-controller
        static let getLoggedUser = "/getLoggedUser"
        static let listFavouriteEvents = "list-favourite-events"
        static let listFavouritePhotosAndVideos = "/list-favourite-photos-and-videos"
        static let updatePassword = "/updatePassword"
        static let updateProfilPicture = "updateProfilePicture"
        static let updateUserInfo = "/updateUserInfo"
        
        //event-rest-controller
        static let createNewEvent = "/createNewEvent"
        static let findById = "/id/"
        static let findEventsByParameter = "/findEventsByParameter"
        static let search = "/search"
        static let searchEvent = "/name-location-description"
        static let changeEvent = "/change-event-details"
        static let uploadMultipleFiles = "/upload-multiple-files"
        static let insertEventIntoFavourites = "/insert-event-into-favourites"
        static let listAllPhotosThatUserCreated = "/user/filter-photos-by-publisher"
    }
}
