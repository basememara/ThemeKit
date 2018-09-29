//
//  Theme.swift
//  ThemeKit
//
//  Created by Basem Emara on 2018-09-27.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

import UIKit

protocol Theme {
    var tint: UIColor { get }
    var secondaryTint: UIColor { get }
    
    var backgroundColor: UIColor { get }
    var separatorColor: UIColor { get }
    var selectionColor: UIColor { get }
    
    var labelColor: UIColor { get }
    var secondaryLabelColor: UIColor { get }
    var subtleLabelColor: UIColor { get }
    
    var barStyle: UIBarStyle { get }
    
    func apply(for application: UIApplication)
    func extend()
}

extension Theme {
    
    func apply(for application: UIApplication) {
        application.keyWindow?.tintColor = tint
        
        UITabBar.appearance().with {
            $0.barStyle = barStyle
            $0.tintColor = tint
        }
        
        UINavigationBar.appearance().with {
            $0.barStyle = barStyle
            $0.tintColor = tint
            $0.titleTextAttributes = [
                .foregroundColor: labelColor
            ]
            
            if #available(iOS 11.0, *) {
                $0.largeTitleTextAttributes = [
                    .foregroundColor: labelColor
                ]
            }
        }
        
        UICollectionView.appearance().backgroundColor = backgroundColor
        
        UITableView.appearance().with {
            $0.backgroundColor = backgroundColor
            $0.separatorColor = separatorColor
        }
        
        UITableViewCell.appearance().with {
            $0.backgroundColor = .clear
            $0.selectionColor = selectionColor
        }
        
        UIView.appearance(whenContainedInInstancesOf: [UITableViewHeaderFooterView.self])
            .backgroundColor = selectionColor
        
        UILabel.appearance(whenContainedInInstancesOf: [UITableViewHeaderFooterView.self])
            .textColor = secondaryLabelColor
        
        AppLabel.appearance().textColor = labelColor
        AppHeadline.appearance().textColor = secondaryTint
        AppSubhead.appearance().textColor = secondaryLabelColor
        AppFootnote.appearance().textColor = subtleLabelColor
        
        AppButton.appearance().with {
            $0.setTitleColor(tint, for: .normal)
            $0.borderColor = tint
            $0.borderWidth = 1
            $0.cornerRadius = 3
        }
        
        AppDangerButton.appearance().with {
            $0.setTitleColor(backgroundColor, for: .normal)
            $0.backgroundColor = tint
            $0.cornerRadius = 3
        }
        
        AppSwitch.appearance().with {
            $0.tintColor = tint
            $0.onTintColor = tint
        }
        
        AppStepper.appearance().tintColor = tint
        
        AppSlider.appearance().tintColor = tint
        
        AppSegmentedControl.appearance().tintColor = tint
        
        AppView.appearance().backgroundColor = backgroundColor
        
        AppSeparator.appearance().with {
            $0.backgroundColor = separatorColor
            $0.alpha = 0.5
        }
        
        AppView.appearance(whenContainedInInstancesOf: [AppView.self]).with {
            $0.backgroundColor = selectionColor
            $0.cornerRadius = 10
        }
        
        // Style differently when inside a special container
        
        AppLabel.appearance(whenContainedInInstancesOf: [AppView.self, AppView.self]).textColor = subtleLabelColor
        AppHeadline.appearance(whenContainedInInstancesOf: [AppView.self, AppView.self]).textColor = secondaryLabelColor
        AppSubhead.appearance(whenContainedInInstancesOf: [AppView.self, AppView.self]).textColor = secondaryTint
        AppFootnote.appearance(whenContainedInInstancesOf: [AppView.self, AppView.self]).textColor = labelColor
        
        AppButton.appearance(whenContainedInInstancesOf: [AppView.self, AppView.self]).with {
            $0.setTitleColor(labelColor, for: .normal)
            $0.borderColor = labelColor
        }
        
        AppDangerButton.appearance(whenContainedInInstancesOf: [AppView.self, AppView.self]).with {
            $0.setTitleColor(subtleLabelColor, for: .normal)
            $0.backgroundColor = labelColor
        }
        
        AppSwitch.appearance(whenContainedInInstancesOf: [AppView.self, AppView.self]).with {
            $0.tintColor = secondaryTint
            $0.onTintColor = secondaryTint
        }
        
        extend()
        
        // Ensure existing views render with new theme
        // https://developer.apple.com/documentation/uikit/uiappearance
        application.windows.reload()
    }
    
    func extend() {
        // Optionally extend theme
    }
}
