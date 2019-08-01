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
      collectionView.reloadData()
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
    
    self.collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reusableID)
    
    self.contentView.addSubview(sectionTitle)
    self.contentView.addSubview(collectionView)
  }
  
  func style() {
    self.layout.scrollDirection = .horizontal
    
    self.sectionTitle.text = "Anteprime"
    self.sectionTitle.textColor = .white
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
  
    self.sectionTitle.frame.origin = CGPoint(x: 16, y: 8)
    self.sectionTitle.sizeToFit()
  }
}

extension HomeCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.section?.movies.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return UICollectionViewCell()
  }
  
  
}
