//
//  MenuRowView.swift
//  Domino's Pizza
//
//  Created by PavunRaj on 09/01/24.
//

import SwiftUI

struct MenuRowView: View {
    //var numberDishItem: Int = 1
    var numberDishItem: MenuItem
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            if let image = UIImage(named: "\(numberDishItem.id)dish") {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100,height: 100)
                    .cornerRadius(15)
                    .padding(.leading,10)

            } else {
                Image("Burger")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100,height: 100)
                    .cornerRadius(15)
                    .padding(.leading,10)


            }
               
            
            VStack(alignment: .leading,spacing: 3) {
               // Text("Fiery Sausage & Paprika")
                Text(numberDishItem.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
              //  Text("Spiciest non veg pizza with spicy & herby chicken sausage and red paprika toppings on a new spicy peri peri sauce base.")
                Text("\(K.Item.itemDesc[numberDishItem.id])")
                    .font(.caption)
                RatingView(rating: numberDishItem.rating)
                
                //RatingView(rating: 5)

            }
            Text(numberDishItem.price, format: .currency(code: "INR"))
                .font(.subheadline)
                .fontWeight(.semibold)
                //.padding(.trailing,25)
        }
        
    }
}

struct MenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        MenuRowView(numberDishItem: testMenuItem)
    }
}
