//
//  MoviesViewController.swift
//  MovieApp
//
//  Created by Memo Figueredo on 18/1/22.
//

import Foundation
import UIKit

final class MoviesViewController: UIViewController, AnyMoviesViewProtocol {
  
    private enum Constants {
        static let title: String = "Movies"
        static let emtyTitle: String = ""
        static let searchHint: String = "Tap to find"
    }
    
    var presenter: AnyMoviesPresenterInputProtocol?
    private var moviesView = MoviesView()
    private let searchController = UISearchController(searchResultsController: nil)
    
 
//    MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        
        presenter?.getMovies()
        
        DispatchQueue.main.async { [weak self] in
            
            self?.showLoading()
        }
        
    }
    
    
//     MARK: - ViewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = Constants.title
    }
    
    
//    MARK: - ViewDidDisappear
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        title = Constants.emtyTitle
    }
    
    
//    MARK: - ConfigureView
    private func configureView(){
        setNavigationBarColor()
        configureSearchBar()
        view = moviesView
        title = Constants.title
        moviesView.delegate = self
    }
}


// MARK: - SearchController

extension MoviesViewController: UISearchResultsUpdating {
  
    private func configureSearchBar() {
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = Constants.searchHint
        searchController.searchBar.barStyle = .black
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        
        guard var presenter = presenter else { return }
        
        presenter.moviesFiltered = presenter.movies.filter { (movie: Movie) -> Bool  in
            return movie.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    private var isSearchBarEmpty: Bool {
        
        if let search = searchController.searchBar.text?.isEmpty {
            return search
        } else {
            return true
        }
    }
    
    private var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let presenter = presenter else { return }
        
        let searchBar = searchController.searchBar
        
        if let searchText = searchBar.text {
            filterContentForSearchText(searchText)
        }
        
        let movies = isFiltering ? presenter.moviesFiltered : presenter.movies
        moviesView.configure(movies: movies, delegate: self)
    }
}
        

    
// MARK: -  Outputs
extension MoviesViewController: AnyMoviesPresenterOutputProtocol {
  
    func didRetrieveMovies() {
        
        hideLoading()
        guard let movies = presenter?.movies else { return }
        
        moviesView.configure(movies: movies, delegate: self)
        
    }
    
    func didGetError(_ message: String) {
        
        hideLoading()
        moviesView.setErrorScreen(message: message)
    }
    
    func endRefresh() {
        
        moviesView.endRefresh()
    }
}


// MARK: - Delegate to show View detail
extension MoviesViewController: AnyMoviesViewDelegate {
    func showDetail(of movie: Movie) {
        
    }
    
    func refresh() {
        presenter?.getMovies()
    }
}


