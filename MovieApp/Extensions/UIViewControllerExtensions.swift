//
//  UIViewControllerExtensions.swift
//  MovieApp
//
//  Created by Memo Figueredo on 28/4/22.
//

import UIKit

extension UIViewController {
    
    func setNavigationBarColor() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.tintColor = .red
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
    }
}
