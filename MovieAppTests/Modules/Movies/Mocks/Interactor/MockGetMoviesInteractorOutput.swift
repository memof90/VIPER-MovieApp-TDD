//
//  MockGetMoviesInteractorOutput.swift
//  MovieAppTests
//
//  Created by Memo Figueredo on 31/5/22.
//

import Foundation
@testable import MovieApp

struct GetMoviesInteractorOutputCalls {
    var didRetrieveMovies: Bool = false
     var didGetError: Bool = false
}

class MockGetMoviesInteractorOutput: AnyGetMoviesInteractorOutputProtocol {
    
    lazy var calls = GetMoviesInteractorOutputCalls()
    
    func didRetrieveMovies(_ movies: [Movie]) {
        calls.didRetrieveMovies = true
    }
    
    func didGetError(_ error: CustomError) {
        calls.didGetError = true
    }
}
