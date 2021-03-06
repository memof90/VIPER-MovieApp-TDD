//
//  MoviesViewCell.swift
//  MovieApp
//
//  Created by Memo Figueredo on 21/1/22.
//

import Foundation
import UIKit


final class MoviesViewCell: UICollectionViewCell {
    
//    MARK: - Image
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        posterImageViewConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Pass data into cell
    func configure(data: Movie) {
//        Save the image to api
        guard let posterPath = data.posterPath else {return}
//        Load image to api and show to user
        let completeUrl = String(format: Path.basePathFormat, Path.baseImageUrl, posterPath)
//        load image to user
        posterImageView.downloadImage(from: completeUrl)
 
    }
    
    
//    MARK: - Image Layout Constrainst
    private func posterImageViewConstraints() {
        contentView.addSubview(posterImageView)
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            posterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
