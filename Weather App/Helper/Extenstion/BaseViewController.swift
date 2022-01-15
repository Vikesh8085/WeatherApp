//
//  BaseViewController.swift
//  Weather App
//
//  Created by macbook on 15/01/22.
//

import UIKit


class BaseViewController: UIViewController {
    
    
    final func displayAlert(error: CustomError) {
        DispatchQueue.main.async {
            self.showAlert(title: error.errorTitle, message: error.errorDescription, preferredStyle: .alert, alertActions: [(AlertAction.okAction.rawValue, .default)], completion: { index in
            })
        }
    }
    
    final func hideIndicator() {
        DispatchQueue.main.async {
            self.view.hideIndicator()
        }
    }
}
