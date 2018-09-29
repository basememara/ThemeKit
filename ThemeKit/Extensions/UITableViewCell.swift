//
//  UITableViewCell.swift
//  ThemeKit
//
//  Created by Basem Emara on 2018-09-28.
//  Copyright © 2018 Basem Emara. All rights reserved.
//

import UIKit

public extension UITableViewCell {
    
    /// The color of the cell when it is selected.
    @objc dynamic var selectionColor: UIColor? {
        get { return selectedBackgroundView?.backgroundColor }
        set {
            guard selectionStyle != .none else { return }
            selectedBackgroundView = UIView().with {
                $0.backgroundColor = newValue
            }
        }
    }
}
