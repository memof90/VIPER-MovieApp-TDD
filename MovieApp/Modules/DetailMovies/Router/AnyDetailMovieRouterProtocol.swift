//
//  AnyDetailMovieRouter.swift
//  MovieApp
//
//  Created by Memo Figueredo on 29/4/22.
//

import Foundation

protocol AnyDetailMovieRouterProtocol {
    static func createModule(movie: Movie) -> DetailMovieViewController
}
