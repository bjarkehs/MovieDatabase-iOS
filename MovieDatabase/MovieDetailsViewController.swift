//
//  MovieDetailsViewController.swift
//  MovieDatabase
//
//  Created by Bjarke Hesthaven Søndergaard on 11/09/2018.
//  Copyright © 2018 Trifork A/S. All rights reserved.
//

import UIKit

final class MovieDetailsViewController: UIViewController {
    private lazy var movieHeader: MovieHeaderView = {
        let view = MovieHeaderView()
        view.delegate = self
        return view
    }()
    
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
        
        self.title = movie.title
        
        view.backgroundColor = .white
        
        view.addSubview(movieHeader)
        movieHeader.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(70)
        }
        // Insert view code
    }
}

extension MovieDetailsViewController: MovieHeaderViewDelegate {
    func headerView(_ headerView: MovieHeaderView, didPressMovieWithId id: Int) {
        print(id)
    }
}
