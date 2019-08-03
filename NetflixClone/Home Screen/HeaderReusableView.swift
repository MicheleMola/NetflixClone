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
  let playButton = PlayButton()
  let infoButton = UIButton(type: .detailDisclosure)
  let genresLabel = UILabel()
  
  let gradientView = GradientView()
  
  let myListLabel = UILabel()
  let infoLabel = UILabel()
  
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
    self.gradientView.addSubview(playButton)
    self.gradientView.addSubview(genresLabel)
    self.gradientView.addSubview(myListLabel)
    self.gradientView.addSubview(infoLabel)
  }
  
  private func style() {
    self.backgroundColor = .black
    
    self.addButton.tintColor = .white
    self.infoButton.tintColor = .white
  
    self.genresLabel.text = "Genitori - Crisi di mezza età - New York - Film di Hollywood"
    self.genresLabel.textColor = .white
    self.genresLabel.font = UIFont.boldSystemFont(ofSize: 10)
    self.genresLabel.sizeToFit()
    
    self.coverImageView.contentMode = .scaleAspectFill
    self.clipsToBounds = true
    
    self.myListLabel.textColor = .gray
    self.myListLabel.text = "La mia lista"
    self.myListLabel.font = UIFont.boldSystemFont(ofSize: 8)
    self.myListLabel.sizeToFit()
    
    self.infoLabel.textColor = .gray
    self.infoLabel.text = "Info"
    self.infoLabel.font = UIFont.boldSystemFont(ofSize: 8)
    self.infoLabel.sizeToFit()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    self.coverImageView.frame = self.bounds
    
    self.gradientView.frame = self.bounds
    self.gradientView.changeGradient(colors: [UIColor.clear.cgColor, UIColor.black.cgColor, UIColor.black.cgColor], locations: [0, 0.9, 1])
    
    self.addButton.frame.origin = CGPoint(x: 32, y: self.bounds.maxY - 60)
    self.myListLabel.center = CGPoint(x: self.addButton.frame.midX, y: self.addButton.frame.maxY + 10)
    
    self.infoButton.frame.origin = CGPoint(x: self.bounds.maxX - 54, y: self.bounds.maxY - 60)
    self.infoLabel.center = CGPoint(x: self.infoButton.frame.midX, y: self.infoButton.frame.maxY + 10)
    
    self.playButton.frame.size = CGSize(width: self.bounds.width / 3, height: 32)
    self.playButton.center = CGPoint(x: self.bounds.midX, y: self.bounds.maxY - 50)
    
    self.genresLabel.center = CGPoint(x: self.bounds.midX, y: self.bounds.maxY - 120)
  }
  
  private func configure() {
    guard let movie = self.movie else { return }
    let movieViewModel = MovieViewModel(movie: movie)
    
    self.coverImageView.kf.setImage(with: movieViewModel.imageURL)
  }
}


