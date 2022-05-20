//
//  DetailMovieViewController.swift
//  MovieApp
//
//  Created by Memo Figueredo on 29/4/22.
//

import UIKit

final class DetailMovieViewController: UIViewController, AnyDetailMovieViewProtocol {
    
    var presenter: AnyDetailMoviePresenterInputProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension DetailMovieViewController: DetailMoviePresenterOutputProtocol {
    
    func didRetrieveDetailMovie() {
        
    }
    
    func didGetError(_ error: CustomError) {
        
    }
    
}
