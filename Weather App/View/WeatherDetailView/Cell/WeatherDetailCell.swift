//
//  WeatherDetailCell.swift
//  Weather App
//
//  Created by macbook on 15/01/22.
//

import UIKit

class WeatherDetailCell: UITableViewCell {
    @IBOutlet weak var tempLabel: UILabel?
    @IBOutlet weak var weatherDescLabel: UILabel?
    @IBOutlet weak var weatherMoreDetailsLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupData(data: WeatherModel?) {
        tempLabel?.text = data?.main?.temp.getTempreture()
        weatherDescLabel?.text = "Feels like \(data?.main?.feelsLike ?? 0)"
        weatherMoreDetailsLabel?.text = data?.weather?.first?.weatherDescription
    }
}
