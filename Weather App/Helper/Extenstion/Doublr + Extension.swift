//
//  Doublr + Extension.swift
//  Weather App
//
//  Created by macbook on 15/01/22.
//

import Foundation

extension Double {
    
    func getTempreture() -> String {
        let x: Double = self - 273.15
        return "\(x.formatedUpto2decimalPlace())" + "° C"
    }
    
    func getWind() -> String {
        return String(Int(self))  + " m/sec"
    }
    
    func formatedUpto2decimalPlace() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en_ID")
        numberFormatter.numberStyle = .decimal
        numberFormatter.decimalSeparator = "."
        let value = numberFormatter.string(from: NSNumber(value:self))!
        if let formattedTipAmount = numberFormatter.string(from: self as NSNumber) {
            return formattedTipAmount
        }
        return ""
    }
    func setupData() -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
        dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        return localDate
    }
}
