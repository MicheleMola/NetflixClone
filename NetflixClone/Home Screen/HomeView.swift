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
  
  let titles: [SectionName] = [.preview, .popular, .hot, .comedy, .italianComedy]
  
  let topBarView = TopBarView()
    
  var movies: [Movie] = [] {
    didSet {
      collectionView.reloadData()
    }
  }
  
  var topBarYPosition: CGFloat = 0 {
    didSet {
      self.animateTopBar()
    }
  }
  
  var didSelectMovie: ((Movie, String) -> ())?
  
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
    
    self.collectionView.delegate = self
    
    self.collectionView.register(HeaderReusableView.self,
                                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                 withReuseIdentifier: HeaderReusableView.reusableID)
    
    self.collectionView.register(HomeCell.self,
                                 forCellWithReuseIdentifier: HomeCell.reusableID)
    
    self.addSubview(self.collectionView)
    self.addSubview(self.topBarView)
  }
  
  private func style() {
    self.topBarView.clipsToBounds = true
    
    self.topBarView.isHiddenBlurView = true    
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    self.collectionView.frame = self.bounds
    self.collectionView.contentInsetAdjustmentBehavior = .never
    
    self.layout.headerReferenceSize = CGSize(width: self.bounds.width,
                                             height: self.bounds.height * 0.7)
    self.layout.itemSize = CGSize(width: self.bounds.width,
                                  height: 180)
    
    self.layout.sectionInset = UIEdgeInsets(top: 0,
                                            left: 0,
                                            bottom: 16,
                                            right: 0)
    
    self.topBarView.frame = CGRect(x: 0,
                                   y: self.topBarYPosition,
                                   width: self.bounds.width,
                                   height: 80)
  }
  
  func animateTopBar() {
    self.layoutIfNeeded()
    UIView.animate(withDuration: 0.3) { [unowned self] in
      self.topBarView.frame = CGRect(x: 0,
                                     y: self.topBarYPosition,
                                     width: self.bounds.width,
                                     height: 80)
      self.layoutIfNeeded()
    }
  }
  
  func didSelect(_ movie: Movie, heroId: String) {
    didSelectMovie?(movie, heroId)
  }
}

extension HomeView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return self.titles.count
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.reusableID,
                                                        for: indexPath) as? HomeCell else {
      fatalError()
    }
    
    let title = self.titles[indexPath.row]
    
    let shuffledMovies = self.movies.shuffled()
    let section = Section(title: title,
                          movies: shuffledMovies)
    cell.section = section
    
    cell.movieDidSelect = self.didSelect
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
    guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                 withReuseIdentifier: HeaderReusableView.reusableID,
                                                                 for: indexPath) as? HeaderReusableView else {
                                                                  fatalError("Wrong Header class")
    }
    
    let randomMovie = movies.randomElement()
    header.movie = randomMovie
    
    return header
  }

}

extension HomeView: UICollectionViewDelegate {}

extension HomeView: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let translation = scrollView.panGestureRecognizer.translation(in: self)
    
    let offsetY = scrollView.contentOffset.y
    
    self.topBarView.isHiddenBlurView = offsetY < 50 ? true : false
    
    if offsetY <= 0 { return }
    
    self.topBarYPosition = translation.y > 0 || offsetY < 50 ? 0 : -80
  }
}

