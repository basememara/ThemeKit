//
//  AppDelegate.swift
//  ThemeKit
//
//  Created by Basem Emara on 2018-09-27.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    private let theme = DarkTheme()
    
    var window: UIWindow?

    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        theme.apply(for: application)
        return true
    }
}

