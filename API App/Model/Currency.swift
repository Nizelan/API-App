//
//  Currency.swift
//  API App
//
//  Created by Nizelan on 28.05.2020.
//  Copyright © 2020 Nizelan. All rights reserved.
//

import Foundation

struct Currency {
    let ccy: String
    let base_ccy: String
    let buy: String
    let sale: String
    
    init?(currencyData: [CurrencyData]) {
        ccy = currencyData[0].ccy
        base_ccy = currencyData[0].base_ccy
        buy = currencyData[0].buy
        sale = currencyData[0].sale
    }
}
