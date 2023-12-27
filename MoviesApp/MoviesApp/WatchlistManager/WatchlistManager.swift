//
//  WatchlistManager.swift
//  MoviesApp
//
//  Created by Никита Савенко on 27.12.2023.
//

import Foundation

class WatchlistManager {
    
    static let shared = WatchlistManager()

    func isMovieOnWatchlist(_ movieId: UUID) -> Bool {
        return UserDefaults.standard.bool(forKey: "\(movieId)")
    }

    func addToWatchlist(_ movieId: UUID) {
        UserDefaults.standard.set(true, forKey: "\(movieId)")
    }

    func removeFromWatchlist(_ movieId: UUID) {
        UserDefaults.standard.set(false, forKey: "\(movieId)")
    }
}
