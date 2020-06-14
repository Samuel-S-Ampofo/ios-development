//
//  ContentView.swift
//  H$X0R News
//
//  Created by SAMUEL SAMPENE AMPOFO on 14/06/2020.
//  Copyright © 2020 Neos Innovations. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts){ post in
                NavigationLink(destination: DetailView(url:post.url)){
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                    
                }
            }
            .navigationBarTitle("H$XOR NEWS")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//let post = [
//    Post(id:"1", title:"Hello"),
//    Post(id:"2", title:"Bonjour"),
//    Post(id:"3", title:"Hola")
//]
