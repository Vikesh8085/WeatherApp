//
//  Validator.swift
//  Weather App
//
//  Created by macbook on 15/01/22.
//

import Foundation

class Validator {
    func validateSearchField(text: String) -> Bool {
        if text.isEmpty { return false }
        return text.count >= 2
    }
}
