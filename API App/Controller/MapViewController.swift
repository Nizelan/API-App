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
        
        let bank = Tutorial(title: "ATM",
                            placeUa: "магазин Мебель",
                            coordinate: CLLocationCoordinate2D(latitude: 49.837019, longitude: 24.060365))
        mapView.addAnnotation(bank)
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
            print(2)
        }
        print(1)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
