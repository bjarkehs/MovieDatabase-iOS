//
//  MovieDetailsViewController.swift
//  MovieDatabase
//
//  Created by Bjarke Hesthaven Søndergaard on 11/09/2018.
//  Copyright © 2018 Trifork A/S. All rights reserved.
//

import UIKit

final class MovieDetailsViewController: UIViewController {
    let movie: Movie

    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        // Insert view code
    }
}
