//
//  NavAndToolBarViewModel.swift
//  CustomRegistrationApp
//
//  Created by Ana Gramatkovska on 16.2.23.
//

import Foundation
import Firebase
import SwiftUI

class AllEventsViewModel: ObservableObject{
    @Published var eventsList = [Event]()
    @Published private var text = ""
    
  
    init(){
        getAllEvent()
    }
    
    //findEventByParameter
    func getAllEvent() {
        EventAPI.listAllEvents(value: "public"){ response, error in
            if let error = error {
                print("Neuspeshno prikazuvanje")
                //                completionHandler(false)
            }
            if let response = response {
                self.eventsList = response
                print("Uspesno")
                
                //                completionHandler(true)
            }
            
        }
        
    }
    
    //searchEvents- NE RABOTI!
//    func searchEvents( text: String){
//
//            if  !self.text.isEmpty {
//                EventAPI.searchEvents(text: text) { response, error in
//                    if let error = error {
//                        print("Neuspeshno prikazuvanje")
//                        //                completionHandler(false)
//                    }
//                    if let response = response {
//                        self.eventsList = response
//                        print("Uspesno")
//                }
//            }
////                self.eventsList = response
////            print("nesto")
//
//        }
//    } //zavrsva search
//
    
}
