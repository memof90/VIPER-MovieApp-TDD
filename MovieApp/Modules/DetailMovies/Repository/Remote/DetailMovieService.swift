//
//  DetailMovieService.swift
//  MovieApp
//
//  Created by Memo Figueredo on 29/4/22.
//

import Foundation

final class DetailMovieService: BaseService, AnyDetailMoviesServiceProtocol {
    
    private enum Constants {
        static let getDetailMoviePath: String = "movie/%d?api_key=%@"
    }
    
    func getDetailMovie(idMovie: Int, completion: @escaping DetailMovieCompletion) {
        
        let getDetailMoviePath = String(format: Constants.getDetailMoviePath, Path.apiKey)
        let finalPath = String(format: Path.basePathFormat, Path.baseUrl, getDetailMoviePath)
        
        sendRequest(url: finalPath, of: DetailMovie.self, method: .get, completion: completion)
    }
}
