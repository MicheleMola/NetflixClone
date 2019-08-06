//
//  TopBarView.swift
//  NetflixClone
//
//  Created by Michele Mola on 02/08/2019.
//  Copyright © 2019 Michele Mola. All rights reserved.
//

import UIKit
import PinLayout

class TopBarView: UIView {
  
  let serieTvLabel = UILabel()
  let filmLabel = UILabel()
  let myListLabel = UILabel()
  let logoImageView = UIImageView()
  
  let blurEffect: UIBlurEffect
  let blurEffectView: UIVisualEffectView
  
  var isHiddenBlurView = true {
    didSet {
      self.animateBlurView()
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
  
  private func setup() {
    self.addSubview(self.blurEffectView)

    self.addSubview(self.logoImageView)
    self.addSubview(self.serieTvLabel)
    self.addSubview(self.filmLabel)
    self.addSubview(self.myListLabel)
  }
  
  private func style() {
    self.serieTvLabel.text = "Serie TV"
    self.serieTvLabel.textColor = .white
    self.serieTvLabel.font = UIFont.systemFont(ofSize: 14)
    self.serieTvLabel.textAlignment = .center
    
    self.filmLabel.text = "Film"
    self.filmLabel.textColor = .white
    self.filmLabel.font = UIFont.systemFont(ofSize: 14)
    self.filmLabel.textAlignment = .center
    
    self.myListLabel.text = "La mia lista"
    self.myListLabel.textColor = .white
    self.myListLabel.font = UIFont.systemFont(ofSize: 14)
    self.myListLabel.textAlignment = .center
    
    self.logoImageView.image = UIImage(named: "logo")
    self.logoImageView.contentMode = .scaleAspectFit
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    self.blurEffectView.frame = self.bounds
    
    self.logoImageView.pin
      .vertically()
      .top().marginTop(40)
      .left()
      .height(40%)
      .width(20%)
    
    self.serieTvLabel.pin
      .after(of: self.logoImageView, aligned: .top)
      .bottom()
      .height(40%)
      .width(25%)
    
    self.filmLabel.pin
      .after(of: self.serieTvLabel, aligned: .top)
      .bottom()
      .height(40%)
      .width(25%)

    self.myListLabel.pin
      .after(of: self.filmLabel, aligned: .top)
      .bottom()
      .height(40%)
      .width(25%)
  }
  
  private func animateBlurView() {
    UIView.animate(withDuration: 0.3) {
      self.blurEffectView.alpha = self.isHiddenBlurView ? 0 : 1
    }
  }
}
