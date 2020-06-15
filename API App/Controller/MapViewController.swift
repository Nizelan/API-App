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
    let annotationIdentifire = "annotationIdentifire"
    let reuseId = "pin"
    var hoursArray = [String]()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        textFieldOutlet.delegate = self
        
    }
    
    @IBAction func clouseMap() {
        dismiss(animated: true)
    }
    
    @IBOutlet weak var textFieldOutlet: UITextField!

    func textFieldDidEndEditing(_ textField: UITextField) {
        let date = Date()
        let hour = DateFormatter()
        hour.dateFormat = "HH:mm"
        let day = DateFormatter()
        day.dateFormat = "E"
        
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
                    let stringDay = day.string(from: date)
                    let APIHour = DateFormatter()
                    APIHour.date(from: address.devices[i].tw[stringDay.lowercased()]!)
                    let arrayOfAPI = String(address.devices[i].tw[stringDay.lowercased()]!).split(separator: "-")
                    self.hoursArray.append("\(arrayOfAPI[0])")
                    self.hoursArray.append("\(arrayOfAPI[1])")
                    self.hoursArray.append("\(hour.string(from: date))")
                    
                    for y in 0..<self.hoursArray.count {
                        let unwanted: Set<Character> = [":", " "]
                        self.hoursArray[y].removeAll(where: { unwanted.contains($0) })
                    }
                    print(self.hoursArray)
                    
                    
                }
            }
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifire) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifire)
            annotationView?.canShowCallout = true
        }
        
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
        pinView?.canShowCallout = true
        let openingTime = Int(self.hoursArray[0])!
        let clousingTime = Int(self.hoursArray[1])!
        let relevantTime = Int(self.hoursArray[2])!
        switch relevantTime {
        case openingTime...clousingTime:
            pinView?.pinTintColor = .green
        default:
            pinView?.pinTintColor = .black
        }
        annotationView = pinView
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "privat")
        annotationView?.rightCalloutAccessoryView = imageView
        
        return annotationView
    }
}
