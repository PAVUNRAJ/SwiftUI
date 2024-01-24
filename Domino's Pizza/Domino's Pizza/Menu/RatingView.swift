//
//  RatingView.swift
//  Domino's Pizza
//
//  Created by PavunRaj on 09/01/24.
//
import SwiftUI

struct RatingView: View {
    var rating: Int =  0
    var body: some View {
        HStack {
            ForEach(1...6,id: \.self) { circle in
                Image(systemName: (circle <= rating) ? "fork.knife.circle.fill": "circle")
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView()
    }
}
