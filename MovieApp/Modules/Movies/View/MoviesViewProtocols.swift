//
//  MoviesViewProtocols.swift
//  MovieApp
//
//  Created by Memo Figueredo on 18/1/22.
//

import Foundation

protocol AnyMoviesViewProtocol: AnyObject {
    var presenter: AnyMoviesPresenterInputProtocol? { get set }
}

protocol MoviesViewDelegate: AnyObject {
    func showDetail(of movie: Movie)
    func refresh()
}
