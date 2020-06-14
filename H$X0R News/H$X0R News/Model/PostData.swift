//
//  PostData.swift
//  H$X0R News
//
//  Created by SAMUEL SAMPENE AMPOFO on 14/06/2020.
//  Copyright © 2020 Neos Innovations. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
