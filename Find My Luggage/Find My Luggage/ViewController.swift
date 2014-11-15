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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        println("Immediate: \(immediateRangeView.frame)")
        
        
        
        let l = makeLabel("✿ Plecak 3,56m", x: 10, y: 10)
        immediateRangeView.addSubview(l)
        
        
        
        locator = BeaconLocator()
        
        locator?.delegate = self
    }

    func makeLabel(text:String, x:CGFloat, y:CGFloat) -> UILabel {
        let l = UILabel(frame: CGRectMake(10, 10, 100, 30))
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

        for beacon in beacons {
            placeLabelFor(beacon)

        }

    }

    
    func placeLabelFor(beacon:VisibleBeacon) {
     
        let label = makeLabel(beacon.name() + " " + beacon.formattedRange(), x: 10, y: 10)
        
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

