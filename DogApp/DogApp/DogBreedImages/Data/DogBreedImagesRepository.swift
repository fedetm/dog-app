//
//  DogBreedImagesRepository.swift
//  DogApp
//
//  Created by Federico Torres Mojica on 2/13/24.
//

import Foundation

class DogBreedImagesRepository: IDogBreedImagesRepository {
  var dataSource: DogBreedImagesDataSource
  
  init() {
    self.dataSource = DogBreedImagesDataSource()
  }
}
