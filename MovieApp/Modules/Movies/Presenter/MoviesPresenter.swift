//
//  MoviesPresenter.swift
//  MovieApp
//
//  Created by Memo Figueredo on 18/1/22.
//

import UIKit


final class MoviesPresenter: AnyMoviesPresenterInputProtocol {

    var movies: [Movie] = []
    
    var moviesFiltered: [Movie] = []
    
    weak var view: AnyMoviesPresenterOutputProtocol?
    
    var router: AnyMoviesRouterProtocol?
    
    var getMoviesInteractor: AnyGetMoviesInteractorInputProtocol?
    
    func getMovies() {
        getMoviesInteractor?.execute()
    }
    
    func getToDetail(movie: Movie, view: UINavigationController?) {
        router?.presentDetailMovie(movie: movie, navController: view)
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
