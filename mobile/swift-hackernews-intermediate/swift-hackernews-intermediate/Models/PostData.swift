//
//  PostData.swift
//  swift-hackernews-intermediate
//
//  Created by Bojun Jin on 13/03/20.
//  Copyright © 2020 Bojun Jin. All rights reserved.
//

import Foundation


struct Results : Decodable {
    let hits:[Post]
}

struct Post : Decodable, Identifiable {
    var id : String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
