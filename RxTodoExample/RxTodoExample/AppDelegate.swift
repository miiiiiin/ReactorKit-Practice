//
//  AppDelegate.swift
//  RxTodoExample
//
//  Created by Running Raccoon on 2021/11/16.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
        window.makeKeyAndVisible()

        let viewModel = TaskListViewModel()
        let viewController = TaskListViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController

        self.window = window
        
        return true
    }
}

