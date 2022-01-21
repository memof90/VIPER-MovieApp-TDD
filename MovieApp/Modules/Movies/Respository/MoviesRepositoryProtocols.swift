//
//  MoviesRepositoryProtocols.swift
//  MovieApp
//
//  Created by Memo Figueredo on 18/1/22.
//

import Foundation


protocol AnyMoviesRepositoryInputProtocol {
    var interactor: AnyMoviesRepositoryOutputProtocol? { get set }
    var remoteDataSource: AnyPopularMoviesServiceProtocol? { get set}
    
    func getPopularMovies()
}


protocol AnyMoviesRepositoryOutputProtocol: AnyObject {
    func didRetrivePopularMovies(_ movies: PopularMovies)
    func didGetError(_ error: CustomError)
}
