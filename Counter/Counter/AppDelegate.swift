//
//  AppDelegate.swift
//  Counter
//
//  Created by Running Raccoon on 2020/12/29.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let viewController = self.window?.rootViewController as? CounterViewController
        viewController?.reactor = CounterViewReactor()
        return true
    }
}

