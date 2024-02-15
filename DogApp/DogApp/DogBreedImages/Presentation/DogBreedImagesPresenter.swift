//
//  DogBreedImagesPresenter.swift
//  DogApp
//
//  Created by Federico Torres Mojica on 2/13/24.
//

import Foundation
import UIKit

class DogBreedImagesPresenter: IDogBreedImagesPresenter, IDogBreedImagesIntToPresenter {
  
  var interactor: IDogBreedImagesInteractor
  weak var view: DogBreedImagesView!
  
  init(interactor: IDogBreedImagesInteractor, view: DogBreedImagesView) {
    self.interactor = interactor
    self.view = view
  }
  
  func getDogBreedImages() {
    let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    interactor.getDogBreedImages(appDelegate) { [weak self] dogBreedImages in
      var dogBreedUIImages = [UIImage]()
      for dogBreedImage in dogBreedImages {
        guard let uiImage = UIImage(data: dogBreedImage.imageData) else { return }
        dogBreedUIImages.append(uiImage)
      }
      guard let self = self else { return }
      self.view.dogBreedUIImages += dogBreedUIImages
      self.view.dogBreedImages += dogBreedImages
      self.view.configureCollectionVIew()
    }
  }
  
}
