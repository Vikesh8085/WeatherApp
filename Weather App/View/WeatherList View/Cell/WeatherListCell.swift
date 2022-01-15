//
//  WeatherListCell.swift
//  Weather App
//
//  Created by macbook on 15/01/22.
//

import UIKit

class WeatherListCell: UITableViewCell {

    @IBOutlet weak var lblDate: UILabel?
    @IBOutlet weak var lblStatus: UILabel?
    @IBOutlet weak var icon: UIImageView?
    
    @IBOutlet weak var lblTemp: UILabel?
    @IBOutlet weak var lblWind: UILabel?
    @IBOutlet weak var lblHumidity: UILabel?
    @IBOutlet weak var lblVisibilty: UILabel?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(data: WeatherModel?) {
        
        self.lblDate?.text = data?.dt_txt
        if let status =  data?.weather?.first?.weatherDescription {
            self.lblStatus?.text = status.uppercased()
        } else {
            self.lblStatus?.text = "N/A".uppercased()

        }
        
        if let temp = data?.main?.temp {
            self.lblTemp?.text = temp.getTempreture()
        } else {
            self.lblTemp?.text = "N/A"
        }
        
        if let temp = data?.wind?.speed  {
            self.lblWind?.text = temp.getWind()
        } else {
            self.lblWind?.text = "N/A"
        }
        
        if let temp = data?.main?.humidity  {
            self.lblHumidity?.text = temp.getHumidity()
        } else {
            self.lblHumidity?.text = "N/A"
        }

        if let temp = data?.visibility  {
            self.lblVisibilty?.text = temp.getVisibity()
        } else {
            self.lblVisibilty?.text = "N/A"
        }

    }
    
}
