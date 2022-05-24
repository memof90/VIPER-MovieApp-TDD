//
//  DetailMoviePresenter.swift
//  MovieApp
//
//  Created by Memo Figueredo on 29/4/22.
//

import Foundation

final class DetailMoviePresenter: AnyDetailMoviePresenterInputProtocol {
    
    var movie: Movie?
    
    var detailMovie: DetailMovie?
    
    weak var view: DetailMoviePresenterOutputProtocol?
    
    var getDetailMovieInteractor: AnyDetailMovieInteractorInputProtocol?
    
    var router: AnyDetailMovieRouterProtocol?
    
    func getDetailMovie() {
        guard let movie = movie else {
            return
        }
        
        getDetailMovieInteractor?.execute(idMovie: movie.id)
    }
    
}

extension DetailMoviePresenter: AnyGetDetailMovieInteractorOutputProtocol {
    
    func didRetriveDetailMovie(_ detailMovie: DetailMovie) {
        self.detailMovie = detailMovie
        DispatchQueue.main.async { [weak self] in
            self?.view?.didRetrieveDetailMovie()
        }
    }
    
    func didGetError(_ error: CustomError) {
        view?.didGetError(error)
    }
}
