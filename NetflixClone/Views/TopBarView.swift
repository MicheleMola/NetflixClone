//
//  TopBarView.swift
//  NetflixClone
//
//  Created by Michele Mola on 02/08/2019.
//  Copyright © 2019 Michele Mola. All rights reserved.
//

import UIKit

class TopBarView: UIView {
  
  let serieTvLabel = UILabel()
  let filmLabel = UILabel()
  let myListLabel = UILabel()
  
  let blurEffect: UIBlurEffect
  let blurEffectView: UIVisualEffectView
  
  override init(frame: CGRect) {
    self.blurEffect = UIBlurEffect(style: .dark)
    self.blurEffectView = UIVisualEffectView(effect: blurEffect)
    
    super.init(frame: frame)
    
    self.setup()
    self.style()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setup() {
    self.addSubview(self.blurEffectView)

    self.addSubview(self.serieTvLabel)
    self.addSubview(self.filmLabel)
    self.addSubview(self.myListLabel)
  }
  
  func style() {
    self.serieTvLabel.text = "Serie TV"
    self.serieTvLabel.textColor = .white
    
    self.filmLabel.text = "Film"
    self.filmLabel.textColor = .white
    
    self.myListLabel.text = "La mia lista"
    self.myListLabel.textColor = .white
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    self.blurEffectView.frame = self.bounds
    
    self.serieTvLabel.frame.origin = CGPoint(x: 80, y: 48)
    self.serieTvLabel.sizeToFit()
    
    self.filmLabel.frame.origin = CGPoint(x: 180, y: 48)
    self.filmLabel.sizeToFit()
    
    self.myListLabel.frame.origin = CGPoint(x: 240, y: 48)
    self.myListLabel.sizeToFit()
  }
}
