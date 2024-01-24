//
//  ContentView.swift
//  Domino's Pizza
//
//  Created by PavunRaj on 09/01/24.
//

import SwiftUI

struct ContentView: View {
    var menu:[MenuItem]
    @State private var selectedItem: MenuItem = noMenuItem
    //@State var order:OrderModel
    //@State private var order:[OrderItem] = testOrders
    @StateObject var order:OrderModel = OrderModel()
    @State private var showOrder:Bool = false
    @State private var favroties: [Int] = [-1]
    @State private var presentGrid: Bool = false
    var body: some View {
       // VStack {
        TabView {
          //  HeaderView()
            /*
             Button("Show order") {
             //  Image(systemName: showOrder ? "cart" : "menucard")
             showOrder.toggle()
             }
             */
            
           
            /*
            if showOrder { OrderView(cart: order) }
            else {
                MenuItemView(selectedListItem: $selectedItem, item: order)
                if presentGrid {
                    MenuGridView(menu: menu, selectedItem: $selectedItem)
                } else {
                    MenuView(menuItem: menu,selectedItem: $selectedItem)
                    //.padding(.leading,20)
                }
            }
            */
            
            VStack {
                HeaderView()
                StatusBar(showOrder: $showOrder, presentGrid: $presentGrid)
                MenuItemView(selectedListItem: $selectedItem, item: order)
                if presentGrid {
                    MenuGridView(menu: menu, selectedItem: $selectedItem)
                } else {
                    MenuView(menuItem: menu,selectedItem: $selectedItem)
                    //.padding(.leading,20)
                }
            }.tabItem {
                Label("Menu", systemImage: "list.bullet")
            }
            VStack {
                HeaderView()
                StatusBar(showOrder: $showOrder, presentGrid: $presentGrid)
                OrderView(cart: order)
                
            }.tabItem {
                Label("Order", systemImage:"cart")
            }
          
            
        }
        //.padding()
        // .background(.linearGradient(colors: [.purple,.white], startPoint: .topLeading, endPoint: .bottomTrailing ))
        
        .ignoresSafeArea(.all)
        .environmentObject(order)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(menu: MenuModel().menu)
        //            .colorScheme(.dark)
        //            .background(Color.black)
    }
}




