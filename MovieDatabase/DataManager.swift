//
//  DataManager.swift
//  MovieDatabase
//
//  Created by Bjarke Hesthaven Søndergaard on 11/09/2018.
//  Copyright © 2018 Trifork A/S. All rights reserved.
//

import Foundation

class DataManager {
    static let shared: DataManager = .init()
    var moviesTask: URLSessionDataTask?
    var actorsTask: URLSessionDataTask?
    
    private(set) var movies: [Movie] = []
    private(set) var actors: [Actor] = []

    func refreshMovies(completionHandler: @escaping (Bool) -> Void) {
        let session = URLSession(configuration: .ephemeral)
        let url = URL(string: "https://yink.dk/ios-course-movies/movies")!
        
        self.moviesTask?.cancel()
        let task = session.dataTask(with: url) { [weak self] data, response, error in
            guard let response = response as? HTTPURLResponse else {
                completionHandler(false)
                return
            }
            
            guard let data = data else {
                completionHandler(false)
                return
            }
            
            switch response.statusCode {
            case 200:
                do {
                    if let strongSelf = self {
                        let movies = try JSONDecoder().decode([Movie].self, from: data)
                        strongSelf.movies = movies
                    }
                    completionHandler(true)
                } catch {
                    completionHandler(false)
                }
            default:
                completionHandler(false)
            }
        }
        
        self.moviesTask = task
        task.resume()
    }
    
    func refreshActors(completionHandler: @escaping (Bool) -> Void) {
        let session = URLSession(configuration: .ephemeral)
        let url = URL(string: "https://yink.dk/ios-course-movies/actors")!
        
        self.actorsTask?.cancel()
        let task = session.dataTask(with: url) { [weak self] data, response, error in
            guard let response = response as? HTTPURLResponse else {
                completionHandler(false)
                return
            }
            
            guard let data = data else {
                completionHandler(false)
                return
            }
            
            switch response.statusCode {
            case 200:
                do {
                    if let strongSelf = self {
                        let actors = try JSONDecoder().decode([Actor].self, from: data)
                        strongSelf.actors = actors
                    }
                    completionHandler(true)
                } catch {
                    completionHandler(false)
                }
            default:
                completionHandler(false)
            }
        }
        
        self.actorsTask = task
        task.resume()
    }
}
