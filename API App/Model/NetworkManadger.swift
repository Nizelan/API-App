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
                self.parseJSON(withData: data)
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) {
        let decoder = JSONDecoder()
        do {
            let curencyData = try decoder.decode([CurrencyData].self, from: data)
            print(curencyData)
        } catch let error as NSError{
            print(error.localizedDescription)
        }
        
    }
}
