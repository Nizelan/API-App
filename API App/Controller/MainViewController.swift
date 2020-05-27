//
//  ViewController.swift
//  API App
//
//  Created by Nizelan on 22.05.2020.
//  Copyright © 2020 Nizelan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var USDLabel: UILabel!
    @IBOutlet weak var EURLavel: UILabel!
    @IBOutlet weak var RUBLabel: UILabel!
    @IBOutlet weak var BTCLabel: UILabel!
    
    @IBAction func updateButton(_ sender: UIButton) {
        networkManadger.apiManadger()
    }
    
    let networkManadger = NetworkManadger()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


}

