//
//  MapViewController.swift
//  API App
//
//  Created by Nizelan on 29.05.2020.
//  Copyright © 2020 Nizelan. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UITextFieldDelegate {
    
    var networkManager = NetworkManadger()
    var address: Address?
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldOutlet.delegate = self
        
    }

    
    @IBAction func clouseMap() {
        dismiss(animated: true)
    }
    
    @IBOutlet weak var textFieldOutlet: UITextField!

    func textFieldDidEndEditing(_ textField: UITextField) {
        
        networkManager.city = textFieldOutlet.text!
        networkManager.fetchAddress { (addresses: Address) in
            self.address = addresses
            
            if let address = self.address {
                for i in 0..<address.devices.count {
                    let bank = Tutorial(title: address.devices[i].type,
                                         placeUa: address.devices[i].placeUa,
                                         coordinate: CLLocationCoordinate2D(latitude: Double(address.devices[i].longitude)!,
                                                                            longitude: Double(address.devices[i].latitude)!))
                    self.mapView.addAnnotation(bank)
                }
            }
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
