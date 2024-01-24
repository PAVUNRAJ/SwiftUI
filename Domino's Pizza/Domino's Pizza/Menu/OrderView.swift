//
//  OrderView.swift
//  Domino's Pizza
//
//  Created by PavunRaj on 09/01/24.
//

import SwiftUI

struct OrderView: View {
    //@Binding var cart: [OrderItem]
     @ObservedObject var cart: OrderModel
    var body: some View {
        VStack {
            //Label("Cart", systemImage: "cart")
            HStack(alignment: .center,spacing: 5) {
                Text("Total Orders")
                    .padding(5)
                Spacer()
            icon: do {
                Image(systemName: cart.orderItems.isEmpty ? "cart": "cart.fill")
            }
            Label: do {
                Text(cart.orderTotal, format: .currency(code: "INR"))
                    .padding(.trailing,10)
            }
            }
            .frame(height: 50)
            .background(Color("orderG"))
            .foregroundColor(.white)
            .font(.headline)
            .fontWeight(.semibold)
            //.cornerRadius(5)
           
           
            ScrollView(.vertical) {
            //List() {
                //ForEach(cart,id:\.id) { order in
                ForEach($cart.orderItems) { order in
                    
                    //Text("\(order.item.name)")
                    OrderRowView(numberOfItem: order)
                    
                }
                .padding()
            }
            .frame(minHeight: 130)
            
            Button {
                cart.removeLast()
            }
        label: {
            Text("Delete item")
        }
        .frame(minWidth: 300, maxWidth: 350, minHeight: 50)
        .foregroundColor(.white)
        .background(Color.red, in:Capsule())
        .padding(.bottom,60)
        }
        .background(Color("gray"))
        .cornerRadius(10)
        
    
    }
    
}


struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
       // OrderView(cart: .constant(testOrders))
        OrderView(cart: OrderModel())
    }
}
