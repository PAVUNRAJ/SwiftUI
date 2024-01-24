//
//  HeaderView.swift
//  Domino's Pizza
//
//  Created by PavunRaj on 09/01/24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
            Text("Domino's Pizza")
                .font(.title)
                .fontWeight(.bold)
                .font(.custom("Silkscreen-Bold", size: 20, relativeTo: .body))
                .padding([.leading],-170)
            Image("Domino's")
                .resizable()
                .frame(width: UIScreen.main.bounds.width - 15, height: 150)
//                .cornerRadius(20)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 10)
            
            
           
        }
        
        .padding(.top,50)
    }
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
