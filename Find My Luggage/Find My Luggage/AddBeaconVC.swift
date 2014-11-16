//
//  AddBeaconVC.swift
//  Find My Luggage
//
//  Created by Tomek Cejner on 16/11/14.
//
//

import UIKit
import CoreLocation

class AddBeaconVC: UIViewController, BeanLocatorDelegate {

    @IBOutlet var nameField: UITextField!
    @IBOutlet var takeItLabel: UILabel!
    var beaconLocator = BeaconLocator()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func doneTapped(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func foundAllBeacons(beacons: [CLBeacon]?) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
