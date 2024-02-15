//
//  DogBreedImagesDataSource.swift
//  DogApp
//
//  Created by Federico Torres Mojica on 2/13/24.
//

import Foundation

class DogBreedImagesDataSource {
  var dogBreedImagesURL: URL
  
  init() {
    dogBreedImagesURL = URL(string: "https://dog.ceo/api/breed/pug/images/random/20")!
  }
  
  func getDogBreedImages(completion: @escaping (_ data: Data) -> Void) {
    Task.init {
      let (data, response) = try await URLSession.shared.data(from: dogBreedImagesURL)
      guard let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200 else { return }
      completion(data)
    }
  }
  
  func fetchImage(from url: URL, completion: @escaping (_ data: Data) -> Void) {
    Task.init {
      let (data, response) = try await URLSession.shared.data(from: url)
      guard let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200 else { return }
      completion(data)
    }
  }
}
