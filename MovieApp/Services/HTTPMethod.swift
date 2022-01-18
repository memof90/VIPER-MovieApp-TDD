//
//  HTTPMethod.swift
//  MovieApp
//
//  Created by Memo Figueredo on 18/1/22.
//

import Foundation


enum HTTPMethod: String {
    case get = "GET"
    
    var name: String {
        return rawValue
    }
}
