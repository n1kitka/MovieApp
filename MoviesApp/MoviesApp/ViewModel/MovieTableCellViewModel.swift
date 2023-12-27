//
//  MovieTableCellViewModel.swift
//  MoviesApp
//
//  Created by Никита Савенко on 21.12.2023.
//

import Foundation

class MovieTableCellViewModel {
    
    let movie: Movie

    var titleWithYear: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM yyyy"
        if let date = dateFormatter.date(from: movie.releasedDate) {
            dateFormatter.dateFormat = "yyyy"
            let year = dateFormatter.string(from: date)
            return "\(movie.title) (\(year))"
        } else {
            return movie.title
        }
    }

    var duration: String {
        return movie.duration
    }

    var genre: String {
        return movie.genre
    }

    var imageName: String {
        return movie.imageName
    }

    var isOnWatchlist: Bool {
        return WatchlistManager.shared.isMovieOnWatchlist(movie.id)
    }

    init(movie: Movie) {
        self.movie = movie
    }
}

