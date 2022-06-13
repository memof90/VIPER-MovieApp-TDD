//
//  GetMoviesInteractorTest.swift
//  MovieAppTests
//
//  Created by Memo Figueredo on 31/5/22.
//

import XCTest
@testable import MovieApp

class GetMoviesInteractorTest: XCTestCase {
    
    var sut: GetMoviesInteractor?
    var repository = MockMoviesRepositoryInput()
    var presenter = MockGetMoviesInteractorOutput()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        sut = GetMoviesInteractor()
        sut?.repository = repository
        repository.remoteDataSource = MockPopularMoviesService()
        repository.interactor = sut
        sut?.presenter = presenter
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        
        sut?.repository = nil
        repository.interactor = nil
        sut?.presenter = nil
        sut = nil
    }

    
    func testGetPopularMovies_WhenFetchingPopularMovies_ShouldFindMovies() {

//        Arrange -> Given
        let expectation = self.expectation(description: "Fetching Movies")
        
//        Act -> When
        sut?.repository?.getPopularMovies()
        DispatchQueue.main.async {
            expectation.fulfill()
        }
//        Assert -> Then
        XCTAssertTrue(repository.calls.didRetrievePopularMovies)
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(presenter.calls.didRetrieveMovies)
        XCTAssertNotNil(repository.calls.popularMovies)
        
    }

}
