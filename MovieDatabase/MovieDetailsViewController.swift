//
//  MovieDetailsViewController.swift
//  MovieDatabase
//
//  Created by Bjarke Hesthaven Søndergaard on 11/09/2018.
//  Copyright © 2018 Trifork A/S. All rights reserved.
//

import UIKit

final class MovieDetailsViewController: UIViewController {
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = movie?.title
        
        view.backgroundColor = .white
    }
}
