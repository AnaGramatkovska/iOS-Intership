//
//  SplashSreenViewModel.swift
//  CustomRegistrationApp
//
//  Created by Ana Gramatkovska on 2.2.23.
//

import Foundation
import SwiftUI

class SplashScreenModel: ObservableObject{
    @State var isLinkActive = false
   


    init () {
        //check if user is logged in here and update isloggedin accordingly
        self.isLinkActive = UserDefaults.standard.bool(forKey: "isLinkActive")
    }
    
    //provervanje dali ima token ili ne. ako ima token se nosi na navbar ako nema se nosi na login screen

//    if let token = UserDefaultsWorker.haveAuthToken  {
//        NavAndToolBar()
//    } else {
//       LogInView()
//    }

}
