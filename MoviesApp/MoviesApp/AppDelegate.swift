//
//  AppDelegate.swift
//  MoviesApp
//
//  Created by Никита Савенко on 20.12.2023.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController(rootViewController: MainMoviesViewController())
        
//        navigationController.navigationBar.prefersLargeTitles = true
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        self.window = window
        
        UINavigationBar.appearance().tintColor = .black
        return true
    }
    


}

