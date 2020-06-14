//
//  ContentView.swift
//  I Am Richer
//
//  Created by SAMUEL SAMPENE AMPOFO on 12/06/2020.
//  Copyright © 2020 Neos Innovations. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(.systemTeal)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("I Am Richer!")
                .font(.system(size: 40))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            Image("diamond")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200, alignment: .center)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
