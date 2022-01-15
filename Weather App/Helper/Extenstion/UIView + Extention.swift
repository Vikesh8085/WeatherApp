//
//  UIView + Extention.swift
//  Weather App
//
//  Created by macbook on 15/01/22.
//

import UIKit
extension UIView {
    func showIndicator() {
        self.hideIndicator()
        let activityView = UIActivityIndicatorView(frame: self.frame ) as UIActivityIndicatorView
        activityView.center = self.center
        activityView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(0.25)
        activityView.color = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        activityView.hidesWhenStopped = true
        if #available(iOS 13.0, *) {
            activityView.style = .large
        } else {
            activityView.style = .gray
        }
        self.addSubview(activityView)
        activityView.startAnimating()
        activityView.translatesAutoresizingMaskIntoConstraints = false
        activityView.tag = 1999
        let width = NSLayoutConstraint(item: activityView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1, constant: 0)
        let height = NSLayoutConstraint(item: activityView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: 0)
        let top = NSLayoutConstraint(item: activityView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
        let leading = NSLayoutConstraint(item: activityView, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0)
        self.addConstraint(width)
        self.addConstraint(height)
        self.addConstraint(top)
        self.addConstraint(leading)
    }
    func hideIndicator() {
        if let loader = self.viewWithTag(1999) as? UIActivityIndicatorView {
            loader.stopAnimating()
            loader.removeFromSuperview()
        }
    }
}
