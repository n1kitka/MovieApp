//
//  MainMovieCell.swift
//  MoviesApp
//
//  Created by Никита Савенко on 20.12.2023.
//

import UIKit

class MainMovieCell: UITableViewCell {

    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var durationNGenreLabel: UILabel!
    @IBOutlet weak var onMyWatchlistLabel: UILabel!
    
    var movie: Movie!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        movieImageView.layer.cornerRadius = 7
        onMyWatchlistLabel.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupCell(viewModel: MovieTableCellViewModel) {
        self.movieName.text = viewModel.titleWithYear
        self.movieName.layoutIfNeeded()
        self.movieImageView.image = UIImage(named: viewModel.imageName)
        self.durationNGenreLabel.text = "\(viewModel.duration) - \(viewModel.genre)"
        self.onMyWatchlistLabel.isHidden = !viewModel.isOnWatchlist
    }
}
