//
//  ContentView.swift
//  SamuelCard
//
//  Created by SAMUEL SAMPENE AMPOFO on 12/06/2020.
//  Copyright © 2020 Neos Innovations. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red: 0.09, green: 0.63, blue: 0.52)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("samuelAmpofo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
                
                Text("Samuel S. Ampofo")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                Text("Ios Developer")
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                    .foregroundColor(Color.white)
                Divider()
                infoView(text: "+31 6470 81 775", imageName: "phone.fill")
                infoView(text: "samuelsampene.ampofo@gmail.com", imageName: "envelope.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


