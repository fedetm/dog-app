//
//  IDogBreedImagesInteractor.swift
//  DogApp
//
//  Created by Federico Torres Mojica on 2/13/24.
//

import Foundation

protocol IDogBreedImagesInteractor {
  
  func getDogBreedImages(_ appDelegate: AppDelegate, completion: @escaping (_ dogBreedImages: [DogBreedImageModel]) -> Void)
  
}
