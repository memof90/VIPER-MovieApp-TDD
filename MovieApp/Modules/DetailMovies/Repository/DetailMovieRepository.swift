//
//  DetailMovieRepository.swift
//  MovieApp
//
//  Created by Memo Figueredo on 29/4/22.
//

import Foundation

final class DetailMovieRepository: AnyDetailMovieRespositoryInputProtocol {
    
    var remoteDataSource: AnyDetailMoviesServiceProtocol?
    
    var interactor: AnyDetailMovieRespositoryOutputProtocol?
    
    func getDetailMovie(idMovie: Int) {
        remoteDataSource?.getDetailMovie(idMovie: idMovie) { result in
            
            switch result {
            case .success(let detailMovie):
                self.interactor?.didRetriveDetailMovie(detailMovie)
            case .failure(let error):
                self.interactor?.didGetError(error)
            }
        }
    }
}
