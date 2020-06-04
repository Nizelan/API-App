//
//  MapViewController.swift
//  API App
//
//  Created by Nizelan on 29.05.2020.
//  Copyright © 2020 Nizelan. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UITextFieldDelegate {
    
    let networkManager = NetworkManadger()
    var arrayOfAddresses = [Address]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.fetchAddress { (addressesArray: [Address]) in
            print(addressesArray)
            self.arrayOfAddresses = addressesArray
        }
    }
    
    @IBAction func clouseMap() {
        dismiss(animated: true)
    }
    
    @IBOutlet weak var textFieldOutlet: UITextField!
    
}
