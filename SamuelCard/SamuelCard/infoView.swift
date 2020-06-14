//
//  infoView.swift
//  SamuelCard
//
//  Created by SAMUEL SAMPENE AMPOFO on 12/06/2020.
//  Copyright © 2020 Neos Innovations. All rights reserved.
//

import SwiftUI
struct infoView: View {
    let text: String
    let imageName: String
    var body: some View {
        RoundedRectangle(cornerRadius: 35)
            .frame( height: 50.0)
            .foregroundColor(Color.white)
            .overlay( HStack{
                Image(systemName:imageName).foregroundColor(.green)
                Text(text)
                    .foregroundColor(Color("Info-Color"))
            })
            .padding(.all)
    }
}


struct infoView_Previews: PreviewProvider {
    static var previews: some View {
        infoView(text: "Hello", imageName: "phone.fill")
    }
}
