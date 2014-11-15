//
//  BeaconLocator.swift
//  Find My Luggage
//
//  Created by Tomek Cejner on 15/11/14.
//
//

import Foundation
import CoreLocation

let PROXIMITY_ID = "f7826da6-4fa2-4e98-8024-bc5b71e0893e"

struct VisibleBeacon {
    var luggageBeacon:LuggageBeacon
    var proximity:CLProximity
    var accuracy:CLLocationAccuracy
}

protocol BeanLocatorDelegate {
    func found(beacons:[VisibleBeacon])
}

class BeaconLocator : NSObject, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    var region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: PROXIMITY_ID), identifier: "find.my.luggage")
    var beaconManager = BeaconManager()
    var delegate: BeanLocatorDelegate?
    
    override init() {
        super.init()
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.startRangingBeaconsInRegion(region)
    }
    
    
    // MARK: CLLocationManagerDelegate implementation
    
    func locationManager(manager: CLLocationManager!, didRangeBeacons beacons: [AnyObject]!, inRegion region: CLBeaconRegion!) {
        
        let allBeacons = beacons as [CLBeacon]
        
        let myBeacons = allBeacons.filter { self.beaconManager.contains($0) != nil }
        
        let visibleBeacons:[VisibleBeacon] = myBeacons.map( {
            let myLuggageBeacon = self.beaconManager.contains($0)
            return VisibleBeacon(luggageBeacon: myLuggageBeacon!, proximity: $0.proximity, accuracy: $0.accuracy)
        } )

        delegate?.found(visibleBeacons)
        
//        for beacon in beacons {
//            if let luggageBeacon = beaconManager.contains(beacon as CLBeacon) {
//                delegate?.locator(delegate!, didFound: luggageBeacon, proximity: beacon.proximity, accuracy: beacon.accuracy)
//            }
//        }
    }
    
}