//
//  MoviesRepositoryProtocols.swift
//  MovieApp
//
//  Created by Memo Figueredo on 18/1/22.
//

import Foundation


protocol AnyMoviesRepositoryInputProtocol {
    var interactor: AnyMoviesRepositoryOutputProtocol? { get set }
}


protocol AnyMoviesRepositoryOutputProtocol: AnyObject {
    
}
