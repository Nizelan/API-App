//
//  MapViewController.swift
//  API App
//
//  Created by Nizelan on 29.05.2020.
//  Copyright © 2020 Nizelan. All rights reserved.
//

import UIKit
import CoreLocation

class MapViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManadger.requestLocation()
        }
    }
    
    @IBAction func clouseMap() {
        dismiss(animated: true)
    }
    @IBAction func searchButton(_ sender: UIButton) {
    }
    
    var networkLocationManadger = NetworkManadger()
    lazy var locationManadger: CLLocationManager = {
        let lm = CLLocationManager()
        lm.delegate = self
        lm.desiredAccuracy = kCLLocationAccuracyKilometer
        lm.requestWhenInUseAuthorization()
        return lm
    }()

}


// MARK: CLLocationManagerDelegate
extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        //networkLocationManadger.fetchAdress(closure: <#T##([Address]) -> ()#>)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
