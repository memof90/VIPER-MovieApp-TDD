//
//  DetailMoviePresenterProtocols.swift
//  MovieApp
//
//  Created by Memo Figueredo on 29/4/22.
//

import Foundation

protocol AnyDetailMoviePresenterInputProtocol {
    
    var movie: Movie? { get set }
    var detailMovie: DetailMovie? { get set }
    var view: DetailMoviePresenterOutputProtocol? { get set }
    var getDetailMovieInteractor: AnyDetailMovieInteractorInputProtocol? { get set }
    
//     MARK: - ROUTER
    var router: AnyDetailMovieRouterProtocol? { get set }
    
    func getDetailMovie()
}

protocol DetailMoviePresenterOutputProtocol: AnyObject {
    func didRetrieveDetailMovie()
    func didGetError(_ error: CustomError)
}
