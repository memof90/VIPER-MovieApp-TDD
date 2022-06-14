//
//  MockBaseService.swift
//  MovieAppTests
//
//  Created by Memo Figueredo on 24/5/22.
//

import Foundation
@testable import MovieApp

extension BaseService {
    func sendRequestMock<T: Decodable>(url: String, of type: T.Type, method: HTTPMethod, completion: @escaping (Result<T, CustomError>) -> Void) {
        if type is PopularMovies.Type {
            let response = generatePopularMoviesResponse()
            completion(.success( response as! T ))
        }
    }
    
    private func generatePopularMoviesResponse() -> PopularMovies? {
        
        let budle = Bundle(for: MockPopularMoviesService.self)
        guard let model: PopularMovies = FileManager.getJSONObject(from: "PopularMovies", bundle: budle) else { return nil }
        return model
    }
}
