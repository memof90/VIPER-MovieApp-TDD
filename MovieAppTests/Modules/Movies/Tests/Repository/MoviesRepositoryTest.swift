//
//  MoviesRepositoryTest.swift
//  MovieAppTests
//
//  Created by Memo Figueredo on 24/5/22.
//

import XCTest
@testable import MovieApp

class MoviesRepositoryTest: XCTestCase {
    
    var sut: MoviesRepository?
    var remoteDataSource = MockPopularMoviesService()
    var interactor = MockMoviesRepositoryOutput()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        sut = MoviesRepository()
        sut?.interactor = interactor
        sut?.remoteDataSource = remoteDataSource
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try  super.tearDownWithError()
        
        sut?.remoteDataSource = nil
        sut?.remoteDataSource = nil
        sut = nil
    }

    func testGetPorpularMovie_WhenInformationLoad_ServiceSouldMatch() {
        
//       Act and Asser Mock repository 
        sut?.getPopularMovies()
//        Assert
        XCTAssertTrue(interactor.calls.didRetrievePopularMovies)
    }

}
