//
//  ViewController.swift
//  MovieDatabase
//
//  Created by Bjarke Hesthaven Søndergaard on 11/09/2018.
//  Copyright © 2018 Trifork A/S. All rights reserved.
//

import UIKit
import SnapKit

final class MovieListViewController: UIViewController {
    private lazy var movieTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.text = "Fetching movie..."
        return label
    }()
    
    private lazy var firstMovieButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("See details for the first movie", for: .normal)
        button.addTarget(self, action: #selector(didPressSeeDetails(_:)), for: .touchUpInside)
        button.isEnabled = DataManager.shared.movies.isEmpty == false
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    var movies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//        view.addSubview(movieTitle)
//        movieTitle.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
//            make.leading.trailing.equalToSuperview().inset(32)
//        }
//
//        view.addSubview(firstMovieButton)
//        firstMovieButton.snp.makeConstraints { make in
//            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(50)
//            make.centerX.equalToSuperview()
//        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        DataManager.shared.refreshMovies { [weak self] success in
            guard success else {
                return
            }
            DispatchQueue.main.async {
                guard let strongSelf = self else {
                    return
                }
                
                strongSelf.movies = DataManager.shared.movies
                strongSelf.collectionView.reloadData()
//                strongSelf.movieTitle.text = DataManager.shared.movies.first?.title
//                strongSelf.firstMovieButton.isEnabled = DataManager.shared.movies.isEmpty == false
            }
        }
    }
    
    @objc private func didPressSeeDetails(_ sender: UIButton) {
        guard let movie = DataManager.shared.movies.first else {
            return
        }
        let detailsViewController = MovieDetailsViewController(movie: movie)
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }

}

extension MovieListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 60)
    }
}

extension MovieListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        let movie = self.movies[indexPath.item]
        
        if let movieCell = cell as? MovieCell {
            movieCell.configure(with: movie)
        }
        
        return cell
    }
}















