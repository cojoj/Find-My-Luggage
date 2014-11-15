//
//  LuggageBeacon.swift
//  Find My Luggage
//
//  Created by Mateusz Zając on 15.11.2014.
//
//

import Foundation

struct LuggageBeacon {
    
    var luggageName: String!
    var major: NSNumber!
    var minor: NSNumber!
    
    init(name: String!, major: NSNumber!, minor: NSNumber!) {
        self.luggageName = name
        self.major = major
        self.minor = minor
    }
    
}