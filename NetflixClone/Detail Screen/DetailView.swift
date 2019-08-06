//
//  DetailView.swift
//  NetflixClone
//
//  Created by Michele Mola on 06/08/2019.
//  Copyright © 2019 Michele Mola. All rights reserved.
//

import UIKit

class DetailView: UIView {
  
  let collectionView: UICollectionView
  let layout: UICollectionViewFlowLayout
  
  let closeButton = UIButton(type: .custom)
  
  var closeButtonDidTap: (() -> ())?
  
  var dismissScreen: (() -> ())?
  
  var movie: Movie? {
    didSet {
      self.configure()
    }
  }
  
  var movies: [Movie]? {
    didSet {
      self.collectionView.reloadData()
    }
  }
  
  var heroId: String? {
    didSet {
      self.collectionView.reloadData()
    }
  }
  
  override init(frame: CGRect) {
    self.layout = UICollectionViewFlowLayout()
    self.collectionView = UICollectionView(frame: .zero,
                                           collectionViewLayout: self.layout)
    super.init(frame: frame)
    
    self.setup()
    self.style()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setup() {
    self.collectionView.alwaysBounceVertical = true
    
    self.collectionView.dataSource = self
    
    self.collectionView.delegate = self
    
    self.collectionView.register(DetailHeaderReusableView.self,
                                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                 withReuseIdentifier: DetailHeaderReusableView.reusableID)
    
    self.collectionView.register(SimilarMoviesCell.self,
                                 forCellWithReuseIdentifier: SimilarMoviesCell.reusableID)
    
    self.addSubview(self.collectionView)
    self.addSubview(self.closeButton)
    
    self.closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    
    self.clipsToBounds = true
  }
  
  func style() {
    self.hero.modifiers = [.whenDismissing(.fade), .useGlobalCoordinateSpace]

    self.closeButton.setTitle("X", for: .normal)
    self.closeButton.backgroundColor = .black
    self.closeButton.layer.cornerRadius = 12.5
    
    self.collectionView.backgroundColor = .clear
    self.collectionView.contentInsetAdjustmentBehavior = .never
  }
  
  func configure() {
    
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    self.collectionView.pin
      .all()
    
    self.layout.headerReferenceSize = CGSize(width: self.bounds.width,
                                             height: self.bounds.height * 0.6)
    
    self.layout.itemSize = CGSize(width: self.bounds.width,
                                  height: self.bounds.height * 0.5)
    
    self.closeButton.pin
      .right().marginRight(20)
      .top().marginTop(40)
      .width(25)
      .height(25)
  }
  
  @objc func closeButtonTapped(_ button: UIButton) {
    self.closeButtonDidTap?()
  }
}

extension DetailView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SimilarMoviesCell.reusableID,
                                                        for: indexPath) as? SimilarMoviesCell else {
                                                          fatalError()
    }
    
    cell.movies = movies
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
    guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                       withReuseIdentifier: DetailHeaderReusableView.reusableID,
                                                                       for: indexPath) as? DetailHeaderReusableView else {
                                                                        fatalError("Wrong Header class")
    }
    
    header.movie = movie
    header.posterImageView.hero.id = heroId
    
    return header
  }
}

extension DetailView: UICollectionViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {    
    let yOffset = scrollView.contentOffset.y
    
    if yOffset < 0 {
      let normalizedValue = abs(yOffset) / 100
      
      self.closeButton.alpha = 1 - normalizedValue
    }
    
    if yOffset < -100 {
      self.dismissScreen?()
    }
  }
}
