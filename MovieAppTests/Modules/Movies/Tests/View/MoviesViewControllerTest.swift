//
//  MoviesViewControllerTest.swift
//  MovieAppTests
//
//  Created by Memo Figueredo on 14/6/22.
//

import XCTest
@testable import MovieApp

class MoviesViewControllerTest: XCTestCase {
    
    var sut: MoviesViewController?
    let presenter = MockMoviesPresenterInput()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        sut = MoviesViewController()
        sut?.presenter = presenter
        presenter.view = sut
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        sut?.presenter = nil
        presenter.view = nil
        sut = nil
    }

    func testValidNameView_WhenNameLoad_ShouldNameProvided() {
        sut?.loadViewIfNeeded()
        XCTAssertEqual(sut?.title, "Movies")
    }
    
    func testViewDidLoad_WhenViewDidLoad_ShouldLoadedViewDidLoad() {
//        When
        sut?.loadViewIfNeeded()
//        Then
        XCTAssertTrue(presenter.calls.didGetMovies)
    }


}
