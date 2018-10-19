//
//  Constants.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/19/18.
//  Copyright © 2018 adriaros. All rights reserved.
//

import Foundation

struct Constants {
    
    struct Networking {
        struct Url {
            static let base_url = "https://itunes.apple.com/search?term="
            static let default_search = "michael+jackson"
            static var item_search = ""
        }
    }
    
    struct Cells {
        struct Selector {
            static let currency = "$"
        }
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
