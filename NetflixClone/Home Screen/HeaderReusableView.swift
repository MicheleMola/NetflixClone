//
//  HeaderReusableView.swift
//  NetflixClone
//
//  Created by Michele Mola on 01/08/2019.
//  Copyright © 2019 Michele Mola. All rights reserved.
//

import UIKit

class HeaderReusableView: UICollectionReusableView {
  
  static let reusableID = "HeaderCell"
  
  let coverImageView = UIImageView()
  let titleLabel = UILabel()
  let addButton = UIButton(type: .contactAdd)
  let playButton = UIButton()
  let infoButton = UIButton(type: .detailDisclosure)
  
  let gradientView = GradientView()
  
  var movie: Movie? {
    didSet {
      configure()
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
  
  private func setup() {
    self.addSubview(coverImageView)
    
    self.coverImageView.addSubview(gradientView)
    self.gradientView.addSubview(titleLabel)
    self.gradientView.addSubview(addButton)
    self.gradientView.addSubview(infoButton)
  }
  
  private func style() {
    self.backgroundColor = .black
    
    self.addButton.tintColor = .white
    self.infoButton.tintColor = .white
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    self.coverImageView.frame = self.bounds
    
    self.gradientView.frame = self.bounds
    self.gradientView.changeGradient(colors: [UIColor.clear.cgColor, UIColor.black.cgColor, UIColor.black.cgColor], locations: [0, 0.9, 1])
    
    self.titleLabel.center = self.coverImageView.center
    self.titleLabel.sizeToFit()
    
    self.addButton.frame.origin = CGPoint(x: 20, y: self.bounds.maxY - 60)
    self.addButton.sizeToFit()
    
    
    self.infoButton.frame.origin = CGPoint(x: self.bounds.maxX - 42, y: self.bounds.maxY - 60)
    
    self.infoButton.sizeToFit()
  }
  
  private func configure() {
    self.coverImageView.image = UIImage(named: "lion.jpg")
//    self.titleLabel.text = self.movie?.title
  }
}


