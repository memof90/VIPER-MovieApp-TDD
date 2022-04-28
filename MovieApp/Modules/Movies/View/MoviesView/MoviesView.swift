//
//  MoviesView.swift
//  MovieApp
//
//  Created by Memo Figueredo on 21/1/22.
//

import Foundation
import UIKit


final class MoviesView: UIView {
    
    private enum Constants {
        enum CollectionView {
            static let margin: UIEdgeInsets = .init(top: 4, left: 4, bottom: -4, right: -4)
            static let heightItem: CGFloat = 150
        }
    }
    
    weak var delegate: AnyMoviesViewDelegate?
    
//    MARK: - Refresh Control to realod tableView and CollectionView
    
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
        refreshControl.tintColor = .white
        return refreshControl
    }()
    
//    MARK: - CollectionView
    private lazy var collectionView: UICollectionView = {
        let layout = CollectionViewHorizontalCustom()
        layout.height = Constants.CollectionView.heightItem
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MoviesViewCell.self, forCellWithReuseIdentifier: MoviesViewCell.reuseIdentifier)
        collectionView.backgroundColor = .black
        collectionView.addSubview(refreshControl)
        return collectionView
    }()
    
//    MARK: DataSource to CollectionViewProtocols
    private lazy var datasource: MoviesDataSource = {
        let dataSource = MoviesDataSource()
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
        return dataSource
    }()
    
//    MARK: - Initializaizers
    init() {
        super.init(frame: CGRect.zero)
        backgroundColor = .black
        collectionViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Functions
    
//     MARK: - OnRefresh pass to MovieViewController
    @objc func onRefresh() {
        delegate?.refresh()
    }
    
    func endRefresh() {
        if refreshControl.isRefreshing {
            refreshControl.endRefreshing()
        }
    }
    
//     MARK: - Refresh Data
    private func refreshData() {
        collectionView.reloadData()
    }
    
//     MARK: - MARK: - Pass data into MovieViewController and reload Collection View Manage collectionView
    func configure(movies: [Movie], delegate: AnyMoviesViewDelegate) {
        datasource.configure(movies: movies, delegate: delegate)
        refreshData()
    }
    
//    MARK: - Put error into screen of the user
    func setErrorScreen(message: String) {
        collectionView.setEmptyMessage(message)
    }
    
//     MARK: - CollectionView Constraints
    private func collectionViewConstraints() {
        addSubview(collectionView)
        let constraints = [
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Constants.CollectionView.margin.top),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Constants.CollectionView.margin.left),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Constants.CollectionView.margin.right),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: Constants.CollectionView.margin.bottom)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
