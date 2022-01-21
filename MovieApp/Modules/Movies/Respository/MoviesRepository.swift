//
//  MoviesRepository.swift
//  MovieApp
//
//  Created by Memo Figueredo on 18/1/22.
//

import Foundation


final class MoviesRepository: AnyMoviesRepositoryInputProtocol {
    var remoteDataSource: AnyPopularMoviesServiceProtocol?
    weak var interactor: AnyMoviesRepositoryOutputProtocol?
    
    func getPopularMovies() {
        remoteDataSource?.getPopularMovies(completion: { result  in
            switch result {
            case .success(let popularMovies):
                self.interactor?.didRetrivePopularMovies(popularMovies)
            case .failure(let error):
                self.interactor?.didGetError(error)
            }
        })
    }
    
    
}
