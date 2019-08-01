//
//  MovieCell.swift
//  NetflixClone
//
//  Created by Michele Mola on 01/08/2019.
//  Copyright © 2019 Michele Mola. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
  
  static let reusableID = "MovieCell"
  
  let posterImageView = UIImageView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.setup()
    self.style()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setup() {
    self.contentView.addSubview(posterImageView)
  }
  
  func style() {
    self.posterImageView.backgroundColor = .red
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    let imageWidth: CGFloat = 80
    self.posterImageView.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
    self.posterImageView.layer.cornerRadius = imageWidth / 2
  }
}
