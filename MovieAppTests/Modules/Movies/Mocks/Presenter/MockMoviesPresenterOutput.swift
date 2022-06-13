//
//  MockMoviesPresenterOutput.swift
//  MovieAppTests
//
//  Created by Memo Figueredo on 13/6/22.
//

import UIKit
@testable import MovieApp

struct MoviesPresenterOutputCalls {
    var didRetrieveMovies: Bool = false
    var didGetError: Bool = false
    var didEndRefresh: Bool = false
}

class MockMoviesPresenterOutput: AnyMoviesPresenterOutputProtocol {
    
    lazy var calls = MoviesPresenterOutputCalls()
    
    func didRetrieveMovies() {
        calls.didRetrieveMovies = true
    }
    
    func didGetError(_ message: String) {
        calls.didGetError = true
    }
    
    func endRefresh() {
        calls.didEndRefresh = true
    }
}
