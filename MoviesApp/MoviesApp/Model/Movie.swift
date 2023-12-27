//
//  Movie.swift
//  MoviesApp
//
//  Created by Никита Савенко on 20.12.2023.
//

import Foundation

struct Movie {
    let id: UUID
    let title: String
    let description: String
    let rating: Double
    let duration: String
    let genre: String
    let releasedDate: String
    let trailerLink : String
    var trailerLinkUrl: URL? {
        return URL(string: trailerLink)
    }
    let imageName: String
}
