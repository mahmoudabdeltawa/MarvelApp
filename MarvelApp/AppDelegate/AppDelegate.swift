//
//  AppDelegate.swift
//  MarvelApp
//
//  Created by Mahmoud on 01/05/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        SetupFirstViewController()
        return true
    }

    //MARK: - Setup First ViewController
    private func SetupFirstViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: HomeVC())
        window?.makeKeyAndVisible()
    }

}
