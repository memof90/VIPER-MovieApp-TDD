//
//  DetailMovieViewController.swift
//  MovieApp
//
//  Created by Memo Figueredo on 29/4/22.
//

import UIKit

final class DetailMovieViewController: UIViewController, AnyDetailMovieViewProtocol {
    
    var presenter: AnyDetailMoviePresenterInputProtocol?
    private var detailMovieView = DetailMovieView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        presenter?.getDetailMovie()
        DispatchQueue.main.async { [weak self] in
            self?.showLoading()
        }
    }
    
    private func configureView() {
        view = detailMovieView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
}

extension DetailMovieViewController: DetailMoviePresenterOutputProtocol {
    
    func didRetrieveDetailMovie() {
        hideLoading()
        
        guard let detailMovie = presenter?.detailMovie else { return }
        
        title = detailMovie.title
        
        detailMovieView.configure(detailMovie: detailMovie)
    }
    
    func didGetError(_ error: CustomError) {
        hideLoading()
    }
}
