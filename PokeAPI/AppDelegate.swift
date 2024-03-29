//
//  AppDelegate.swift
//  PokeAPI
//
//  Created by Guilherme Moraes on 24/02/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        let coordinator = MainCoordinator()
        coordinator.navigationController = navigationController
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        coordinator.start()
        return true
    }
    
    
    
}

