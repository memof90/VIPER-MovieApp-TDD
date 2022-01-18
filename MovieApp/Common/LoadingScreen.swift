//
//  LoadingScreen.swift
//  MovieApp
//
//  Created by Memo Figueredo on 18/1/22.
//

import Foundation
import UIKit

// MARK: - Added loading screen to both modules 

fileprivate var containerLoading: UIView?

extension UIViewController {
    
//     MARK: - func to show loading
    func showLoading() {
        containerLoading = UIView(frame: view.bounds)
        guard let containerLoading = containerLoading else {
            return
        }
        
        containerLoading.backgroundColor = .lightGray
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = containerLoading.center
        activityIndicator.startAnimating()
        containerLoading.addSubview(activityIndicator)
        view.addSubview(containerLoading)
    }
    
//    MARK: Func to hide loading
    func hideLoading() {
        containerLoading?.removeFromSuperview()
        containerLoading = nil
    }
    
}
