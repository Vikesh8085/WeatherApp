//
//  WeatherDetailTimeCell.swift
//  Weather App
//
//  Created by macbook on 15/01/22.
//

import UIKit

class WeatherDetailTimeCell: UITableViewCell {
    
    @IBOutlet weak var lblCity: UILabel?
    var dataModel: WeatherModel? {
        didSet {
            self.lblCity?.text = dataModel?.name
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
