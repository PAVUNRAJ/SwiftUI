//
//  ContentView.swift
//  Networking-SwiftUI
//
//  Created by PavunRaj on 29/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    init() {

           UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "red") ?? .black]
       
           }
    var body: some View {
        ZStack {
            Color(.systemGray5)
                .ignoresSafeArea(.all)
            
            NavigationView {
                List(networkManager.posts, rowContent: { post in
                    NavigationLink {
                        DetailView(url: post.url)
                    } label: {
                        HStack {
                            Text("\(post.points)")
                            Text(post.title)
                                .padding(.horizontal)
                        }
                    }

                    
                })
                
                .navigationTitle("News Feed")
                .foregroundColor(.blue)
              
                .onAppear{
                    networkManager.fetchData()
                }
                
            }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


