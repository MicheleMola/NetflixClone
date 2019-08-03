//
//  PlayButton.swift
//  NetflixClone
//
//  Created by Michele Mola on 02/08/2019.
//  Copyright © 2019 Michele Mola. All rights reserved.
//

import UIKit

class PlayButton: UIControl {
  
  let playImageView = UIImageView()
  let playLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.setup()
    self.style()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setup() {
    self.addSubview(playImageView)
    self.addSubview(playLabel)
  }
  
  func style() {
    
    self.backgroundColor = .white
    self.layer.cornerRadius = 2
    
    self.playImageView.image = UIImage(named: "play")
    
    self.playLabel.text = "Riproduci"
    self.playLabel.textColor = .black
    self.playLabel.font = UIFont.boldSystemFont(ofSize: 14)
    self.playLabel.sizeToFit()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    self.playImageView.frame.size = CGSize(width: 16, height: 16)
    self.playImageView.center = CGPoint(x: 24, y: self.bounds.midY)
    
    self.playLabel.center = CGPoint(x: 76, y: self.bounds.midY)
  }
  
  
}
