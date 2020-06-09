//
//  NetworkManadger.swift
//  API App
//
//  Created by Nizelan on 26.05.2020.
//  Copyright © 2020 Nizelan. All rights reserved.
//

import Foundation

struct NetworkManadger {
    
    var city = "Львов"
    
    func fetchCurrency(closure: @escaping ([Currency]) -> ()) {
        let urlString = "https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let currency: [Currency] = self.parseJSON(withData: data) {
                    DispatchQueue.main.async {
                        closure(currency)
                    }
                }
            }
        }
        task.resume()
    }
    
    func fetchAddress(closure: @escaping (Address) -> ()) {
        let urlString = "https://api.privatbank.ua/p24api/infrastructure?json&atm&city=\(city)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        guard let string = urlString, let url = URL(string: string) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let address: Address = self.parseJSON(withData: data) {
                    DispatchQueue.main.async {
                        closure(address)
                        print(address.devices)
                    }
                }
            }
        }
        task.resume()
    }
    
    func parseJSON<T>(withData data: Data) -> T? where T:Decodable {
        let decoder = JSONDecoder()
        do {
            let curencyData = try decoder.decode(T.self, from: data)
            return curencyData
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
