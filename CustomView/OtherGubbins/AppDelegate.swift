//
//  AppDelegate.swift
//  CustomView
//
//  Created by Rokon Uddin on 12/15/17.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.1137254902, green: 0.6, blue: 0.5137254902, alpha: 1)
        UINavigationBar.appearance().isTranslucent = false
        return true
    }
}

