//
//  UITableViewHeaderFooterView+Extension.swift
//  Weather App
//
//  Created by macbook on 15/01/22.
//

import UIKit

extension UITableViewHeaderFooterView {
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }

    static var identifier: String {
        return String(describing: self)
    }
}
