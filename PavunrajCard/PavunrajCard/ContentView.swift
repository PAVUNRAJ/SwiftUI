//
//  ContentView.swift
//  PavunrajCard
//
//  Created by PavunRaj on 29/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.09, green: 0.63, blue: 0.52)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("mani")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200,height: 200)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(.white, lineWidth: 5)
                    )
                    
                Text("Manikandan")
                    .foregroundColor(.white)
                    .font(Font.custom("Pacifico-Regular", size: 35))
                Text("Full stack developer")
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                Divider()
                InfoView(imageName: "phone.fill", contactTxt: "+91 9715853480")
                InfoView(imageName: "envelope.fill", contactTxt: "manikandandev@gmail.com")
                
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

