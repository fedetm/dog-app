//
//  DogBreedImagesInteractor.swift
//  DogApp
//
//  Created by Federico Torres Mojica on 2/13/24.
//

import Foundation

class DogBreedImagesInteractor: IDogBreedImagesInteractor {
  var repository: IDogBreedImagesRepository
  weak var presenter: IDogBreedImagesIntToPresenter!
  
  init() {
    self.repository = DogBreedImagesRepository()
  }
}
