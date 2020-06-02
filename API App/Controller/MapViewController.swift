//
//  MapViewController.swift
//  API App
//
//  Created by Nizelan on 29.05.2020.
//  Copyright © 2020 Nizelan. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var cityNameLabel: UILabel! 
    
    @IBAction func clouseMap() {
        dismiss(animated: true)
    }
    
    @IBAction func searchButton(_ sender: UIButton) {
    }
    

}
