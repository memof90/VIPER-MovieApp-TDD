//
//  GetMoviesInteractorProtocols.swift
//  MovieApp
//
//  Created by Memo Figueredo on 18/1/22.
//

import Foundation

typealias MoviesCompletion = (Result<[Movie], CustomError>) -> Void

protocol AnyGetMoviesInteractorInputProtocol {
    var repository: AnyMoviesRepositoryInputProtocol? { get set}
    var presenter: AnyGetMoviesInteractorOutputProtocol? { get set }
    
    
    func execute()
}


protocol AnyGetMoviesInteractorOutputProtocol: AnyObject {
    func didRetrieveMovies(_ movies: [Movie])
    func didGetError(_ error: CustomError)
}
