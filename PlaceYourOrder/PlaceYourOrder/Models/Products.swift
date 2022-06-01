//
//  Products.swift
//  PlaceYourOrder (iOS)
//
//  Created by Nadim Alam on 29/05/2022.
//

import Foundation

// MARK: - Products
struct Products: Codable {
    var items: [Product]
}

// MARK: - Product
struct Product: Codable, Identifiable {
    let id = UUID()
    let name: String
    let itemDescription: String
    let cost: Double

    enum CodingKeys: String, CodingKey {
        case name
        case itemDescription = "description"
        case cost
    }
    
    static var exampleItem = Product(name: "Pizza",
                                     itemDescription: "Meat Feast Pizza with Chicken and Beef.",
                                     cost: 8)
}
