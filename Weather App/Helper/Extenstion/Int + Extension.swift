//
//  Int + Extension.swift
//  Weather App
//
//  Created by macbook on 15/01/22.
//

import Foundation


extension Int {
    
    func getPressureValue() -> String {
        return String(self) + " mb"
    }
    
    func getHumidity() -> String {
        return  String(self) + " %"
    }
    
    func getVisibity() -> String {
        return String(self / 1000) + " km"
    }
    
    func setupData() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        return localDate
    }
}
