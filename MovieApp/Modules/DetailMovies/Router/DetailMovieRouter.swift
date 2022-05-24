//
//  DetailMovieRouter.swift
//  MovieApp
//
//  Created by Memo Figueredo on 29/4/22.
//

import Foundation

final class DetailMovieRouter: AnyDetailMovieRouterProtocol {
    
    static func createModule(movie: Movie) -> DetailMovieViewController {
        
        typealias ViewProtocols = AnyDetailMovieViewProtocol & DetailMoviePresenterOutputProtocol
        typealias PresenterProtocols = AnyDetailMoviePresenterInputProtocol & AnyGetDetailMovieInteractorOutputProtocol
        typealias InteractorProtocols = AnyDetailMovieInteractorInputProtocol & AnyDetailMovieRespositoryOutputProtocol
        
        var view: ViewProtocols = DetailMovieViewController()
        var presenter: PresenterProtocols = DetailMoviePresenter()
        var interactor: InteractorProtocols = GetDeatilMovieInteractor()
        var repository: AnyDetailMovieRespositoryInputProtocol = DetailMovieRepository()
        let router: AnyDetailMovieRouterProtocol = DetailMovieRouter()
        let remoteDataSource: AnyDetailMoviesServiceProtocol = DetailMovieService()
        
        view.presenter = presenter
        presenter.view = view
        presenter.getDetailMovieInteractor = interactor
        presenter.router = router
        presenter.movie = movie
        interactor.presenter = presenter
        interactor.repository = repository
        repository.interactor = interactor
        repository.remoteDataSource = remoteDataSource
        
        return view as! DetailMovieViewController
        
    }
}
