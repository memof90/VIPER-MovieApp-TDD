//
//  DetailMovieTableViewSections.swift
//  MovieApp
//
//  Created by Memo Figueredo on 20/5/22.
//

import Foundation

enum DetailMovieTableViewSections: CaseIterable {
    
    case summary
    case image
    case releaseDate
    case status
    
    var titleHeader: String {
        switch self {
        case .summary:
            return "Summary:"
        case .releaseDate:
            return "Release date"
        case .status:
            return "Status"
        default:
            return ""
        }
    }
}
