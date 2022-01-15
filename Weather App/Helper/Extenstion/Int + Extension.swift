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
}
