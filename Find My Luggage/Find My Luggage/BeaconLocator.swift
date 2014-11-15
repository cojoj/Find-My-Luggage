//
//  BeaconLocator.swift
//  Find My Luggage
//
//  Created by Tomek Cejner on 15/11/14.
//
//

import Foundation
import CoreLocation

class BeaconLocator : NSObject, CLLocationManagerDelegate {
    
    var region:CLBeaconRegion
    var locationManager:CLLocationManager
    
    override init() {
        println("Creating location manager")
        locationManager = CLLocationManager()
        
        region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "f7826da6-4fa2-4e98-8024-bc5b71e0893e"),
            major: 1,
            minor: 1000,
            identifier: "Plecak")
        
//        region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "f7826da6-4fa2-4e98-8024-bc5b71e0893e"), identifier:"My stuff")
        
        super.init()
        
        if(locationManager.respondsToSelector("requestAlwaysAuthorization")) {
            locationManager.requestAlwaysAuthorization()
        }
        
        locationManager.delegate = self
        locationManager.startMonitoringForRegion(region)
        locationManager.startRangingBeaconsInRegion(region)
        
    }
    
    
    func locationManager(manager: CLLocationManager!, didRangeBeacons beacons: [AnyObject]!, inRegion region: CLBeaconRegion!) {
        
        println("Got a beacon!")
        
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("Error: \(error)")
    }
    
    func locationManager(manager: CLLocationManager!, monitoringDidFailForRegion region: CLRegion!, withError error: NSError!) {
        println("Monitoring did fail with error \(error)")
    }
    
    
}