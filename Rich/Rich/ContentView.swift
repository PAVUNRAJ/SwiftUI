//
//  ContentView.swift
//  Rich
//
//  Created by PavunRaj on 29/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.systemTeal)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Hi am rich")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                    .padding(30)
                Image("diamond")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        // sudo xcodebuild -license
    }
}
