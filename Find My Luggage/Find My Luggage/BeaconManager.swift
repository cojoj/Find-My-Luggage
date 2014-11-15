//
//  BeaconManager.swift
//  Find My Luggage
//
//  Created by Mateusz Zając on 15.11.2014.
//
//

import Foundation
import CoreLocation

class BeaconManager: NSObject {
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    var luggageBeacons = [ LuggageBeacon(name: "Plecak", major: 1, minor: 1001),
                           LuggageBeacon(name: "Czerwona walizka", major: 58138, minor: 46178) ]
    
    func contains(beacon: CLBeacon) -> LuggageBeacon? {
        for luggageBeacon in self.luggageBeacons {
            if luggageBeacon.isEqualToBeacon(beacon) {
                return luggageBeacon
            }
        }
        
        return nil
    }
    
}