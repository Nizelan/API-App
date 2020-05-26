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
        let url = URL(string: urlString)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { data, response, error in
            if let data = data {
                let dataString = String(data: data, encoding: .utf8)
                print(dataString!)
            }
        }
        task.resume()
    }
}
