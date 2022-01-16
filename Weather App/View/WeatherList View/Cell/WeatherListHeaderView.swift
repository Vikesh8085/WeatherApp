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
        if let date = data?.sunrise?.setupData() {
            lblSunRiseTime?.text = date
        } else {
            lblSunRiseTime?.text = "No Date"
        }
        
        if let date = data?.sunset?.setupData() {
            lblSunset?.text = date
        } else {
            lblSunset?.text = "No Date"
        }
        
        self.lblCityName?.text = "\(data?.name ?? ""),\(data?.country ?? "")"
        self.lblLat?.text = "Lat: \(data?.coord?.lat ?? 0)"
        self.lblLong?.text = "Long: \(data?.coord?.lon ?? 0)"
    }
    
}
