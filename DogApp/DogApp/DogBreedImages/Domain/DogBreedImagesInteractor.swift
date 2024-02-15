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
  
  func getDogBreedImages(_ appDelegate: AppDelegate, completion: @escaping (_ dogBreedImages: [DogBreedImageModel]) -> Void) {
    repository.getDogBreedImages { [weak self] response in
      guard let self = self else { return }
      self.fetchImages(appDelegate, from: response.message, completion: completion)
    }
  }
  
  func fetchImages(_ appDelegate: AppDelegate, from urlList: [String], completion: @escaping (_ dogBreedImages: [DogBreedImageModel]) -> Void) {
    
    let imagesLikes = repository.fetchLikes(appDelegate)
    
    let group = DispatchGroup()
    let concurrentQueue = DispatchQueue(label: "ConcurrentQueue", attributes: .concurrent)
    
    var dogBreedImages = [DogBreedImageModel]()
    for urlString in urlList {
      group.enter()
      concurrentQueue.async { [weak self] in
        guard let self = self else { return }
        let url = URL(string: urlString)!
        self.repository.fetchImage(from: url) { data in
          let dogBreedImage = DogBreedImageModel(imageURL: url, imageData: data, isLiked: false)
          dogBreedImages.append(dogBreedImage)
          group.leave()
        }
      }
    }
    group.wait()
    
    if let imagesLikes = imagesLikes {
      for imageLike in imagesLikes {
        let dogBreedImage = dogBreedImages.filter { $0.imageURL == imageLike.imageURL }
        if !dogBreedImage.isEmpty {
          dogBreedImage[0].isLiked = imageLike.isLiked
        }
      }
    }
    
    completion(dogBreedImages)
  }
  
}
