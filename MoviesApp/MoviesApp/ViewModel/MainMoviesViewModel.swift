//
//  MainMoviesViewModel.swift
//  MoviesApp
//
//  Created by Никита Савенко on 20.12.2023.
//

import Foundation
import UIKit

class MainMoviesViewModel {
    
    var movieCellViewModels: [MovieTableCellViewModel] = []
    
    func fetchMovies() {
        let movies = [
            Movie(id: UUID(), title: "Tenet", description: "Armed with only one word, Tenet, and fighting for the survival of the entire world, a Protagonist journeys through a twilight world of international espionage on a mission that will unfold in something beyond real time.", rating: 7.8, duration: "2h 30 min", genre: "Action, Sci-Fi", releasedDate: "3 September 2020", trailerLink: "https://www.youtube.com/watch?v=LdOM0x0XDMo", imageName: "Tenet"),
            Movie(id: UUID(), title: "Spider-Man: Into the Spider-Verse", description: "Teen Miles Morales becomes the Spider-Man of his universe, and must join with five spider-powered individuals from other dimensions to stop a threat for all realities.", rating: 8.4, duration: "1h 57min", genre: "Action, Animation, Adventure", releasedDate: "14 December 2018", trailerLink: "​​https://www.youtube.com/watch?v=tg52up16eq0", imageName: "Spider Man"),
            Movie(id: UUID(), title: "Knives Out", description: "A detective investigates the death of a patriarch of an eccentric, combative family.", rating: 7.9, duration: "2h 10min", genre: "Comedy, Crime, Drama", releasedDate: "27 November 2019", trailerLink: "​​https://www.youtube.com/watch?v=qGqiHJTsRkQ", imageName: "Knives Out"),
            Movie(id: UUID(), title: "Guardians of the Galaxy", description: "A group of intergalactic criminals must pull together to stop a fanatical warrior with plans to purge the universe.", rating: 8.0, duration: "2h 1min", genre: "Action, Adventure, Comedy", releasedDate: "1 August 2014", trailerLink: "​​https://www.youtube.com/watch?v=d96cjJhvlMA", imageName: "Guardians of The Galaxy"),
            Movie(id: UUID(), title: "Avengers: Age of Ultron", description: "When Tony Stark and Bruce Banner try to jump-start a dormant peacekeeping program called Ultron, things go horribly wrong and it's up to Earth's mightiest heroes to stop the villainous Ultron from enacting his terrible plan.", rating: 7.3, duration: "2h 21min", genre: "Action, Adventure, Sci-Fi", releasedDate: "1 May 2015", trailerLink: "​​https://www.youtube.com/watch?v=tmeOjFno6Do", imageName: "Avengers")
        ]
        
        movieCellViewModels = movies.map { MovieTableCellViewModel(movie: $0) }
        
    }
    
    func sortMoviesAlphabetically() {
        movieCellViewModels.sort { $0.movie.title < $1.movie.title }
    }
    
    func sortMoviesByReleaseDate() {
        movieCellViewModels.sort { $0.movie.releasedDate < $1.movie.releasedDate }
    }
}

