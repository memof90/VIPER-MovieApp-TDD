//
//  GetMoviesInteractorProtocols.swift
//  MovieApp
//
//  Created by Memo Figueredo on 18/1/22.
//

import Foundation


protocol AnyGetMoviesInteractorInputProtocol {
    var presenter: AnyGetMoviesInteractorOutputProtocol? { get set }
    var repository: AnyMoviesRepositoryInputProtocol? { get set}
}


protocol AnyGetMoviesInteractorOutputProtocol: AnyObject {
    
}
