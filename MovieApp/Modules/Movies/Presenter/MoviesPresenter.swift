//
//  MoviesPresenter.swift
//  MovieApp
//
//  Created by Memo Figueredo on 18/1/22.
//

import UIKit


final class MoviesPresenter: AnyMoviesPresenterInputProtocol {
    
    private enum Constants {
        enum ErrorMessage {
            static let notInternetMessage: String = "Oops, please check your internet connection."
            static let defaultMessage: String = "An error has occured, please retry."
            static let emptyMessage: String = ""
            static let badRequest: String = "OoPs the data not load in this moment, please retry."
            static let badRespose: String = "Oops the app not working in this moment, retry more last."
        }
    }

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
        var message: String = Constants.ErrorMessage.emptyMessage
        
        switch error {
        case .badUrl:
            message = Constants.ErrorMessage.badRequest
        case .responseError:
            message = Constants.ErrorMessage.badRespose
        case .noInternetConnection:
            message = Constants.ErrorMessage.notInternetMessage
        default:
            message = Constants.ErrorMessage.defaultMessage
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.view?.endRefresh()
            self?.view?.didGetError(message)
        }
    }
}
