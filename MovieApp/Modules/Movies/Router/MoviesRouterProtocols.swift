//
//  MoviesRouterProtocols.swift
//  MovieApp
//
//  Created by Memo Figueredo on 18/1/22.
//

import UIKit


protocol AnyMoviesRouterProtocol {
    static func createModule() -> MoviesViewController
    
    func presentDetailMovie(movie: Movie, navController: UINavigationController?)
}
