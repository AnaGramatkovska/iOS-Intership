//
//  SceneDelegate.swift
//  CustomRegistrationApp
//
//  Created by Ana Gramatkovska on 23.1.23.
//

import Foundation
import UIKit
//import FacebookCore

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window : UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//      guard let windowScene = scene as? UIWindowScene else { return }
//      let window = UIWindow(windowScene: windowScene)
//      // Provide your apps root view controller
//      window.rootViewController = rootViewController()
//      self.window = window
//      window.makeKeyAndVisible()
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else {
            return
        }

//        ApplicationDelegate.shared.application(
//            UIApplication.shared,
//            open: url,
//            sourceApplication: nil,
//            annotation: [UIApplication.OpenURLOptionsKey.annotation]
//        )
    }
}
