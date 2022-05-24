//
//  DetailMovieProtocols.swift
//  MovieApp
//
//  Created by Memo Figueredo on 29/4/22.
//

import Foundation

typealias DetailMovieCompletion = (Result<DetailMovie, CustomError>) -> Void

protocol AnyDetailMoviesServiceProtocol {
    
    func getDetailMovie(idMovie: Int, completion: @escaping DetailMovieCompletion)
}
