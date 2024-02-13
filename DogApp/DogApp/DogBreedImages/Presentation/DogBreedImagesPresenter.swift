//
//  DogBreedImagesPresenter.swift
//  DogApp
//
//  Created by Federico Torres Mojica on 2/13/24.
//

import Foundation

class DogBreedImagesPresenter: IDogBreedImagesPresenter, IDogBreedImagesIntToPresenter {
  var interactor: IDogBreedImagesInteractor
  weak var view: DogBreedImagesView!
  
  init(interactor: IDogBreedImagesInteractor, view: DogBreedImagesView) {
    self.interactor = interactor
    self.view = view
  }
  
  
}
