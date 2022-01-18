//
//  UICollectionViewExtensions.swift
//  MovieApp
//
//  Created by Memo Figueredo on 18/1/22.
//

import Foundation
import UIKit

// MARK: - Implementing refresh and handle errors

extension UICollectionView {
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .white
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont.systemFont(ofSize: 16)
        messageLabel.sizeToFit()
        backgroundView = messageLabel
    }
}
