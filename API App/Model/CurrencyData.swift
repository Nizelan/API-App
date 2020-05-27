//
//  CurrencyData.swift
//  API App
//
//  Created by Nizelan on 27.05.2020.
//  Copyright © 2020 Nizelan. All rights reserved.
//

import Foundation

struct CurrencyData: Codable {
    let ccy: String
    let base_ccy: String
    let buy: String
    let sale: String
}
