//
//  OrderItemView.swift
//  Domino's Pizza
//
//  Created by PavunRaj on 21/01/24.
//

import SwiftUI

struct OrderItemView: View {
    
    @State private var quantity = 1
    @State private var doubleIngredient  = false
    @State private var pizzaCurst:PizzaCrust = .neopolitan
    @State private var text = ""
    @State private var commants = ""
    var body: some View {
        VStack {
            TextField(text: $text) {
                Text("Enter name")
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            Toggle(isOn: $doubleIngredient, label: {
                Text("Double Ingredient " + "\(doubleIngredient ? "Yes" : "No")")
            })
      
        Stepper(value:  $quantity, in: 1...15, label: {
            Text("\(quantity) \(quantity == 1 ? "Pizza" : "Pizzas" )")
        })
        
        Picker(selection: $pizzaCurst, content: {
            ForEach(PizzaCrust.allCases,id: \.self) { curst in
                Text(curst.rawValue).tag(curst)
            }
        }, label: {
            Text("Select Pizza")
        })
            VStack {
                Text("Commants")
                    .fontWeight(.semibold)
                TextEditor(text: $commants)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                    .shadow(radius: 3)
            }
            
            
        }
        .padding()
       // .pickerStyle(WheelPickerStyle())
        
        Spacer()
    }
}

#Preview {
    OrderItemView()
}
