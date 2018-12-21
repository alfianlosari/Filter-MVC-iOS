//
//  ContainerViewController.swift
//  FilterMVC
//
//  Created by Alfian Losari on 12/21/18.
//  Copyright © 2018 Alfian Losari. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    @IBOutlet weak var filterListContainerView: UIView!
    @IBOutlet weak var movieListContainerView: UIView!
    
    var filterListVC: FilterListViewController!
    var movieListVC: MovieListViewController!
    
    let movies = Movie.defaultMovies
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildViewControllers()
    }
    
    private func setupChildViewControllers() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let filterListVC = storyboard.instantiateViewController(withIdentifier: "FilterListViewController") as! FilterListViewController
        addChild(childController: filterListVC, to: filterListContainerView)
        self.filterListVC = filterListVC
        self.filterListVC.delegate = self
        
        let movieListVC = storyboard.instantiateViewController(withIdentifier: "MovieListViewController") as! MovieListViewController
        movieListVC.movies = movies
        addChild(childController: movieListVC, to: movieListContainerView)
        self.movieListVC = movieListVC
    }
    
    @IBAction func clearFilterTapped(_ sender: Any) {
        filterListVC.clearFilter()
    }
    
    private func filterMovies(moviesFilter: [MovieFilter]) {
        movieListVC.movies = movies
            .filter(with: moviesFilter.genreFilters)
            .filter(with: moviesFilter.ratingFilters)
            .filter(with: moviesFilter.durationFilters)
        
        movieListVC.tableView.reloadData()
    }

}

extension ContainerViewController: FilterListViewControllerDelegate {

    func filterListViewController(_ controller: FilterListViewController, didSelect filter: MovieFilter) {
        filterMovies(moviesFilter: Array(controller.selectedFilters))
    }
    
    func filterListViewController(_ controller: FilterListViewController, didDeselect filter: MovieFilter) {
        filterMovies(moviesFilter: Array(controller.selectedFilters))
    }
    
    func filterListViewControllerDidClearFilters(controller: FilterListViewController) {
        movieListVC.movies = Movie.defaultMovies
        movieListVC.tableView.reloadData()
    }
    
}


