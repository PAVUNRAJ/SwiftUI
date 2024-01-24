//
//  MenuGridView.swift
//  Domino's Pizza
//
//  Created by PavunRaj on 21/01/24.
//

import SwiftUI

struct MenuGridView: View {
    var menu:[MenuItem]
   // @State private var selectedItem : MenuItem = noMenuItem
    @Binding  var selectedItem : MenuItem
    @State private var favorties: [Int] = [1]
    @Namespace private var nSpace
    func menu(id:Int)-> MenuItem {
        menu.first(where: {$0.id == id}) ?? noMenuItem
    }
    var layout =  Array(repeating: GridItem(spacing: 10), count: 2)
    var hLayout = Array(repeating: GridItem(spacing:10), count: 5)
    var body: some View {
        VStack {
            Text("Favorties")
                .fontWeight(.bold)
            LazyVGrid(columns: hLayout) {
                ForEach(favorties.sorted(),id: \.self) { item in
                    
                    FavoriteTileView(menuItem: menu(id: item))
                        .animation(.smooth, value: favorties)
                        .matchedGeometryEffect(id: item, in: nSpace)
                        .onTapGesture {
                            selectedItem = menu(id: item)
                        }
                        .onLongPressGesture {
                            if let index = favorties.firstIndex(where: {$0 == item}) {
                                withAnimation(.interpolatingSpring) {
                                    favorties.remove(at: index)

                                }
                            }
                        }
                }
            }
            
            
//            VStack {
//                Text(selectedItem.name)
//            }
//            
            ScrollView {
                LazyVGrid(columns: layout, content: {
                    ForEach(menu) { item in
                        if !favorties.contains(item.id) {
                            MenuItemTileView(menuItem: item)
                                .animation(.easeIn, value: favorties)
                                .matchedGeometryEffect(id: item.id, in: nSpace)

                                .onTapGesture(count: 2) {
                                    if !favorties.contains(item.id) {
                                        favorties.append(item.id)
                                    }
                                }
                                .onTapGesture {
                                    selectedItem =  item
                                    
                                }
                                .onLongPressGesture {
                                    selectedItem =  noMenuItem
                                }
                            
                        }
                    }
                })
            }
        }
        .animation(.snappy)
    }
}

#Preview {
    MenuGridView(menu: MenuModel().menu, selectedItem: .constant(testMenuItem))
}
