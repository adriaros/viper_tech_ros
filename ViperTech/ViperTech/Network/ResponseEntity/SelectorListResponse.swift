//
//  SelectorListResponse.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/19/18.
//  Copyright © 2018 adriaros. All rights reserved.
//

import Foundation

struct SelectorListResponse: Codable {
    var resultCount: Int?
    let results: [SelectorResultsList]?
}

struct SelectorResultsList: Codable {
    
//    static func < (lhs: SelectorResultsList, rhs: SelectorResultsList) -> Bool {
//        guard let time1 = lhs.trackTimeMillis else { return false }
//        guard let time2 = rhs.trackTimeMillis else { return false }
//        guard let price1 = lhs.trackPrice else { return false }
//        guard let price2 = rhs.trackPrice else { return false }
//        guard let genre1 = rhs.primaryGenreName else { return false }
//        guard let genre2 = lhs.primaryGenreName else { return false }
//        return time1 < time2 && price1 < price2 && genre1 < genre2
//    }
    
    let wrapperType, kind, artistName, collectionName, trackName, primaryGenreName: String?
    let trackPrice: Float?
    let releaseDate: String?
    let currency: String?
    let artworkUrl100: String?
    let previewUrl: String?
    let trackTimeMillis: Int?
}
