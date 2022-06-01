//
//  MenuCellView.swift
//  PlaceYourOrder (iOS)
//
//  Created by Nadim Alam on 01/06/2022.
//

import SwiftUI

struct MenuCellView: View {
    private var item: MenuItem
    
    init(item: MenuItem) {
        self.item = item
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(item.product.name)
                Spacer()
                Text("Order No: \(item.orderNumber)")
                    .foregroundColor(.black.opacity(0.6))
            }
            Text("£\(String(format: "%.2f", item.product.cost))")
                .foregroundColor(.blue)
                .bold()
            Text(item.product.itemDescription)
                .foregroundColor(.gray)
        }
    }
}

struct MenuCellView_Previews: PreviewProvider {
    static var previews: some View {
        MenuCellView(item: MenuItem(product: Product.exampleItem, orderNumber: 0))
    }
}
