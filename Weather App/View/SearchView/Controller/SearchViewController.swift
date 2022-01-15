//
//  SearchViewController.swift
//  Weather App
//
//  Created by macbook on 14/01/22.
//

import UIKit

class SearchViewController: BaseViewController {

    var viewModel: SearchViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Call API
    private func callWebSerVice() {
        
        if ReachabilityWrapper.shared.isNetworkAvailable() {
            
            view.showIndicator()
            viewModel?.callAPIWithQuery(query: "mumbai", success: { [weak self] data in
                self?.hideIndicator()
                DispatchQueue.main.async {
                    self?.callWeatherListScreen()
                }
            }, failure: { [weak self] error in
                self?.hideIndicator()
                self?.displayAlert(error: error)
            })
        } else {
            
            self.showAlert(title: InternetAvailability.title.rawValue, message: InternetAvailability.message.rawValue, preferredStyle: .alert, alertActions: [(AlertAction.retryAction.rawValue, .default)]) { (index) in
                if index == 0 {
                    self.callWebSerVice()
                }
            }
            
        }
    }
 
    @IBAction func callDetailController(_ sender: UIButton) {
        callWebSerVice()

    }
    
    // MARK: Routing

    private func callWeatherListScreen() {
     
        let detailVC = WeatherListViewController(nibName: "WeatherListViewController", bundle: nil)
        detailVC.weatherForcast = viewModel?.weatherForcast
        self.navigationController?.pushViewController(detailVC, animated: true)

    }
}
