//
//  MoviesViewController.swift
//  MovieApp
//
//  Created by Memo Figueredo on 18/1/22.
//

import Foundation
import UIKit



final class MoviesViewController: UIViewController, AnyMoviesViewProtocol {
    
    var presenter: AnyMoviesPresenterInputProtocol?
 

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        presenter?.getMovies()
 

        
    }
 
   
}

extension MoviesViewController: AnyMoviesPresenterOutputProtocol {
  
    
    func didRetrieveMovies() {
        
        
    
    }
    
    func didGetError(_ message: String) {
        
    }
    
    func endRefresh() {
        
    }
    
    
}


