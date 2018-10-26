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
            static let weather_url = "https://opendata.aemet.es/opendata/api/prediccion/especifica/municipio/horaria/08019/?api_key="
        }
        struct Service {
            struct Selector {
                static let type = "track"
            }
        }
        struct Key {
            static let api_key = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlcG91dmlsbGFudWV2YUBnbWFpbC5jb20iLCJqdGkiOiI4MTVhZTJmMS0wYjJkLTQxNmMtOWFlYy00ZDA5OTBmYTdhMzUiLCJpc3MiOiJBRU1FVCIsImlhdCI6MTUzNzg5OTcwOCwidXNlcklkIjoiODE1YWUyZjEtMGIyZC00MTZjLTlhZWMtNGQwOTkwZmE3YTM1Iiwicm9sZSI6IiJ9.LLB4xXFS0u_8gyMIMMBRObhCyfzw0Nlr7RhFyvmpTWU"
        }
    }
    
    struct Cells {
        struct Selector {
            static let currency = "$"
        }
    }
    
    struct Errors {
        struct Interns {
            static let vc_instance = "Couldn’t instantiate view controller with identifier "
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
