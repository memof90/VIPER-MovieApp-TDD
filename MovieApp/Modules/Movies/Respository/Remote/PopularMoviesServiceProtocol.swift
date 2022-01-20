//
//  PopularMoviesServiceProtocol.swift
//  MovieApp
//
//  Created by Memo Figueredo on 20/1/22.
//

import Foundation



typealias PopularMoviesCompletion = (Result<PopularMovies, CustomError>) -> Void

protocol AnyPopularMoviesServiceProtocol {
    func getPopularMovies(completion: @escaping PopularMoviesCompletion)
}
