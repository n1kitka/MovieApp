//
//  DetailMoviesViewModel.swift
//  MoviesApp
//
//  Created by Никита Савенко on 23.12.2023.
//

import Foundation

class DetailMoviesViewModel {
    
    let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var title: String {
        return movie.title
    }
    
    var id: UUID {
        return movie.id
    }
    
    var releasedDate: String {
        return movie.releasedDate
    }

    var duration: String {
        return movie.duration
    }
    
    var rating: Double {
        return movie.rating
    }

    var genre: String {
        return movie.genre
    }

    var imageName: String {
        return movie.imageName
    }
    
    var description: String {
        return movie.description
    }
    
    var trailerLinkUrl: URL? {
        return movie.trailerLinkUrl
    }

    var isOnWatchlist: Bool {
        return WatchlistManager.shared.isMovieOnWatchlist(movie.id)
    }
}
