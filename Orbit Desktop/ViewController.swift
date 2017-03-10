//
//  ViewController.swift
//  Orbit Desktop
//
//  Created by Stefan Britton on 2016-12-30.
//  Copyright © 2016 Kasama. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var tableView: NSTableView!
    
    var beacon = OrbitBeacon(identifier: "DESKTOP APP")
    var devices = [(id: String, range: NSNumber)]()

    override func viewDidLoad() {
        super.viewDidLoad()
        checkExistingPlanet()
    }
    
    func checkExistingPlanet() {
        self.beacon.delegate = self
        self.beacon.startBroadcasting()
        self.beacon.startDetecting()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

extension ViewController: OrbitBeaconDelegate {
    
    func beacon(_ beacon: OrbitBeacon, bluetoothEnabled: Bool) {
        print("bluetoothEnabled: \(bluetoothEnabled)")
    }
    
    func beacon(_ beacon: OrbitBeacon, foundDevices: [String : Any]) {
        print("foundDevices: \(foundDevices)")
        devices = [(id: String, range: NSNumber)]()
        for key in foundDevices.keys {
            let range = foundDevices[key] as! NSNumber
            devices.append((id: key, range: range))
        }
//        tableView.reloadData()
    }
}
