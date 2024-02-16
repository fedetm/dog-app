//
//  CollectionViewDelegate.swift
//  DogApp
//
//  Created by Federico Torres Mojica on 2/13/24.
//

import Foundation
import UIKit

class CollectionViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  weak var view: DogBreedImagesView!
  
  init(view: DogBreedImagesView) {
    self.view = view
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return view.dogBreedUIImages.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DogBreedImagesViewCell", for: indexPath) as! DogBreedImagesViewCell
    
    configureCell(cell, forImageAt: indexPath)
    
    return cell
  }
  
  func configureCell(_ cell: DogBreedImagesViewCell, forImageAt indexPath: IndexPath) {
    
    let dogBreedUIImage = view.dogBreedUIImages[indexPath.row]
    let dogBreedImage = view.dogBreedImages[indexPath.row]
    
    cell.imageView.image = dogBreedUIImage
    cell.dogBreedImage = dogBreedImage
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = view.contentView.bounds.width
    
    let dogBreedUIImage = view.dogBreedUIImages[indexPath.row]
    let height: CGFloat = dogBreedUIImage.size.height
    
    return CGSize(width: width, height: height)
  }
  
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    let lastDogBreedUIImage = view.dogBreedUIImages.count - 1
    if indexPath.item == lastDogBreedUIImage {
      view.getDogBreedImages()
    }
  }
  
}
