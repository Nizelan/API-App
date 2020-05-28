//
//  NetworkManadger.swift
//  API App
//
//  Created by Nizelan on 26.05.2020.
//  Copyright © 2020 Nizelan. All rights reserved.
//

import Foundation

struct NetworkManadger {
    func apiManadger() {
        let urlString = "https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                let currency = self.parseJSON(withData: data)
                print(currency)
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) -> Currency? {
        let decoder = JSONDecoder()
        do {
            let curencyData = try decoder.decode([CurrencyData].self, from: data)
            guard let currency = Currency(currencyData: curencyData) else {
                return nil
            }
            return currency
        } catch let error as NSError{
            print(error.localizedDescription)
        }
        return nil
    }
}
