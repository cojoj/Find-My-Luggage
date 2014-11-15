//
//  ViewController.swift
//  Find My Luggage
//
//  Created by Mateusz Zając on 15.11.2014.
//
//

import UIKit

class ViewController: UIViewController {

    var locator:BeaconLocator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locator = BeaconLocator()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

