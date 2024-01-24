//
//  MenuView.swift
//  Domino's Pizza
//
//  Created by PavunRaj on 09/01/24.
//

import SwiftUI

struct MenuView: View {
    var menuItem :[MenuItem]
    @Binding var selectedItem: MenuItem
    var body: some View {
       // ScrollView {
//        List(MenuCategory.allCases,id: \.self) { list in
//            //ForEach(1...16, id: \.self) { items in
//            ForEach(menuItem) { items in
//                MenuRowView(numberDishItem: items)
//            }
//        }
        
        List(MenuCategory.allCases,id: \.self) { list in
            //ForEach(1...16, id: \.self) { items in
            Section(list.rawValue) {
                ForEach(menuItem.filter({$0.category == list})) { items in
                    MenuRowView(numberDishItem: items)
                        .onTapGesture {
                            selectedItem = items
                        }
                }
                
            }
            .ignoresSafeArea()
//        header:{
//            Text(list.rawValue)
//        }
            
        }
        //.padding()
        
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(menuItem: MenuModel().menu, selectedItem: .constant(testMenuItem))
    }
}
