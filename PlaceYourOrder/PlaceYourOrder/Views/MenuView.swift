//
//  MenuView.swift
//  Shared
//
//  Created by Nadim Alam on 29/05/2022.
//

import SwiftUI

struct MenuView: View {
    @StateObject private var viewModel = ViewModel()
    @State private var scaleAmount = 1.0
    private var maxScaleSize = 1.5
    private var animationDuration = 0.3
    
    var body: some View {
        VStack {
            Text("Total Orders: \(viewModel.counter)")
                .bold()
                .foregroundColor(.gray)
                .padding()
                .frame(maxWidth: .infinity)
                .scaleEffect(scaleAmount)
                .animation(
                    .easeInOut(duration: animationDuration)
                    .repeatCount(1, autoreverses: true),
                    value: scaleAmount
                )
            
            List(viewModel.itemList) { item in
                MenuCellView(item: item)
            }
            .listStyle(.plain)
            .background(.thinMaterial)
            
            Button("Add New Order") {
                viewModel.addItem()
                viewModel.increment()
                scaleAmount = maxScaleSize
                DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                    scaleAmount = 1.0
                }
            }
            .padding()
        }
        .onAppear(perform: viewModel.fetchMenuItems)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
