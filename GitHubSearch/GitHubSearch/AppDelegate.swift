//
//  AppDelegate.swift
//  GitHubSearch
//
//  Created by Running Raccoon on 2020/12/29.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let navigationController = self.window?.rootViewController as? UINavigationController
        navigationController?.navigationBar.prefersLargeTitles = true
        let viewController = navigationController?.viewControllers.first as? GitHubSearchViewController
        viewController?.reactor = GitHubSearchViewReactor()
        
        return true
    }
}
