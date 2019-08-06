//
//  DetailView.swift
//  NetflixClone
//
//  Created by Michele Mola on 05/08/2019.
//  Copyright © 2019 Michele Mola. All rights reserved.
//

import UIKit
import PinLayout

class DetailHeaderReusableView: UICollectionReusableView {
  
  static let reusableID = "DetailHeader"
  
  let posterImageView = UIImageView()
  
  let blurEffect: UIBlurEffect
  let blurEffectView: UIVisualEffectView
  
  let playButton = UIButton()
  let overviewLabel = UILabel()
  let regiaLabel = UILabel()
  let castLabel = UILabel()
  
  let newLabel = UILabel()
  let durationLabel = UILabel()
  
  let backgroundImageView = UIImageView()
  
  var movie: Movie? {
    didSet {
      self.configure()
    }
  }
  
  override init(frame: CGRect) {
    self.blurEffect = UIBlurEffect(style: .dark)
    self.blurEffectView = UIVisualEffectView(effect: self.blurEffect)
    
    super.init(frame: frame)
    
    self.setup()
    self.style()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func style() {
    self.backgroundColor = .red
    
    self.playButton.backgroundColor = .red
    self.playButton.setTitle("Riproduci", for: .normal)
    self.playButton.setTitleColor(.white, for: .normal)
    self.playButton.layer.cornerRadius = 4
    self.playButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    
    self.overviewLabel.textColor = .white
    self.overviewLabel.numberOfLines = 0
    self.overviewLabel.font = UIFont.systemFont(ofSize: 13)
    
    self.castLabel.textColor = .gray
    self.castLabel.font = UIFont.systemFont(ofSize: 11)
    
    self.regiaLabel.textColor = .gray
    self.regiaLabel.font = UIFont.systemFont(ofSize: 11)
    
    self.newLabel.textColor = .green
    self.newLabel.font = UIFont.systemFont(ofSize: 13)
    
    self.durationLabel.textColor = .gray
    self.durationLabel.font = UIFont.systemFont(ofSize: 13)
    
    self.backgroundImageView.contentMode = .scaleAspectFill
    
    self.posterImageView.contentMode = .scaleAspectFill
    self.posterImageView.clipsToBounds = true
  }
  
  func setup() {
    self.addSubview(self.backgroundImageView)
    self.addSubview(self.blurEffectView)
    self.addSubview(self.posterImageView)
    self.addSubview(self.playButton)
    self.addSubview(self.overviewLabel)
    self.addSubview(self.castLabel)
    self.addSubview(self.regiaLabel)
    self.addSubview(self.newLabel)
    self.addSubview(self.durationLabel)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    self.posterImageView.pin
      .hCenter()
      .top().marginTop(72)
      .width(33%)
      .height(40%)
    
    self.backgroundImageView.pin
      .left()
      .top().marginTop(-30%)
      .width(100%)
      .height(130%)
    
    self.blurEffectView.pin
      .left()
      .top().marginTop(-30%)
      .width(100%)
      .height(130%)
    
    self.newLabel.pin
      .top(to: self.posterImageView.edge.bottom).marginTop(16)
      .left().marginLeft(25%)
      .width(15%)
      .height(16)
    
    self.durationLabel.pin
      .after(of: self.newLabel, aligned: .top)
      .bottom()
      .width(35%)
      .height(16)
    
    self.playButton.pin
      .hCenter()
      .top(to: self.posterImageView.edge.bottom).marginTop(48)
      .width(90%)
      .height(32)
    
    self.overviewLabel.pin
      .top(to: self.playButton.edge.bottom).marginTop(16)
      .left().marginLeft(5%)
      .right().marginRight(5%)
      .height(48)
    
    self.castLabel.pin
      .top(to: self.overviewLabel.edge.bottom)
      .hCenter()
      .width(90%)
      .height(24)
    
    self.regiaLabel.pin
      .top(to: self.castLabel.edge.bottom).marginTop(-8)
      .hCenter()
      .width(90%)
      .height(24)
  }
  
  func configure() {
    guard let movie = self.movie else { return }
    let movieViewModel = MovieViewModel(movie: movie)
    
    self.posterImageView.kf.setImage(with: movieViewModel.imageURL)
    self.overviewLabel.text = movieViewModel.overview
    
    self.castLabel.text = "Cast: Chris Evans, Haley Bennett"
    self.regiaLabel.text = "Regia: Gideon Raff"
    
    self.newLabel.text = "Nuovo"
    self.durationLabel.text = "2019   VM14    2h 10m"
    
    self.backgroundImageView.kf.setImage(with: movieViewModel.imageURL)
  }
  
}
