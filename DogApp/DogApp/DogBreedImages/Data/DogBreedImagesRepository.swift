//
//  DogBreedImagesRepository.swift
//  DogApp
//
//  Created by Federico Torres Mojica on 2/13/24.
//

import Foundation
import CoreData

class DogBreedImagesRepository: IDogBreedImagesRepository {
  var dataSource: DogBreedImagesDataSource
  
  init() {
    self.dataSource = DogBreedImagesDataSource()
  }
  
  func getDogBreedImages(completion: @escaping (_ response: DogBreedImagesResponseModel) -> Void) {
    dataSource.getDogBreedImages { data in
      do {
        let decoder = JSONDecoder()
        let dogBreedImages = try decoder.decode(DogBreedImagesResponseModel.self, from: data)
        completion(dogBreedImages)
      } catch {
        print(error.localizedDescription)
      }
    }
  }
  
  func fetchImage(from url: URL, completion: @escaping (_ data: Data) -> Void) {
    dataSource.fetchImage(from: url, completion: completion)
  }
  
  func fetchLikes(_ appDelegate: AppDelegate) -> [LikeModel]? {
    let context = appDelegate.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "LikeModel")
    do {
      let results = try context.fetch(fetchRequest)
      let imagesLikes = results as! [LikeModel]
      
      return imagesLikes
    } catch let err as NSError {
      print(err.debugDescription)
      return nil
    }
  }
}
