//
//  InfoView.swift
//  PavunrajCard
//
//  Created by PavunRaj on 29/12/23.
//

import Foundation
import SwiftUI

struct InfoView: View {
    var imageName: String
    var contactTxt: String
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(height: 50)
            .foregroundColor(.white)
            .overlay {
                
                HStack {
                    Image(systemName: imageName)
                        .foregroundColor(.green)
                    Text(contactTxt)
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                }
                
            }
            .padding(.all)
    }
}

struct InfoContentView:PreviewProvider {
    static var previews: some View {
        InfoView(imageName: "phone.fill", contactTxt: "Hello")
            .previewLayout(.sizeThatFits)
    }
}
