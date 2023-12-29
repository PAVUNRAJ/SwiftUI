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
                CustomText(text: "Hi am rich")
                CustomText(text: "Hi am rich1")
                CustomText(text: "Hi am rich2")
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

struct CustomText: View {
    var text: String
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .fontWeight(.bold)
            .font(.system(size: 25))
            .padding(3)
    }
}
