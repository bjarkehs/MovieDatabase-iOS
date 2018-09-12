//
//  MovieCell.swift
//  MovieDatabase
//
//  Created by Bjarke Hesthaven Søndergaard on 12/09/2018.
//  Copyright © 2018 Trifork A/S. All rights reserved.
//

import UIKit

final class MovieCell: UICollectionViewCell {
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.commonInit()
    }
    
    private func commonInit() {
        self.contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configure(with movie: Movie) {
        self.titleLabel.text = movie.title
    }
}














