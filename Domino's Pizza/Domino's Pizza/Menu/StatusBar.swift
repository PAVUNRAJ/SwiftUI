//
//  TotalView.swift
//  Domino's Pizza
//
//  Created by PavunRaj on 10/01/24.
//

import SwiftUI

struct StatusBar: View {
    @EnvironmentObject var order : OrderModel
    @Binding var showOrder: Bool
    @Binding var presentGrid: Bool
    var body: some View {
        HStack {
            // Text("\($order.orderItems.count) Order")
            Text("\(order.orderItems.count) Order")
            Spacer()
            
            if !showOrder {
                Button {
                    showOrder.toggle()
                }
            label: {
                Image(systemName: showOrder ? "cart" : "menucard")
                    .foregroundColor(.secondary)
                    .padding()
                
        }
            }
            
            Button {
                presentGrid.toggle()
            }
        label: {
            Image(systemName: presentGrid ? "square.grid.3x2" : "list.bullet")
                .foregroundColor(.secondary)
                .padding()
            
        }
            
        }
        .fontWeight(.semibold)
        .padding([.leading,.trailing],10)
    }
}

struct TotalView_Previews: PreviewProvider {
    static var previews: some View {
        StatusBar(showOrder: .constant(true), presentGrid: .constant(false)).environmentObject(OrderModel())
    }
}
