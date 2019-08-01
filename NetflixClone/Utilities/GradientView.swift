//
//  GradientView.swift
//  NetflixClone
//
//  Created by Michele Mola on 01/08/2019.
//  Copyright © 2019 Michele Mola. All rights reserved.
//

import Foundation
import UIKit

class GradientView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  private func setup() {
    autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
    guard let layer = self.layer as? CAGradientLayer else {
      return
    }
    
    layer.frame = self.bounds
  }
  
  func changeGradient(colors: [CGColor], locations: [NSNumber]) {
    guard let layer = self.layer as? CAGradientLayer else {
      return
    }
    
    layer.colors = colors
    
    layer.locations = locations
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
  override class var layerClass: AnyClass {
    return CAGradientLayer.self
  }
}
