//
//  MoviesPresenter.swift
//  MovieApp
//
//  Created by Memo Figueredo on 18/1/22.
//

import Foundation


final class MoviesPresenter: AnyMoviesPresenterInputProtocol {
    
    var movies: [Movie] = []
    
    var moviesFiltered: [Movie] = []
    
    weak var view: AnyMoviesPresenterOutputProtocol?
    
    var router: AnyMoviesRouterProtocol?
    
    var getMoviesInteractor: AnyGetMoviesInteractorInputProtocol?
    
    func getMovies() {
        getMoviesInteractor?.execute()
    }
    
    
}

extension MoviesPresenter: AnyGetMoviesInteractorOutputProtocol {
    func didRetrieveMovies(_ movies: [Movie]) {
        self.movies = movies
        DispatchQueue.main.async { [weak self] in
            self?.view?.endRefresh()
            self?.view?.didRetrieveMovies()
        }
        movies.forEach { (moviess) in
//            if let userMail = moviess.name {
//                print(userMail)
//            }
            print(moviess.name)
        }
       
    }
    
    func didGetError(_ error: CustomError) {
        
    }
    
    
}
