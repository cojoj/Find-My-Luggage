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

protocol BeanLocatorDelegate {
    func locator(locator: BeanLocatorDelegate, didFound: LuggageBeacon, proximity:CLProximity, accuracy:CLLocationAccuracy)
}

class BeaconLocator : NSObject, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    var region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: PROXIMITY_ID), identifier: "find.my.luggage")
    var beaconManager = BeaconManager()
    let delegate: BeanLocatorDelegate?
    
    override init() {
        super.init()
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.startRangingBeaconsInRegion(region)
    }
    
    
    // MARK: CLLocationManagerDelegate implementation
    
    func locationManager(manager: CLLocationManager!, didRangeBeacons beacons: [AnyObject]!, inRegion region: CLBeaconRegion!) {
        for beacon in beacons {
            if let luggageBeacon = beaconManager.contains(beacon as CLBeacon) {
                delegate?.locator(delegate!, didFound: luggageBeacon, proximity: beacon.proximity, accuracy: beacon.accuracy)
            }
        }
    }
    
}