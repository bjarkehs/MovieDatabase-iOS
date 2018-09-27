//
//  DataManager.swift
//  MovieDatabase
//
//  Created by Bjarke Hesthaven Søndergaard on 11/09/2018.
//  Copyright © 2018 Trifork A/S. All rights reserved.
//

import Foundation

class DataHelper {
    var moviesTask: URLSessionDataTask?
    
//    private(set) var movies: [Movie] = []

    func fetchMovies(completionHandler: @escaping ([Movie]?) -> Void) {
        let session = URLSession(configuration: .ephemeral)
        let url = URL(string: "https://yink.dk/ios-course-movies/movies")!
        
        self.moviesTask?.cancel()
        let task = session.dataTask(with: url) { data, response, _ in
            guard let response = response as? HTTPURLResponse else {
                completionHandler(nil)
                return
            }
            
            guard let data = data else {
                completionHandler(nil)
                return
            }
            
            switch response.statusCode {
            case 200:
                do {
                    let movies = try JSONDecoder().decode([Movie].self, from: data)
                    completionHandler(movies)
                } catch {
                    completionHandler(nil)
                }
            default:
                completionHandler(nil)
            }
        }
        
        self.moviesTask = task
        task.resume()
    }
}
