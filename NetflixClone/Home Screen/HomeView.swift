//
//  HomeView.swift
//  NetflixClone
//
//  Created by Michele Mola on 01/08/2019.
//  Copyright © 2019 Michele Mola. All rights reserved.
//

import UIKit

class HomeView: UIView {
  
  let collectionView: UICollectionView
  let layout: UICollectionViewFlowLayout
  
  var movies: [Movie] = [] {
    didSet {
      collectionView.reloadData()
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
    self.collectionView.alwaysBounceVertical = true
    
    self.collectionView.dataSource = self
    
    self.collectionView.register(HeaderReusableView.self,
                                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                 withReuseIdentifier: HeaderReusableView.reusableID)
    
    self.addSubview(collectionView)
  }
  
  private func style() {
    self.collectionView.backgroundColor = .red
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    self.collectionView.frame = self.bounds
    self.collectionView.contentInsetAdjustmentBehavior = .never
    
    self.layout.headerReferenceSize = CGSize(width: self.bounds.width, height: self.bounds.height * 0.7)
    self.layout.itemSize = CGSize(width: self.bounds.width, height: 150)
  }
  
}

extension HomeView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.movies.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return UICollectionViewCell()
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
    guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                 withReuseIdentifier: HeaderReusableView.reusableID,
                                                                 for: indexPath) as? HeaderReusableView else {
                                                                  fatalError("Wrong Header class")
    }
    
    header.movie = Movie(title: "Lion", posterPath: "lion.jpg")
    
    return header
  }

}
