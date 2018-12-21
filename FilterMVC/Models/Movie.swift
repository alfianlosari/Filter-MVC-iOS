//
//  Movie.swift
//  FilterMVC
//
//  Created by Alfian Losari on 12/21/18.
//  Copyright © 2018 Alfian Losari. All rights reserved.
//

import Foundation

struct Movie {
    
    let title: String
    let genre: String
    let duration: TimeInterval
    let rating: Float
    
}

extension Movie {
    
    static var defaultMovies: [Movie] = [
        Movie(title: "A Man Called Ahok", genre: "drama", duration: 7200, rating: 5.0),
        Movie(title: "Aquaman", genre: "action", duration: 10800, rating: 4.0),
        Movie(title: "Batman v Superman", genre: "action", duration: 7200, rating: 2.0),
        Movie(title: "Bohemian Rhapsody", genre: "drama", duration: 10800, rating: 5.0),
        Movie(title: "Forrest Gump", genre: "comedy", duration: 7200, rating: 5.0),
        Movie(title: "La La Land", genre: "drama", duration: 10800, rating: 5.0),
        Movie(title: "Seven Samurai", genre: "action", duration: 3600, rating: 3.0),
        Movie(title: "The Godfather", genre: "drama", duration: 10800, rating: 5.0),
        Movie(title: "The Godfather Part II", genre: "drama", duration: 7200, rating: 5.0),
        Movie(title: "The Wolf of Wall Street", genre: "comedy", duration: 3600, rating: 5.0),
        Movie(title: "50 Shades of Grey", genre: "drama", duration: 7200, rating: 1.0),
        Movie(title: "Taken", genre: "drama", duration: 3600, rating: 2.0),
        Movie(title: "2011: A Space Oddysey", genre: "drama", duration: 10800, rating: 5.0)
    ]
    
}

extension Array where Element == Movie {
    
    func filter(with moviesFilter: [MovieFilter]) -> [Element] {
        if moviesFilter.isEmpty { return self }
        
        return self.filter() { (movie) -> Bool in
            return moviesFilter.first { (filter) -> Bool in
                switch filter {
                    
                case .genre(let code, _):
                    return movie.genre == code
                    
                    
                case .duration(let duration, _):
                    return movie.duration == duration
                    
                    
                case .rating(let value, _):
                    return movie.rating == value
                    
                }
                } != nil
        }
    }
    
}
