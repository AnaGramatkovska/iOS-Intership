//
//  CustomRegistrationAppApp.swift
//  CustomRegistrationApp
//
//  Created by Ana Gramatkovska on 16.1.23.
//

import SwiftUI


@main
struct CustomRegistrationAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            
            SplashScreen()
        }
    }
}

