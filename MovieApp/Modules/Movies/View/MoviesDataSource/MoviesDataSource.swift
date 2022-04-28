//
//  MoviesDataSource.swift
//  MovieApp
//
//  Created by Memo Figueredo on 21/1/22.
//

import Foundation
import UIKit


final class MoviesDataSource: NSObject {
    
    private var movies: [Movie] = []
    weak var delegate: AnyMoviesViewDelegate?
    
    override init() {}
    
//    MARK: - Functions
    
//    MARK: - Function to pass data into protocols collectionView
    
    func configure(movies: [Movie], delegate: AnyMoviesViewDelegate) {
        self.movies = movies
        self.delegate = delegate
    }
    
}

// MARK: - UICollectionViewDataSource

extension MoviesDataSource: UICollectionViewDataSource {
//    MARK: - Number of items in CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
//    MARK: - View to cell to saw into CollectionView
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return configureMovieCell(collectionView: collectionView, indexPath: indexPath)
    }
    
    
//     MARK: - Function that pass data into cellForItemAt
    private func configureMovieCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesViewCell.reuseIdentifier, for: indexPath) as? MoviesViewCell else {
            return UICollectionViewCell()
        }
//        MARK: - Return data to cell of user can View
        cell.configure(data: movies[indexPath.row])
        
        return cell
    }
    
    
}

// MARK: - UICollectionViewDelegate
extension MoviesDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
