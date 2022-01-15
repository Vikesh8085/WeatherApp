//
//  NetworkResult.swift
//  Weather App
//
//  Created by macbook on 14/01/22.
//

import Foundation


enum HTTPStatusCodes: Int, Equatable {
    
    case success = 200
    case notFound = 400
    case tooManyRequests = 429
    case unAvailable = 503
    
}

struct APIManagerConstant {
    static let key = "b69ef0e2fb3812990ee504b194852aaf"
    static let baseUrl = "http://api.openweathermap.org"
}
