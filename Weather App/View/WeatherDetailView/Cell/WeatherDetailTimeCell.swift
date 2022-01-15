//
//  WeatherDetailTimeCell.swift
//  Weather App
//
//  Created by macbook on 15/01/22.
//

import UIKit

class WeatherDetailTimeCell: UITableViewCell {
    
    @IBOutlet weak var lblCity: UILabel?
    @IBOutlet weak var lblDate: UILabel?
    @IBOutlet weak var imgViewIcon: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupData(date: Double?, city: City?, image: String?) {
        lblCity?.text = "\(city?.name ?? "") ,\(city?.country ?? "IN")"
        if let date = date {
            lblDate?.text = date.setupData()
        } else {
            lblDate?.text = "No Date"
        }
        if let id = image, let url = URL(string: "http://openweathermap.org/img/wn/\(id)@2x.png") {
            self.imgViewIcon?.sd_setImage(with: url, placeholderImage: UIImage(named: "icons8-wind-turbine-50")!, options: .delayPlaceholder, completed: { img, erro, type, url in
                print(img, erro, type, url)
            })
        }
    }
}
