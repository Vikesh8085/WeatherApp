//
//  WeatherGeneralCell.swift
//  Weather App
//
//  Created by macbook on 15/01/22.
//

import UIKit

class WeatherGeneralCell: UITableViewCell {
    @IBOutlet weak var dataTypeLabel: UILabel?
    @IBOutlet weak var dataLabel: UILabel?
    @IBOutlet weak var iconImageView: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupData(data: WeatherModel?, currentIndex: Int) {
        dataTypeLabel?.text = data?.main?.temp.getTempreture()
        dataLabel?.text = data?.weather?.first?.main
        switch currentIndex {
        case 2:
            dataLabel?.text = data?.main?.temp.getTempreture()
            dataTypeLabel?.text = "Temperature"
            if #available(iOS 13.0, *) {
                iconImageView?.image = UIImage.init(systemName: "thermometer.sun.fill")
            } else {
                // Fallback on earlier versions
            }
            
        case 3:
            dataLabel?.text = data?.main?.humidity?.getHumidity()
            dataTypeLabel?.text = "Humidity"
            if #available(iOS 13.0, *) {
                iconImageView?.image = UIImage.init(systemName: "humidity.fill")
            } else {
                // Fallback on earlier versions
            }

        case 4:
            dataLabel?.text = data?.wind?.speed?.getWind()
            dataTypeLabel?.text = "Wind"
            if #available(iOS 13.0, *) {
                iconImageView?.image = UIImage.init(systemName: "wind")
            } else {
                // Fallback on earlier versions
            }

        case 5:
            dataLabel?.text = data?.visibility?.getVisibity()
            dataTypeLabel?.text = "Visibility"
            if #available(iOS 13.0, *) {
                iconImageView?.image = UIImage.init(systemName: "eye.fill")
            } else {
                // Fallback on earlier versions
            }

        default:
            break
        }
    }
}




