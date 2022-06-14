//
//  MoviePresenterTest.swift
//  MovieAppTests
//
//  Created by Memo Figueredo on 13/6/22.
//

import XCTest
@testable import MovieApp

class MoviePresenterTest: XCTestCase {
    
    var sut: MoviesPresenter?
    let interactor = MockGetMoviesInteractorInput()
    let router = MockMoviesRouter()
    let view = MockMoviesPresenterOutput()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        sut = MoviesPresenter()
        sut?.getMoviesInteractor = interactor
        interactor.presenter = sut
        sut?.router = router
        sut?.view = view
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        
        sut?.getMoviesInteractor = nil
        interactor.presenter = nil
        sut?.router = nil
        sut?.view = nil
        sut = nil
    }
    
    func testGetMovies_WhenFindOneMovie_ShouldFindOneMovie() {
        sut?.getMovies()
        XCTAssertTrue(interactor.calls.didExecute)
        XCTAssertEqual(sut?.movies.count, 1)
    }
    
    func testGoToDetail_WhenUserPushView_PushAcivated() {
        
        //        Arrange -> Given
        let movie = Movie(id: 12345, posterPath: nil, name: "Morbius")
        let navController = UINavigationController()
        
        //        Act -> When
        sut?.getToDetail(movie: movie, view: navController)
        
        //        Assert -> Then
        XCTAssertTrue(router.calls.didPresenterDetailMovie)
    }
}
