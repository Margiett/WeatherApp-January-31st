//
//  PictureHitsModel.swift
//  WeatherApp January 31st
//
//  Created by Margiett Gil on 1/31/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation

struct PictureHits: Codable {
    let hits: [Picture]
}
struct Picture: Codable {
    let largeImageURL: String
}

