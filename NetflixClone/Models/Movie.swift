//
//  Movie.swift
//  NetflixClone
//
//  Created by Michele Mola on 01/08/2019.
//  Copyright © 2019 Michele Mola. All rights reserved.
//

import UIKit

struct Movie {
  let title: String
  let posterPath: String
  let overview: String
}

extension Movie: Codable {
  private enum CodingKeys: String, CodingKey {
    case title
    case posterPath = "poster_path"
    case overview
  }
}

struct MovieResults: Codable {
  let results: [Movie]
}
