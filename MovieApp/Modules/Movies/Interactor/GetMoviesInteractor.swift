//
//  GetMoviesInteractor.swift
//  MovieApp
//
//  Created by Memo Figueredo on 18/1/22.
//

import Foundation


final class GetMoviesInteractor: AnyGetMoviesInteractorInputProtocol {
    var repository: AnyMoviesRepositoryInputProtocol?
    
 
    
    weak var presenter: AnyGetMoviesInteractorOutputProtocol?
    
    
}


extension GetMoviesInteractor: AnyMoviesRepositoryOutputProtocol {
    
}
