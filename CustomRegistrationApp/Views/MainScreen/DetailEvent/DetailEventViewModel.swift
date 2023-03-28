////
////  DetailEventViewModel.swift
////  CustomRegistrationApp
////
////  Created by Ana Gramatkovska on 23.2.23.
////
//
import Foundation
import UIKit

class DetailEventViewModel: ObservableObject {
    
    @Published var event : Event?
//    @Published var id: String
//
//    init(id: String) {
//        self.id = id
//        getEventById(id: id)
//    }
//    init(id:String){
//       getEventById(id: id)
//    }
//    
    //getEventById
    func getEventById(id: String){
        EventAPI.getEventId(id: id) { response, error in
            if let error = error {
                print("Greska")
                
            }
            if let response = response {
                self.event = response
                print("Ne e pojavena nikakva greska")
                
            }
        }
    }
    //insertEventIntoFavourites
//    func insertEventIntoFavourites(eventId: String){
//        EventAPI.insertIntoFavourites(eventId: eventId ) { response, error in
//            if let error = error {
//                print("Neuspeshno prikazuvanje")
//                //                completionHandler(false)
//            }
//            if let response = response {
//                print("Uspesno")
//                //                completionHandler(true)
//            }
//        }
//
//    }
//
//
//    //changeEventDetails
//    func changeEventDetails(collaboration: String, description:String,eventId:String, isPublic: Bool,location:String,name:String, tags:[String], completionHandler: @escaping (_ success: Bool)-> Void){
//        EventAPI.changeEventDetails(collaboration: collaboration, description: description, eventId: eventId, isPublic: isPublic, location: location, name: name, tags: tags) { response, error in
//            if let error = error {
//                print("Promenata ne beshe uspesna")
//                completionHandler(false)
//            }
//            if let response = response {
//                print("Uspesna promena")
//                completionHandler(true)
//            }
//        }
//    }
//    func listUserPhotos(eventId: String, userId: String,completionHandler: @escaping (_ success: Bool)-> Void){
//        EventAPI.listAllPhotos(eventId: eventId, userId: userId) { response, error in
//            if let error = error {
//                print("Neuspeshno listanje sliki")
//                completionHandler(false)
//
//            }
//            if let response = response {
//                print("Uspesno listanje na sliki")
//                completionHandler(true)
//
//            }
//        }
//    }
    //uploadPhotos
    //    func uploadImage(eventId: String, file: Data, completionHandler: @escaping(_ success: Bool)-> Void){
    //        EventAPI.uploadMultipleFiles(eventId: eventId, file: file) { response, error in
    //            if let error = error {
    //                print("Promenata ne beshe uspesna")
    //
    //            }
    //            if let response = response {
    //                print("Uspesna promena")
    //            }
    //        }
    //    }
}
