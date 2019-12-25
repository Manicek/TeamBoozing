//
//  AppDelegate.swift
//  teamboozing
//
//  Created by Patrik Hora on 17/08/2018.
//  Copyright © 2018 MasterApp. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        Game.navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        Game.navigationController.navigationBar.shadowImage = UIImage()
        Game.navigationController.navigationBar.isTranslucent = true
        window?.rootViewController = Game.navigationController
        window?.makeKeyAndVisible()

        return true
    }

}
