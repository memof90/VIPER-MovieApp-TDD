//
//  MockMoviesRepositoryOutput.swift
//  MovieAppTests
//
//  Created by Memo Figueredo on 24/5/22.
//

import Foundation
@testable import MovieApp

struct MovieRepositoryOutputCalls {
    
    var didRetrievePopularMovies: Bool = false
    var didGetError: Bool = false
}

class MockMoviesRepositoryOutput: AnyMoviesRepositoryOutputProtocol {
    
    lazy var calls = MovieRepositoryOutputCalls()
    
    func didRetrivePopularMovies(_ movies: PopularMovies) {
        calls.didRetrievePopularMovies = true
    }
    
    func didGetError(_ error: CustomError) {
        calls.didGetError = true
    }
}
