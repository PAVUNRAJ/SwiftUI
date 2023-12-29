//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by PavunRaj on 29/12/23.
//

import SwiftUI

struct ContentView: View {
    @State var leftSideDice =  1
    @State var rightSideDice = 1
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("diceeLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding()
                Spacer()
                
                HStack {
                    ExtractedView(n: leftSideDice)
                    ExtractedView(n: rightSideDice)
                    
                }
                .padding(.horizontal)
                Spacer()
                Button {
                    self.leftSideDice = Int.random(in: 1...6)
                    self.rightSideDice = Int.random(in: 1...6)
                } label: {
                    Text("Roll")
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .font(Font.system(size: 40))
                        .padding(.horizontal)
                    
                }
                .background(Color.red)
                Spacer()
                
                
            }
            .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExtractedView: View {
    var n: Int
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1,contentMode: .fit)
            .padding()
    }
}
