//
//  ViewController.swift
//  Find My Luggage
//
//  Created by Mateusz Zając on 15.11.2014.
//
//

import UIKit
import CoreLocation

class ViewController: UIViewController, BeanLocatorDelegate {

    
    @IBOutlet var immediateRangeView: UIView!
    @IBOutlet var nearRangeView: UIView!
    @IBOutlet var farRangeView: UIView!
    
    var locator:BeaconLocator?
    
    var labels:[UILabel] = []
    var counts:Dictionary<CLProximity,Int> = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        println("Immediate: \(immediateRangeView.frame)")
        
        
        
        
        locator = BeaconLocator()
        
        locator?.delegate = self
    }

    func makeLabel(text:String, x:CGFloat, y:CGFloat) -> UILabel {
        let l = UILabel(frame: CGRectMake(x, y, 0, 0))
        l.font = UIFont.boldSystemFontOfSize(24)
        l.text = text
        l.textColor = UIColor.whiteColor()
        l.sizeToFit()
        return l
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func found(beacons: [VisibleBeacon]) {
        for label in labels {
            label.removeFromSuperview()
        }
        
        labels.removeAll(keepCapacity: false)
        self.counts = [ CLProximity.Far:0, CLProximity.Immediate:0, CLProximity.Near:0 ]

        for beacon in beacons {
            placeLabelFor(beacon)

        }

    }

    
    func placeLabelFor(beacon:VisibleBeacon) {

        let howmany = counts[beacon.proximity]
        let ypos = CGFloat(howmany!) * 24.0 + 10.0
        let label = makeLabel(beacon.name() + " " + beacon.formattedRange(), x: 10, y: ypos)

        println("Label \(beacon.name()) \(ypos) \(howmany)")

        counts[beacon.proximity] = howmany! + 1
        
        switch (beacon.proximity) {
        case CLProximity.Immediate:
            immediateRangeView.addSubview(label)
        case .Near:
            nearRangeView.addSubview(label)
        case .Far:
            farRangeView.addSubview(label)
        default:
            println("Dupa")
            
        }

        labels.append(label)
    }
    
    
}

