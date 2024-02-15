//
//  DogBreedImageModel.swift
//  DogApp
//
//  Created by Federico Torres Mojica on 2/15/24.
//

import Foundation
import UIKit

class DogBreedImageModel {
  var id: UUID
  var imageURL: URL
  var imageData: Data
  var isLiked: Bool
  var likes: Int
  
  init(imageURL: URL, imageData: Data, isLiked: Bool) {
    self.id = UUID()
    self.imageURL = imageURL
    self.imageData = imageData
    self.isLiked = isLiked
    self.likes = Int(arc4random_uniform(100)) + 1
  }
}
