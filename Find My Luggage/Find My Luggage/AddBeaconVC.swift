//
//  AddBeaconVC.swift
//  Find My Luggage
//
//  Created by Tomek Cejner on 16/11/14.
//
//

import UIKit
import CoreLocation

class AddBeaconVC: UIViewController, BeanLocatorDelegate, UITextFieldDelegate {

    @IBOutlet var nameField: UITextField!
    @IBOutlet var takeItLabel: UILabel!
    var beaconLocator = BeaconLocator()
    var minor: NSNumber?
    var major: NSNumber?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        beaconLocator.beanDelegate = self
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func doneTapped(sender: AnyObject) {
        let beaconToSave = LuggageBeacon(name: nameField.text, major: major!, minor: minor!)
        beaconLocator.beaconManager.luggageBeacons.append(beaconToSave)
        beaconLocator.beaconManager.save()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func foundAllBeacons(beacons: [CLBeacon]?) {
        for beacon in beacons! {
            if beacon.accuracy <= 0.07 {
                nameField.enabled = true
                nameField.becomeFirstResponder()
                
                minor = beacon.minor
                major = beacon.major
                
                takeItLabel.text = "Please take it!"
            }
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
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
