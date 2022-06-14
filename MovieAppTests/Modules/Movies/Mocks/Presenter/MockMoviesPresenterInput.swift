//
//  MockMoviesPresenterInput.swift
//  MovieAppTests
//
//  Created by Memo Figueredo on 13/6/22.
//

import UIKit
@testable import MovieApp

struct MoviesPresenterInputCalls {
    var didGetMovies: Bool = false
    var didGoToDetail: Bool = false
}

class MockMoviesPresenterInput: AnyMoviesPresenterInputProtocol {
    
    var view: AnyMoviesPresenterOutputProtocol?
    
    var router: AnyMoviesRouterProtocol?
    
    var getMoviesInteractor: AnyGetMoviesInteractorInputProtocol?
    
    var movies: [Movie] = []
    
    var moviesFiltered: [Movie] = []
    
    lazy var calls = MoviesPresenterInputCalls()
    
    func getMovies() {
        calls.didGetMovies = true
        movies = [
            Movie(id: 12345, posterPath: nil, name: "Morbius")
        ]
        view?.didRetrieveMovies()
    }
    
    func getToDetail(movie: Movie, view: UINavigationController?) {
        calls.didGoToDetail = true
    }
}
