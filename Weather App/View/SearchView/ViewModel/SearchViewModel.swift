//
//  SearchViewModel.swift
//  Weather App
//
//  Created by macbook on 15/01/22.
//

import Foundation

final class SearchViewModel {
    
    private var netWorkmanager: NetworkManager?
    var weatherForcast: ForeCastModel?
    
    init(networkManager: NetworkManager) {
        self.netWorkmanager = networkManager
    }
    
    func callAPIWithQuery(query: String, success:@escaping ((ForeCastModel?) -> Void), failure:@escaping ((CustomError) -> Void)) {
        
        self.netWorkmanager?.callAPI(query: query, resultType: ForeCastModel.self, success: { data in
            self.weatherForcast = data
            success(data)
        }, failure: failure)
    }
    
    
}
