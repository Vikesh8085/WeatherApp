//
//  WeatherListHeaderView.swift
//  Weather App
//
//  Created by macbook on 15/01/22.
//


import UIKit

final class WeatherListHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var lblCityName: UILabel?
    @IBOutlet weak var lblLat: UILabel?
    @IBOutlet weak var lblLong: UILabel?
    @IBOutlet weak var lblSunRiseTime: UILabel?
    @IBOutlet weak var lblSunset: UILabel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
 
    // MARK: - Private methods

    func setData(data: City?) {
        self.lblCityName?.text = "\(data?.name ?? ""),\(data?.country ?? "")"
        self.lblLat?.text = "Lat: \(data?.coord?.lat ?? 0)"
        self.lblLong?.text = "Long: \(data?.coord?.lon ?? 0)"
        self.lblSunRiseTime?.text = "\(data?.sunrise ?? 0)"
        self.lblSunset?.text = "\(data?.sunset ?? 0)"

    }

}
