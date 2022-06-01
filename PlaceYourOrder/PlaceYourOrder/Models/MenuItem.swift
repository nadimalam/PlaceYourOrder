//
//  MenuItem.swift
//  PlaceYourOrder (iOS)
//
//  Created by Nadim Alam on 31/05/2022.
//

import Foundation

struct MenuItem: Identifiable {
    let id = UUID()
    let product: Product
    let orderNumber: Int
    
    static var exampleItem = MenuItem(product: Product.exampleItem, orderNumber: 1)
}
