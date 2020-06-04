//
//  MapViewController.swift
//  API App
//
//  Created by Nizelan on 29.05.2020.
//  Copyright © 2020 Nizelan. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UITextFieldDelegate {
    
    var networkManager = NetworkManadger()
    var arrayOfAddresses = [Address]()
    
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
        networkManager.fetchAddress { (addressesArray: [Address]) in
            self.arrayOfAddresses = addressesArray
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
