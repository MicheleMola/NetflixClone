//
//  MovieViewModel.swift
//  NetflixClone
//
//  Created by Michele Mola on 02/08/2019.
//  Copyright © 2019 Michele Mola. All rights reserved.
//

import UIKit

struct MovieViewModel {
  let title: String
  let imageURL: URL?
  let overview: String
  
  init(movie: Movie) {
    self.title = movie.title
    self.imageURL = URL(string: "https://image.tmdb.org/t/p/w500/\(movie.posterPath)")
    self.overview = movie.overview
  }
}
