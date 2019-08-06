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
  let addButton = UIButton(type: .custom)
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
    
    let addButtonImage = UIImage(named: "plus")
    self.addButton.setImage(addButtonImage, for: .normal)
    
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
//    self.myListLabel.sizeToFit()
    
    self.infoLabel.textColor = .gray
    self.infoLabel.text = "Info"
    self.infoLabel.font = UIFont.boldSystemFont(ofSize: 8)
    self.infoLabel.sizeToFit()
    
    self.gradientView.changeGradient(colors: [UIColor.black.cgColor, UIColor.clear.cgColor, UIColor.black.cgColor], locations: [0, 0.5, 1])
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    self.coverImageView.frame = self.bounds
    
    self.gradientView.frame = self.bounds
    
    self.addButton.pin
      .left().marginLeft(32)
      .top().marginTop(self.bounds.maxY - 60)
      .width(16)
      .height(16)
    
    self.myListLabel.pin
      .below(of: self.addButton, aligned: .center).marginTop(6)
      .sizeToFit()
    
    self.infoButton.pin
      .right().marginRight(32)
      .top().marginTop(self.bounds.maxY - 60)
      .width(16)
      .height(16)
    
    self.infoLabel.pin
      .below(of: self.infoButton, aligned: .center).marginTop(6)
      .sizeToFit()
    
    self.playButton.pin
      .hCenter()
      .top(to: self.infoButton.edge.top)
      .width(self.bounds.width / 3)
      .height(32)
    
    self.genresLabel.center = CGPoint(x: self.bounds.midX, y: self.bounds.maxY - 120)
  }
  
  private func configure() {
    guard let movie = self.movie else { return }
    let movieViewModel = MovieViewModel(movie: movie)
    
    self.coverImageView.kf.setImage(with: movieViewModel.imageURL)
  }
}


