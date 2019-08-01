//
//  ViewController.swift
//  NetflixClone
//
//  Created by Michele Mola on 01/08/2019.
//  Copyright © 2019 Michele Mola. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  let homeView = HomeView()
  
  init() {
    super.init(nibName: nil, bundle: nil)
    
    self.tabBarItem.title = "Home page"
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }

  override func loadView() {
    self.view = homeView
  }

}

