//
//  GetMoviesInteractor.swift
//  MovieApp
//
//  Created by Memo Figueredo on 18/1/22.
//

import Foundation


final class GetMoviesInteractor: AnyGetMoviesInteractorInputProtocol {
    
    var repository: AnyMoviesRepositoryInputProtocol?
    
    weak var presenter: AnyGetMoviesInteractorOutputProtocol?
    
    func execute() {
        repository?.getPopularMovies()
    }
    
    
}


extension GetMoviesInteractor: AnyMoviesRepositoryOutputProtocol {
    func didRetrivePopularMovies(_ popularMovies: PopularMovies) {
        let movieList = popularMovies.results
        presenter?.didRetrieveMovies(movieList)
    }
    
    func didGetError(_ error: CustomError) {
        presenter?.didGetError(error)
    }
    
    
}
