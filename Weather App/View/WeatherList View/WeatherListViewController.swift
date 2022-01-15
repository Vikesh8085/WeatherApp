//
//  WeatherListViewController.swift
//  Weather App
//
//  Created by macbook on 15/01/22.
//

import UIKit

class WeatherListViewController: BaseViewController {
    
    @IBOutlet weak var tableView: WeatherTableView?
    var weatherForcast: ForeCastModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView() {
        tableView?.weatherForcast = weatherForcast
        tableView?.weatherTapped = { [weak self] data in
            DispatchQueue.main.async {
                self?.callWeatherListScreen(data: data)
            }
        }
    }
    
    private func callWeatherListScreen(data: WeatherModel?) {
        
        let detailVC = WeatherDetailViewController(nibName: "WeatherDetailViewController", bundle: nil)
        detailVC.dataModel = data
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    
}
