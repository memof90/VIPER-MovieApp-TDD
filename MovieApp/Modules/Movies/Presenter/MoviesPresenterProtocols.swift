//
//  MoviesPresenterProtocols.swift
//  MovieApp
//
//  Created by Memo Figueredo on 18/1/22.
//

import Foundation


protocol AnyMoviesPresenterInputProtocol {
    var view: AnyMoviesPresenterOutputProtocol? { get set }
    var router: AnyMoviesRouterProtocol? { get set }
    var getMoviesInteractor: AnyGetMoviesInteractorInputProtocol? { get set }
    var movies: [Movie] { get set }
    
    func getMovies()
}

protocol AnyMoviesPresenterOutputProtocol: AnyObject {
   func didRetrieveMovies()
    func didGetError(_ message: String)
    func endRefresh()
}
