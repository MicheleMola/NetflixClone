//
//  SimilarMoviesCell.swift
//  NetflixClone
//
//  Created by Michele Mola on 06/08/2019.
//  Copyright © 2019 Michele Mola. All rights reserved.
//

import UIKit
import PinLayout

class SimilarMoviesCell: UICollectionViewCell {
  
  static let reusableID = "SimilarMoviesCell"
  
  let titleLabel = UILabel()
  
  let collectionView: UICollectionView
  let layout: UICollectionViewFlowLayout
  
  var movies: [Movie]? {
    didSet {
      self.configure()
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
  
  private func setup() {
    self.collectionView.dataSource = self
    
    self.collectionView.register(MovieCell.self,
                                 forCellWithReuseIdentifier: MovieCell.reusableID)
    
    
    self.addSubview(self.titleLabel)
    self.addSubview(self.collectionView)
  }
  
  private func style() {
    self.backgroundColor = .black
    
    self.titleLabel.text = "ALTRI SIMILI"
    self.titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
    self.titleLabel.textColor = .white
    
    self.collectionView.isScrollEnabled = false
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    self.titleLabel.pin
      .left().marginLeft(16)
      .top().marginTop(16)
      .sizeToFit()
    
    self.collectionView.pin
      .top(to: self.titleLabel.edge.bottom).marginTop(8)
      .left()
      .right()
      .height(360)
    
    self.layout.itemSize = CGSize(width: self.bounds.width / 3 - 32,
                                  height: self.bounds.height / 2 - 48)
    self.layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
  }
  
  private func configure() {
    self.collectionView.reloadData()
  }

}

extension SimilarMoviesCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//    return movies?.count ?? 0
    return 6
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reusableID, for: indexPath) as? MovieCell else {
      fatalError()
    }
    
    cell.movie = self.movies?[indexPath.row]
    
    return cell
  }
  
  
}
