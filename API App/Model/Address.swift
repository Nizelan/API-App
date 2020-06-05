//
//  Address.swift
//  API App
//
//  Created by Nizelan on 04.06.2020.
//  Copyright © 2020 Nizelan. All rights reserved.
//

import Foundation

struct Address: Codable {
    let city: String
    let devices: [Devices]
}

struct Devices: Codable {
    let latitude: String
    let longitude: String
}
