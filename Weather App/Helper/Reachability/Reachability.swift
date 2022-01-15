//
//  Reachability.swift
//  Weather App
//
//  Created by macbook on 15/01/22.
//

import Reachability

/**
   This is Reachability Wrapper
*/
class ReachabilityWrapper {
   static let shared = ReachabilityWrapper()
   private var reachability: Reachability?

    // MARK: - Initialiser
    init() {
        initiateReachalibity()
    }
   
    /**
       initiateReachalibity
    */
   fileprivate func initiateReachalibity() {
        do {
            try reachability = Reachability()
            try reachability!.startNotifier()
        } catch {
            print("could not start reachability notifier")
        }
    }
    
    /**
       isNetworkAvailable
    */
    func isNetworkAvailable() -> Bool {
        return reachability?.connection != .unavailable
    }
}
