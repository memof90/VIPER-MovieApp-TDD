//
//  AnyDetailMovieInteractor.swift
//  MovieApp
//
//  Created by Memo Figueredo on 29/4/22.
//

import Foundation

final class GetDeatilMovieInteractor: AnyDetailMovieInteractorInputProtocol {
    
    var repository: AnyDetailMovieRespositoryInputProtocol?
    
    var presenter: AnyGetDetailMovieInteractorOutputProtocol?
    
    func execute(idMovie: Int) {
        repository?.getDetailMovie(idMovie: idMovie)
    }
}

extension GetDeatilMovieInteractor: AnyDetailMovieRespositoryOutputProtocol {
    
    func didRetriveDetailMovie(_ detailMovie: DetailMovie) {
        presenter?.didRetriveDetailMovie(detailMovie)
    }
    
    func didGetError(_ error: CustomError) {
        presenter?.didGetError(error)
    }
    
    
}
