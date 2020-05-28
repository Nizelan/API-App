//
//  Currency.swift
//  API App
//
//  Created by Nizelan on 28.05.2020.
//  Copyright © 2020 Nizelan. All rights reserved.
//

import Foundation

struct Currency: Codable {
    let ccy: String
    let base_ccy: String
    let buy: String
    let sale: String
}
