//
//  Movie.swift
//  MovieApp
//
//  Created by Memo Figueredo on 18/1/22.
//

import Foundation


struct Movie: Codable {
    let id : Int
    let posterPath: String?
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case posterPath = "poster_path"
        case name = "original_title"
    }
}
