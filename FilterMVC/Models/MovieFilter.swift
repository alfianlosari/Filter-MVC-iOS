//
//  MovieFilter.swift
//  FilterMVC
//
//  Created by Alfian Losari on 12/21/18.
//  Copyright © 2018 Alfian Losari. All rights reserved.
//

import Foundation

enum MovieFilter: Hashable {
    
    case genre(code: String, name: String)
    case duration(duration: TimeInterval, name: String)
    case rating(value: Float, name: String)
    
    var hashValue: Int {
        
        switch self {
        case .genre(let code, let name):
            return "\(code)-\(name)".hashValue
            
        case .rating(let value, let name):
            return "\(value)-\(name)".hashValue
            
        case .duration(let duration, let name):
            return "\(duration)-\(name)".hashValue
            
        }
    }
    
}

extension MovieFilter {
    
    static var defaultFilters:[(title: String, filters: [MovieFilter])] = [
        ("Genre", [
            .genre(code: "action", name: "Action"),
            .genre(code: "drama", name: "Drama"),
            .genre(code: "comedy", name: "Comedy")
            ]),
        ("Rating", [
            .rating(value: 5.0, name: "⭐️⭐️⭐️⭐️⭐️"),
            .rating(value: 4.0, name: "⭐️⭐️⭐️⭐️"),
            .rating(value: 3.0, name: "⭐️⭐️⭐️"),
            .rating(value: 2.0, name: "⭐️⭐️"),
            .rating(value: 1.0, name: "⭐️")
            ]),
        ("Duration", [
            .duration(duration: 3600, name: "1 Hrs"),
            .duration(duration: 7200, name: "2 Hrs"),
            .duration(duration: 10800, name: "3 Hrs")
            ])
    ]
    
}

extension Array where Element == MovieFilter {
    
    var genreFilters: [Element] {
        return filter {
            if case .genre(_) = $0 {
                return true
            } else {
                return false
            }
        }
    }
    
    var ratingFilters: [Element] {
        return filter {
            if case .rating(_) = $0 {
                return true
            } else {
                return false
            }
        }

    }
    
    var durationFilters: [Element] {
        return filter {
            if case .duration(_) = $0 {
                return true
            } else {
                return false
            }
        }
    }
    
    
}
