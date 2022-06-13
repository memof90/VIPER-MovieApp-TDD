//
//  MockMoviesRouter.swift
//  MovieAppTests
//
//  Created by Memo Figueredo on 13/6/22.
//

import UIKit
@testable import MovieApp

struct MoviesRouterCalls {
    var didPresenterDetailMovie: Bool = false
}

class MockMoviesRouter: AnyMoviesRouterProtocol {

    lazy var calls = MoviesRouterCalls()
    
    static func createModule() -> MoviesViewController {
        return MoviesViewController()
    }
    
    func presentDetailMovie(movie: Movie, navController: UINavigationController?) {
        calls.didPresenterDetailMovie = true
    }
}
