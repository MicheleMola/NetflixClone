//
//  MovieCell.swift
//  NetflixClone
//
//  Created by Michele Mola on 01/08/2019.
//  Copyright © 2019 Michele Mola. All rights reserved.
//

import UIKit
import Kingfisher

class MovieCell: UICollectionViewCell {
  
  static let reusableID = "MovieCell"
  
  let posterImageView = UIImageView()
  
  var movie: Movie? {
    didSet {
      self.configure()
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.setup()
    self.style()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setup() {
    self.contentView.addSubview(self.posterImageView)
  }
  
  func style() {
    self.posterImageView.contentMode = .scaleAspectFill
    self.posterImageView.clipsToBounds = true
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    self.posterImageView.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
  }
  
  func configure() {
    guard let movie = self.movie else { return }
    let movieViewModel = MovieViewModel(movie: movie)
    
    self.posterImageView.kf.setImage(with: movieViewModel.imageURL)
  }
}
