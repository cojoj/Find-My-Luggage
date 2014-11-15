//
//  LuggageBeacon.swift
//  Find My Luggage
//
//  Created by Mateusz Zając on 15.11.2014.
//
//

import Foundation
import CoreLocation

struct LuggageBeacon {
    
    var name: String!
    var major: NSNumber!
    var minor: NSNumber!
    
    func isEqualToBeacon(beacon: CLBeacon) -> Bool {
        if major == beacon.major && minor == beacon.minor {
            return true
        } else {
            return false
        }
    }
    
}