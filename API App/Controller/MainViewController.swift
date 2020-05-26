//
//  ViewController.swift
//  API App
//
//  Created by Nizelan on 22.05.2020.
//  Copyright © 2020 Nizelan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let networkManadger = NetworkManadger()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManadger.apiManadger()
    }


}

