//
//  MoviesPresenter.swift
//  MovieApp
//
//  Created by Memo Figueredo on 18/1/22.
//

import Foundation


final class MoviesPresenter: AnyMoviesPresenterInputProtocol {
   
   weak var view: AnyMoviesPresenterOutputProtocol?
    
    var router: AnyMoviesRouterProtocol?
    
    var getMoviesInteractor: AnyGetMoviesInteractorInputProtocol?
    
    
}

extension MoviesPresenter: AnyGetMoviesInteractorOutputProtocol {
    
}
