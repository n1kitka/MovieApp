//
//  DetailMovieViewController.swift
//  MoviesApp
//
//  Created by Никита Савенко on 23.12.2023.
//

import UIKit

class DetailMovieViewController: UIViewController {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var addToWatchlistBtn: UIButton!
    @IBOutlet weak var watchTrailerBtn: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releasedDateLabel: UILabel!
    
    var viewModel: DetailMoviesViewModel
    
    init(viewModel: DetailMoviesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DetailMovieViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never

        configView()
        updateButtonText()
    }
    
    func configView() {
        movieImageView.layer.cornerRadius = 7
        movieImageView.image = UIImage(named: viewModel.imageName)
        nameLabel.text = viewModel.title
        rankLabel.text = "\(viewModel.rating)/10"
        descriptionLabel.text = viewModel.description
        genreLabel.text = viewModel.genre
        releasedDateLabel.text = viewModel.releasedDate
        addToWatchlistBtn.addTarget(self, action: #selector(addToWatchlist), for: .touchUpInside)
        addToWatchlistBtn.buttonBorderColor(borderColor: .clear)
        watchTrailerBtn.addTarget(self, action: #selector(watchTrailer), for: .touchUpInside)
        watchTrailerBtn.buttonBorderColor()
    }
    
    private func updateButtonText() {
        addToWatchlistBtn.setTitle(viewModel.isOnWatchlist ? "REMOVE FROM WATCHLIST" : "ADD TO WATCHLIST", for: .normal)
    }

    @objc func addToWatchlist() {
        let updatedState = !viewModel.isOnWatchlist

        if updatedState {
            WatchlistManager.shared.addToWatchlist(viewModel.id)
        } else {
            WatchlistManager.shared.removeFromWatchlist(viewModel.id)
        }

        addToWatchlistBtn.setTitle(updatedState ? "REMOVE FROM WATCHLIST" : "ADD TO WATCHLIST", for: .normal)
        NotificationCenter.default.post(name: NSNotification.Name("addToWatchlistTapped"), object: viewModel.id)
    }
    
    @objc func watchTrailer() {
        
        guard let trailerLink = viewModel.trailerLinkUrl else {
            return
        }
        
        UIApplication.shared.open(trailerLink)
    }

}

