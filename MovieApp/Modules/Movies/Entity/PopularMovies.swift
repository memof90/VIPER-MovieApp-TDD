//
//  PopularMovies.swift
//  MovieApp
//
//  Created by Memo Figueredo on 18/1/22.
//

import Foundation


struct PopularMovies: Codable {
    let page: Int
    let results: [Movie]
    let totalResults: Int
    let totalPages: Int
    
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}
