//
//  DogBreedImagesRouter.swift
//  DogApp
//
//  Created by Federico Torres Mojica on 2/13/24.
//

import Foundation

class DogBreedImagesRouter {
  func initDogBreedImagesModule(view: DogBreedImagesView) {
    let interactor = DogBreedImagesInteractor()
    let presenter = DogBreedImagesPresenter(interactor: interactor, view: view)
    
    view.presenter = presenter
    interactor.presenter = presenter
  }
}
