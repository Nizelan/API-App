//
//  NetworkManadger.swift
//  API App
//
//  Created by Nizelan on 26.05.2020.
//  Copyright © 2020 Nizelan. All rights reserved.
//

import Foundation

struct NetworkManadger {
    func fetchCurrency(closure: @escaping ([Currency]) -> ()) {
        let urlString = "https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let currency = self.parseJSON(withData: data) {
                    DispatchQueue.main.async {
                        closure(currency)
                    }
                }
            }
        }
        task.resume()
    }
    func parseJSON(withData data: Data) -> [Currency]? {
        let decoder = JSONDecoder()
        do {
            let curencyData = try decoder.decode([Currency].self, from: data)
            return curencyData
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
    
    func fetchAdress(closure: @escaping ([Coordinate]) -> ()) {
        let urlString = "https://api.privatbank.ua/p24api/infrastructure?json&atm&address=&city="
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let address = self.parseAddressJSON(withData: data) {
                    DispatchQueue.main.async {
                        closure(address)
                        print(address)
                    }
                }
            }
        }
        task.resume()
    }
    func parseAddressJSON(withData data: Data) -> [Coordinate]? {
        let decoder = JSONDecoder()
        do {
            let addressData = try decoder.decode([Coordinate].self, from: data)
            return addressData
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
