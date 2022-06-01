//
//  Service.swift
//  PlaceYourOrder (iOS)
//
//  Created by Nadim Alam on 31/05/2022.
//

import Foundation

class Service {
    func fetchItems(completion: @escaping (Products) -> Void) {
        guard let path = Bundle.main.url(forResource: "menu", withExtension: "json") else { return }
        do {
            let data = try Data(contentsOf: path)
            let result = try JSONDecoder().decode(Products.self, from: data)
            print(result)
            completion(result)
        } catch {
            print("error: \(error)")
        }
    }
}
