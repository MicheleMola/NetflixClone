//
//  HomeCell.swift
//  NetflixClone
//
//  Created by Michele Mola on 01/08/2019.
//  Copyright © 2019 Michele Mola. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell {
  
  static let reusableID = "HomeCell"
  
  let collectionView: UICollectionView
  let layout: UICollectionViewFlowLayout
  
  let sectionTitle = UILabel()
  
  var section: Section? {
    didSet {
      self.configure()
    }
  }
  
  override init(frame: CGRect) {
    self.layout = UICollectionViewFlowLayout()
    self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    super.init(frame: frame)
    
    self.setup()
    self.style()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setup() {
    self.collectionView.dataSource = self
    
    self.collectionView.register(PreviewMovieCell.self, forCellWithReuseIdentifier: PreviewMovieCell.reusableID)
    
    self.collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reusableID)
    
    self.contentView.addSubview(sectionTitle)
    self.contentView.addSubview(collectionView)
  }
  
  func style() {
    self.layout.scrollDirection = .horizontal
    
    self.sectionTitle.textColor = .white
    self.sectionTitle.font = UIFont.boldSystemFont(ofSize: 14)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
  
    self.sectionTitle.frame.origin = CGPoint(x: 16, y: 8)
    
    self.collectionView.frame = CGRect(x: 0, y: 32, width: self.bounds.width, height: self.bounds.height - 24)
    
    self.layout.itemSize = CGSize(width: self.bounds.width / 4, height: self.bounds.width / 4)
    self.layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
  }
  
  func configure() {
    self.sectionTitle.text = self.section?.title.rawValue
    self.sectionTitle.sizeToFit()
    
    self.collectionView.reloadData()
  }
}

extension HomeCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.section?.movies.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    guard let section = self.section else { fatalError() }
    
    switch section.title {
    case .preview:
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PreviewMovieCell.reusableID, for: indexPath) as? PreviewMovieCell else {
        fatalError()
      }
      
      cell.movie = self.section?.movies[indexPath.row]
      
      return cell
    default:
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reusableID, for: indexPath) as? MovieCell else {
        fatalError()
      }
      
      cell.movie = self.section?.movies[indexPath.row]
      
      return cell
    }
  }
}
