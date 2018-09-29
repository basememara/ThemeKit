//
//  MainViewController.swift
//  ThemeKit
//
//  Created by Basem Emara on 2018-09-28.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBAction func themeSegmentedControlChanged(_ sender: UISegmentedControl) {
        let theme: Theme
        
        switch sender.selectedSegmentIndex {
        case 1: theme = LightTheme()
        case 2: theme = OceanTheme()
        default: theme = DarkTheme()
        }
        
        theme.apply(for: UIApplication.shared)
    }
}
