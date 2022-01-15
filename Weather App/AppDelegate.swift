//
//  AppDelegate.swift
//  Weather App
//
//  Created by macbook on 14/01/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setRootViewController()
        return true
    }

    private func setRootViewController() {
        
        let networkManager: NetworkManager = NetworkManager()
        let rootVC = SearchViewController(nibName: "SearchViewController", bundle: nil)
        rootVC.viewModel = SearchViewModel(networkManager: networkManager)
        let navController = UINavigationController(rootViewController: rootVC)
        
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navController
        self.window?.makeKey()
    }
   

}

