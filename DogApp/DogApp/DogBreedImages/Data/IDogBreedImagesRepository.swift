//
//  IDogBreedImagesRepository.swift
//  DogApp
//
//  Created by Federico Torres Mojica on 2/13/24.
//

import Foundation

protocol IDogBreedImagesRepository {
  
  func getDogBreedImages(completion: @escaping (_ response: DogBreedImagesResponseModel) -> Void)
  
  func fetchImage(from url: URL, completion: @escaping (_ data: Data) -> Void)
  
  func fetchLikes(_ appDelegate: AppDelegate) -> [LikeModel]?
  
}
