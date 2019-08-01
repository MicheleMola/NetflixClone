//
//  NetworkingManager.swift
//  NetflixClone
//
//  Created by Michele Mola on 01/08/2019.
//  Copyright © 2019 Michele Mola. All rights reserved.
//

import UIKit
import Alamofire

class NetworkingManager {
  
  let base = "https://api.themoviedb.org"
  let parameters: Parameters = ["api_key": "00360b6e284010719851edbb5f299d99"]
  
  func fetchAllPopularMovies(completion: @escaping ([Movie]?) -> Void) {
    
    let fullURL = self.base + "/3/movie/popular"
    
    guard let url = URL(string: fullURL) else {
      completion(nil)
      return
    }
    
    AF.request(url, method: .get, parameters: self.parameters).validate().responseData { response in
      switch response.result {
      case .success:
        if let data = response.data {
          let decoder = JSONDecoder()
          guard let movieResults = try? decoder.decode(MovieResults.self, from: data) else {
            completion(nil)
            return
          }
          
          completion(movieResults.results)
        }
      case .failure:
        completion(nil)
      }
    }
  }
}
