//
//  CustomError.swift
//  MovieApp
//
//  Created by Memo Figueredo on 18/1/22.
//

import Foundation


enum CustomError: Error {
    case badUrl
    case responseError
    case unableToParse
    case noInternetConnection
}
