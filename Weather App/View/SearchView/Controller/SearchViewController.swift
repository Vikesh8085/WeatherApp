//
//  SearchViewController.swift
//  Weather App
//
//  Created by macbook on 14/01/22.
//

import UIKit

class SearchViewController: BaseViewController {
    @IBOutlet weak var searchButton: UIButton! {
        didSet {
            searchButton.isEnabled = false
            searchButton.setTitleColor(.white, for: .normal)
        }
    }
    @IBOutlet weak var searchTextField: UITextField! {
        didSet {
            searchTextField.delegate = self
            searchTextField.autocorrectionType = .no
        }
    }
    var viewModel: SearchViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Call API
    private func callWebSerVice(searchQuery: String) {
        if ReachabilityWrapper.shared.isNetworkAvailable() {
            view.showIndicator()
            viewModel?.callAPIWithQuery(query: searchQuery, success: { [weak self] data in
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
                    self.callWebSerVice(searchQuery: searchQuery)
                }
            }
        }
    }
    
    @IBAction func callDetailController(_ sender: UIButton) {
        if Validator().validateSearchField(text: searchTextField.text ?? "") {
            callWebSerVice(searchQuery: searchTextField.text ?? "")
        }
    }
    
    // MARK: Routing
    
    private func callWeatherListScreen() {
        let detailVC = WeatherListViewController(nibName: "WeatherListViewController", bundle: nil)
        detailVC.weatherForcast = viewModel?.weatherForcast
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
}

extension SearchViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let previousText:NSString = textField.text! as NSString
        let updatedText = previousText.replacingCharacters(in: range, with: string)
        if !updatedText.canBeConverted(to: .ascii) {
            return false
        }
        if Validator().validateSearchField(text: updatedText) {
            searchButton.isEnabled = true
        } else {
            searchButton.isEnabled = false
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        view.endEditing(true)
    }
}
