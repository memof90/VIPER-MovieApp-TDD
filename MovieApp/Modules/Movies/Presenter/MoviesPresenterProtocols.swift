//
//  MoviesPresenterProtocols.swift
//  MovieApp
//
//  Created by Memo Figueredo on 18/1/22.
//

import UIKit


protocol AnyMoviesPresenterInputProtocol {
    var view: AnyMoviesPresenterOutputProtocol? { get set }
    var router: AnyMoviesRouterProtocol? { get set }
    var getMoviesInteractor: AnyGetMoviesInteractorInputProtocol? { get set }
    var movies: [Movie] { get set }
    var moviesFiltered: [Movie] { get set }
    
    func getMovies()
    func getToDetail(movie: Movie, view: UINavigationController?)
}

protocol AnyMoviesPresenterOutputProtocol: AnyObject {
   func didRetrieveMovies()
    func didGetError(_ message: String)
    func endRefresh()
}
