//
//  Section.swift
//  NetflixClone
//
//  Created by Michele Mola on 01/08/2019.
//  Copyright © 2019 Michele Mola. All rights reserved.
//

import Foundation

enum SectionName: String {
  case preview = "Anteprime"
  case popular = "I più visti"
  case hot = "I titoli del momento"
  case comedy = "Commedie"
  case italianComedy = "Commedie italiane"
}

struct Section {
  let title: SectionName
  let movies: [Movie]
}
