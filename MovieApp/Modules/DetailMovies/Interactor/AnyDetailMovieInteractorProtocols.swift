//
//  AnyDetailMovieInteractorProtocols.swift
//  MovieApp
//
//  Created by Memo Figueredo on 29/4/22.
//

import Foundation

protocol AnyDetailMovieInteractorInputProtocol {
    
    var repository: AnyDetailMovieRespositoryInputProtocol? { get set }
    var presenter: AnyGetDetailMovieInteractorOutputProtocol? { get set }
    
    func execute(idMovie: Int)
}

protocol AnyGetDetailMovieInteractorOutputProtocol: AnyObject {
    func didRetriveDetailMovie(_ detailMovie: DetailMovie)
    func didGetError(_ error: CustomError)
}


