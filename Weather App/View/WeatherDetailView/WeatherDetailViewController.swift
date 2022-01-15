//
//  WeatherDetailViewController.swift
//  Weather App
//
//  Created by macbook on 15/01/22.
//

import UIKit

class WeatherDetailViewController: BaseViewController {

    @IBOutlet weak var tableView: WeatherDetailTableView?
    var weather: WeatherModel?
    var city: City?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView() {
        tableView?.weather = weather
        tableView?.city = city
        tableView?.reloadData()
    }

}
