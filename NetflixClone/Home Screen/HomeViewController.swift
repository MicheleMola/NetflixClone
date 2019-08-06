//
//  ViewController.swift
//  NetflixClone
//
//  Created by Michele Mola on 01/08/2019.
//  Copyright © 2019 Michele Mola. All rights reserved.
//

import UIKit
import Hero

class HomeViewController: UIViewController {
  
  let networkingManager = NetworkingManager()
  
  init() {
    super.init(nibName: nil, bundle: nil)
    
    self.tabBarItem.title = "Home page"
    self.tabBarItem.image = UIImage(named: "home")
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.setup()
  }
  
  func setup() {
    self.getMovies()
    
    (self.view as! HomeView).didSelectMovie = didSelect
    
  }
  
  private func getMovies() {
    self.networkingManager.fetchAllPopularMovies { results in
      if let movies = results {
        (self.view as! HomeView).movies = movies
      }
    }
  }

  override func loadView() {
    let homeView = HomeView()
    self.view = homeView
  }
  
  func didSelect(_ movie: Movie, heroId: String) {
    let detailViewController = DetailViewController()
    
//    detailViewController.hero.isEnabled = true
    detailViewController.heroId = heroId
    detailViewController.movie = movie
    
    self.navigationController?.pushViewController(detailViewController, animated: true)
  }

}

