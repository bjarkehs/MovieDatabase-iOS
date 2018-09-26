//
//  Movie.swift
//  MovieDatabase
//
//  Created by Bjarke Hesthaven Søndergaard on 11/09/2018.
//  Copyright © 2018 Trifork A/S. All rights reserved.
//

struct Movie: Codable {
    let title: String
    let year: Int
    let director: String
    let stars: [String]
    let imageUrl: String
    let description: String
}
