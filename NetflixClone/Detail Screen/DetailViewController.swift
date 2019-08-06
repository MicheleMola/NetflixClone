//
//  DetailViewController.swift
//  NetflixClone
//
//  Created by Michele Mola on 05/08/2019.
//  Copyright © 2019 Michele Mola. All rights reserved.
//

import UIKit
import Hero

class DetailViewController: UIViewController {
  
  let detailView = DetailView()
  let networkingManager = NetworkingManager()
  
  var movie: Movie? {
    didSet {
      self.detailView.movie = self.movie
    }
  }
  
  var heroId: String? {
    didSet {
      self.detailView.heroId = self.heroId
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    self.setup()
  }
  
  override func loadView() {
    self.view = detailView
  }
  
  func setup() {
    self.detailView.closeButtonDidTap = closeButtonDidTap
  
    self.detailView.dismissScreen = closeButtonDidTap
    
    self.getMovies()
  }
  
  private func getMovies() {
    self.networkingManager.fetchAllPopularMovies { results in
      if let movies = results {
        (self.view as! DetailView).movies = movies
      }
    }
  }
  
  func closeButtonDidTap() {
    self.navigationController?.popViewController(animated: true)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    self.heroId = nil
  }
  
}
