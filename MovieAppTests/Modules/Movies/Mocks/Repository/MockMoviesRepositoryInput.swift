//
//  MockMoviesRepository.swift
//  MovieAppTests
//
//  Created by Memo Figueredo on 24/5/22.
//

import Foundation
@testable import MovieApp

struct MoviesRepositoryInputCalls {
    
    var didRetrievePopularMovies: Bool = false
    var didGetError: Bool = false
    var popularMovies: PopularMovies? = nil
}

class MockMoviesRepositoryInput: AnyMoviesRepositoryInputProtocol {
    
    lazy var calls = MoviesRepositoryInputCalls()
    
    var interactor: AnyMoviesRepositoryOutputProtocol?
    
    var remoteDataSource: AnyPopularMoviesServiceProtocol?
    
    func getPopularMovies() {
        remoteDataSource?.getPopularMovies { result in
            
            switch result {
            case .success(let movies):
                self.calls.didRetrievePopularMovies = true
                self.interactor?.didRetrivePopularMovies(movies)
                self.calls.popularMovies = movies
            case .failure(let error):
                self.calls.didGetError = true
                self.interactor?.didGetError(error)
            }
        }
    }
}
