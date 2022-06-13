//
//  MockGetMoviesInteractorInput.swift
//  MovieAppTests
//
//  Created by Memo Figueredo on 31/5/22.
//

import Foundation
@testable import MovieApp

struct GetMoviesIntercatorInputCalls {
    var didExecute: Bool = false
}

class MockGetMoviesInteractorInput: AnyGetMoviesInteractorInputProtocol {
    
    var repository: AnyMoviesRepositoryInputProtocol?
    
    var presenter: AnyGetMoviesInteractorOutputProtocol?
    
    lazy var calls = GetMoviesIntercatorInputCalls()
    
    func execute() {
        calls.didExecute = true
        
        let movies = [
            Movie(id: 12345, posterPath: nil, name: "Hello")
        ]
        
        presenter?.didRetrieveMovies(movies)
    }
    
    
}
