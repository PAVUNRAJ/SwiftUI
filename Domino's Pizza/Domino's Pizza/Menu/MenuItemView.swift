//
//  MenuItemView.swift
//  Domino's Pizza
//
//  Created by PavunRaj on 09/01/24.
//

import SwiftUI

struct MenuItemView: View {
    @State private var addedItem: Bool = false
    @Binding var selectedListItem : MenuItem
    @ObservedObject var item: OrderModel
    @State var presentAlert: Bool = false
    @State private var order:OrderItem = noOrderItem
    @State private var newOrder:Bool = false
    var body: some View {
        VStack(spacing:10) {
           // Image("1dish")
            if let image = UIImage(named:"\(selectedListItem.id)dish") {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .shadow(color: .primary,radius: 5, x: 8, y: 8)
            } else {
                Image("\(1)dish")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .shadow(color: .primary,radius: 5, x: 8, y: 8)
            }
                
                
            Text("\(selectedListItem.name)")
                .fontWeight(.medium)
                .padding(.top,10)
               // .foregroundColor(Color("sky"))
            Button{
                presentAlert = true
            }
            
        label: {
            HStack(spacing:20) {
                Text(selectedListItem.price,format: .currency(code: "INR"))
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                Image(systemName: addedItem ? "cart.badge.plus" : "cart.fill.badge.plus")
                    .foregroundColor(.white)
            }
            
        }
        .disabled(selectedListItem.id < 0)
        .frame(minWidth: 300, maxWidth: 350, minHeight: 40)
        .background(
            RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.red)
            )
            /*
        .alert("Buy a \(selectedListItem.name) ",isPresented:$presentAlert) {
            Button {
                addedItem.toggle()
                item.addOrder(selectedListItem, quantity: 1)
            }
        label: {
            Text("Yes")
        }
            Button("No",role: .cancel) {
           
            }
            Button("Make a order double!") {
                addedItem.toggle()
                item.addOrder(selectedListItem, quantity: 2)
            }
        }
            */
        .sheet(isPresented: $presentAlert, content: {
            OrderDetailView(orderItem: $order, presentSheet: $presentAlert, newOrder: $newOrder)
        })
        //.cornerRadius(10)
        .padding([.leading],10)
       
        }
        
        .padding(.bottom,10)
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(selectedListItem: .constant(testMenuItem), item: OrderModel())
    }
}
