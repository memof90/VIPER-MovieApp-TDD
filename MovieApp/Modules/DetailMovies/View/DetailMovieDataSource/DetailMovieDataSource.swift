//
//  DetailMovieDataSource.swift
//  MovieApp
//
//  Created by Memo Figueredo on 20/5/22.
//

import UIKit

final class DetailMovieDataSource: NSObject {
    
    private enum Constants {
        static let numberOfRows: Int = 1
    }
    
    private var data: DetailMovie?
    private  var sections: [DetailMovieTableViewSections] = []
    
    override init() {}
    
    func configure(data: DetailMovie) {
        self.data = data
        getSections()
    }
    
    private func getSections() {
        sections.append(.image)
        
        if let summary = data?.summary,
           let releaseDate = data?.releaseDate,
           let status = data?.status {
            
            if !summary.isEmpty {
                sections.append(.summary)
            }
            
            if !releaseDate.isEmpty {
                sections.append(.releaseDate)
            }
            
            if !status.isEmpty {
                sections.append(.status)
            }
        }
    }
}

extension DetailMovieDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Constants.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return sectionsCellForRowAt(indexPath, tableView: tableView)
    }
}

extension DetailMovieDataSource: UITableViewDelegate {
    
    private func sectionsCellForRowAt(_ indexPath: IndexPath,
                                      tableView: UITableView) -> UITableViewCell {
        
        guard let data = data else {
            return UITableViewCell()
        }
        
        let section = sections[indexPath.section]
        let text: String
        
        switch section {
        case .image:
            let image = data.image!
            return configureDetailImageViewCell(tableView, indexpath: indexPath, image: image)
        case .summary:
            text = data.summary!
        case .releaseDate:
            text = data.releaseDate
        case .status:
            text = data.status
        }
        return configureDetailInfoViewCell(tableView, indexPath: indexPath, title: section.titleHeader, text: text)
    }
    
    private func configureDetailImageViewCell(_ tableView: UITableView,
                                              indexpath: IndexPath,
                                              image: String) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: DetailImageViewCell.reuseIdentifier) as! DetailImageViewCell
        
        cell.configure(data: image)
        return cell
    }
    
    private func configureDetailInfoViewCell(_ tableView: UITableView,
                                             indexPath: IndexPath,
                                             title: String,
                                             text: String) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailInfoViewCell.reuseIdentifier) as! DetailInfoViewCell
        
        cell.configure(title: title, text: text)
        return cell
    }
}
