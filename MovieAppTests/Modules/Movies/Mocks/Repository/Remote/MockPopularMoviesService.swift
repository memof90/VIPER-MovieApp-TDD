//
//  MockPopularMoviesService.swift
//  MovieAppTests
//
//  Created by Memo Figueredo on 24/5/22.
//

import Foundation
@testable import MovieApp

struct PopularMoviesServiceCalls {
    var didGetPopularMovies: Bool = false
}

class MockPopularMoviesService: BaseService, AnyPopularMoviesServiceProtocol {
        
    lazy var calls = PopularMoviesServiceCalls()
    
    func getPopularMovies(completion: @escaping PopularMoviesCompletion) {
        calls.didGetPopularMovies = true
        sendRequestMock(url: "", of: PopularMovies.self, method: .get, completion: completion)
    }
    
}
