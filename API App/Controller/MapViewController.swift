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
    
    
    
    func showLocation() {
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        networkManager.city = textFieldOutlet.text!
        networkManager.fetchAddress { (addresses: Address) in
            self.address = addresses
            
            if let unwraptDev = self.address?.devices {
                let longitude = Double(unwraptDev[0].latitude)
                let latitude = Double(unwraptDev[0].longitude)
                
                let bank = Tutorial(title: self.address?.devices[0].type,
                                     placeUa: self.address?.devices[0].placeUa,
                                     coordinate: CLLocationCoordinate2D(latitude: longitude!, longitude: latitude!))
                self.mapView.addAnnotation(bank)
            }
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
