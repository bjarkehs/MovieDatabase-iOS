//
//  MovieHeaderView.swift
//  MovieDatabase
//
//  Created by Bjarke Hesthaven Søndergaard on 12/09/2018.
//  Copyright © 2018 Trifork A/S. All rights reserved.
//

import UIKit

protocol MovieHeaderViewDelegate: AnyObject {
    func headerView(_ headerView: MovieHeaderView, didPressMovieWithId id: Int)
}

final class MovieHeaderView: UIView {
    weak var delegate: MovieHeaderViewDelegate?

    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Hello", for: .normal)
        button.addTarget(self, action: #selector(didPressButton(_:)), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        addSubview(button)
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc private func didPressButton(_ sender: UIButton) {
        self.delegate?.headerView(self, didPressMovieWithId: 1)
    }
}
