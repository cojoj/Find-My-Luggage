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
    var luggageBeacons: [LuggageBeacon] = []
    
    override init() {
        super.init()
        
        if let beaconsInUserDefaults = userDefaults.arrayForKey("MyLuggageBeacons") as? [Dictionary<String, AnyObject>] {
            println(beaconsInUserDefaults)
            for userBeacon in beaconsInUserDefaults {
                luggageBeacons.append(LuggageBeacon(name: userBeacon["name"] as String, major: userBeacon["major"] as NSNumber , minor: userBeacon["minor"] as NSNumber))
            }
        }
    }
    
    func contains(beacon: CLBeacon) -> LuggageBeacon? {
        for luggageBeacon in self.luggageBeacons {
            if luggageBeacon.isEqualToBeacon(beacon) {
                return luggageBeacon
            }
        }
        
        return nil
    }
    
    func save() {
        var beaconsArray: [Dictionary<String, AnyObject>] = []
        
        for beacon in luggageBeacons {
            beaconsArray.append(["name": beacon.name, "major": beacon.major, "minor": beacon.minor])
        }
        
        userDefaults.setObject(beaconsArray, forKey: "MyLuggageBeacons")
        userDefaults.synchronize()
    }
    
    func delete(beacon: LuggageBeacon) {
        luggageBeacons = luggageBeacons.filter({ (element) -> Bool in
            if element.name == beacon.name && element.major == beacon.major && element.minor == beacon.minor {
                return false
            } else {
                return true
            }
        })
        
        save()
    }
    
    // MARK: Mock User Defaults
    
    func saveMock() {
        luggageBeacons = [ LuggageBeacon(name: "Backpack", major: 1, minor: 1001),
                           LuggageBeacon(name: "Bag", major: 1, minor: 1000),
                           LuggageBeacon(name: "Czerwona walizka", major: 58138, minor: 46178) ]
        
        var beaconsArray: [Dictionary<String, AnyObject>] = []
        
        for beacon in luggageBeacons {
            beaconsArray.append(["name": beacon.name, "major": beacon.major, "minor": beacon.minor])
        }
        
        userDefaults.setObject(beaconsArray, forKey: "MyLuggageBeacons")
        userDefaults.synchronize()
    }
    
}