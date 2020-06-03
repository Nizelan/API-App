//
//  Adress.swift
//  API App
//
//  Created by Nizelan on 02.06.2020.
//  Copyright © 2020 Nizelan. All rights reserved.
//

import Foundation

struct Coordinate: Codable {
    let city: String
    let devices: [Devices]
}

struct Devices: Codable {
    let latitude: String
    let longitude: String
}
