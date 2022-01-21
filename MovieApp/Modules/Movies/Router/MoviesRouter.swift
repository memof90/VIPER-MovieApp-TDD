//
//  MoviesRouter.swift
//  MovieApp
//
//  Created by Memo Figueredo on 18/1/22.
//

import Foundation


final class MoviesRouter: AnyMoviesRouterProtocol {
    
    
    static func createModule() -> MoviesViewController {
        
        typealias ViewProtocols = AnyMoviesViewProtocol & AnyMoviesPresenterOutputProtocol
        typealias PresenterProtocols = AnyMoviesPresenterInputProtocol & AnyGetMoviesInteractorOutputProtocol
        typealias InteractorProtocols = AnyGetMoviesInteractorInputProtocol & AnyMoviesRepositoryOutputProtocol
        
        let view: ViewProtocols = MoviesViewController()
        var presenter: PresenterProtocols = MoviesPresenter()
        var interactor: InteractorProtocols = GetMoviesInteractor()
        var repository: AnyMoviesRepositoryInputProtocol = MoviesRepository()
        let router: AnyMoviesRouterProtocol = MoviesRouter()
//        MARK: - NetWork
        let remoteDataSource: AnyPopularMoviesServiceProtocol = PopularMoviesService()
        
        view.presenter = presenter
        presenter.view = view
        presenter.getMoviesInteractor = interactor
        presenter.router = router
        interactor.presenter  = presenter
        interactor.repository = repository
        repository.interactor = interactor
        repository.remoteDataSource = remoteDataSource
        
        
        return view as! MoviesViewController
    }
    
    
}
