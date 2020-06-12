//
//  Address.swift
//  API App
//
//  Created by Nizelan on 04.06.2020.
//  Copyright © 2020 Nizelan. All rights reserved.
//

import Foundation
import MapKit

struct Address: Codable {
    let devices: [Devices]
}

struct Devices: Codable {
    let type: String
    let placeUa: String
    let latitude: String
    let longitude: String
    let tw: [String: String]
}
