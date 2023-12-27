//
//  MainMoviesViewController.swift
//  MoviesApp
//
//  Created by Никита Савенко on 20.12.2023.
//

import UIKit

class MainMoviesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
        
    lazy var viewModel: MainMoviesViewModel = {
        MainMoviesViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self

        self.title = "Movies"
        
        let cellNib = UINib(nibName: "MainMovieCell", bundle: .main)
        tableView.register(cellNib, forCellReuseIdentifier: "MovieCell")

        viewModel.fetchMovies()
        setupSortButton()
        tableView.reloadData()
        
        NotificationCenter.default.addObserver(self, selector: #selector(notificationReceived), name: Notification.Name("addToWatchlistTapped"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
    }
    
    func setupSortButton() {
        let sortButton = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(sortButtonTapped))
        sortButton.tintColor = .black
        navigationItem.rightBarButtonItem = sortButton
    }
    
    @objc func sortButtonTapped() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        let alphabeticalAction = UIAlertAction(title: "Title", style: .default) { [weak self] _ in
            self?.viewModel.sortMoviesAlphabetically()
            self?.tableView.reloadData()
        }
        
        let releaseDateAction = UIAlertAction(title: "Release Date", style: .default) { [weak self] _ in
            self?.viewModel.sortMoviesByReleaseDate()
            self?.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(alphabeticalAction)
        alertController.addAction(releaseDateAction)
        alertController.addAction(cancelAction)

        if let popoverController = alertController.popoverPresentationController {
            popoverController.barButtonItem = navigationItem.rightBarButtonItem
        }

        present(alertController, animated: true, completion: nil)
    }

    
    
    @objc func notificationReceived(_ notification: Notification) {
        guard let movieId = notification.object as? UUID else { return }

        if let index = viewModel.movieCellViewModels.firstIndex(where: { $0.movie.id == movieId }) {
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath) as? MainMovieCell {
                let isOnWatchlist = WatchlistManager.shared.isMovieOnWatchlist(movieId)
                cell.onMyWatchlistLabel.isHidden = !isOnWatchlist
            }
        }
    }

    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension MainMoviesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movieCellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MainMovieCell
        let movieViewModel = viewModel.movieCellViewModels[indexPath.row]
        cell.setupCell(viewModel: movieViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedViewModel = viewModel.movieCellViewModels[indexPath.row]
        let detailViewModel = DetailMoviesViewModel(movie: selectedViewModel.movie)
        let detailViewController = DetailMovieViewController(viewModel: detailViewModel)
        navigationController?.pushViewController(detailViewController, animated: true)
    }


    
}
