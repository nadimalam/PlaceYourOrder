//
//  MenuViewModel.swift
//  PlaceYourOrder (iOS)
//
//  Created by Nadim Alam on 29/05/2022.
//

import SwiftUI

extension MenuView {
    class ViewModel: ObservableObject {
        @Published var counter = 0
        @Published var itemList = [MenuItem]()
        private var allProducts = Products(items: [Product]())
        
        func increment() {
            counter += 1
        }
        
        func addItem() {
            if let item = allProducts.items.randomElement() {
                let newProduct = Product(name: item.name,
                                         itemDescription: item.itemDescription,
                                         cost: item.cost)
                let newMenuItem = MenuItem(product: newProduct, orderNumber: itemList.count + 1)
                withAnimation {
                    itemList.insert(newMenuItem, at: 0)
                }
            }
        }
        
        func fetchMenuItems() {
            let service = Service()
            service.fetchItems { result in
                self.allProducts = result
            }
        }
    }
}
