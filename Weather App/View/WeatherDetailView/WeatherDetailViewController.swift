//
//  WeatherDetailViewController.swift
//  Weather App
//
//  Created by macbook on 15/01/22.
//

import UIKit

class WeatherDetailViewController: BaseViewController {

    @IBOutlet weak var tableView: WeatherDetailTableView?
    var dataModel: WeatherModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView() {
        tableView?.dataModel = dataModel
        
    }

}
