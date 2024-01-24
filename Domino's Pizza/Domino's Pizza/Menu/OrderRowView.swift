//
//  OrderRowView.swift
//  Domino's Pizza
//
//  Created by PavunRaj on 09/01/24.
//

import SwiftUI

struct OrderRowView: View {
   // var numberOfItem: Int = 1
   @Binding var numberOfItem: OrderItem
    var body: some View {
        HStack (alignment: .firstTextBaseline) {
            VStack(alignment: .leading) {
               // Text("Your oder item \(numberOfItem)")
                Text("\(numberOfItem.item.name)")
                HStack {
//                    Text("1 @")
//                    Text(200, format: .currency(code: "INR"))
                    Text(numberOfItem.quantity, format: .number)
                    Text(numberOfItem.item.price, format: .currency(code: "INR"))
                    
                }
                //.padding([.leading])
            }
            Spacer()
            Text(numberOfItem.extPrice, format: .currency(code: "INR"))
//            Text(200, format: .currency(code: "INR"))
                .fontWeight(.semibold)
        }
        .padding(10)
        .background(Color(.lightGray))
        .cornerRadius(10)

        
    }
}

struct OrderRowView_Previews: PreviewProvider {
    static var previews: some View {
        OrderRowView(numberOfItem: .constant(testOrderItem))
    }
}

