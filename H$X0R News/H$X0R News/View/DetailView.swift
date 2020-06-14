//
//  DetailView.swift
//  H$X0R News
//
//  Created by SAMUEL SAMPENE AMPOFO on 14/06/2020.
//  Copyright © 2020 Neos Innovations. All rights reserved.
//

import SwiftUI
import WebKit
struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}


