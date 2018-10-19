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
    let wrapperType, kind, artistName, collectionName, trackName, primaryGenreName: String?
    let trackPrice: Float?
    let releaseDate: String?
    let currency: String?
    let artworkUrl100: String?
    let previewUrl: String?
    let trackTimeMillis: Int?
}
