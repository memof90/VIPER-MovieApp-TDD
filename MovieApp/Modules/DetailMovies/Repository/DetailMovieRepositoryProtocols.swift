//
//  DetailMovieRepositoryProtocols.swift
//  MovieApp
//
//  Created by Memo Figueredo on 29/4/22.
//

import Foundation

protocol AnyDetailMovieRespositoryInputProtocol {
    
    var remoteDataSource: AnyDetailMoviesServiceProtocol? { get set }
    var interactor: AnyDetailMovieRespositoryOutputProtocol? { get set }
    
    func getDetailMovie(idMovie: Int)
    
}

protocol AnyDetailMovieRespositoryOutputProtocol: AnyObject {
    
    func didRetriveDetailMovie(_ detailMovie: DetailMovie)
    func didGetError(_ error: CustomError)
}
