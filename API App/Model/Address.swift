//
//  Adress.swift
//  API App
//
//  Created by Nizelan on 02.06.2020.
//  Copyright © 2020 Nizelan. All rights reserved.
//

import Foundation

struct Address: Codable {
    let country: String
    let state: String
    let city: String
    let address: String
}
