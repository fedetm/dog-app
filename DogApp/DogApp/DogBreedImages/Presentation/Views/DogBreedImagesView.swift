//
//  DogBreedImagesView.swift
//  DogApp
//
//  Created by Federico Torres Mojica on 2/13/24.
//

import UIKit

class DogBreedImagesView: UIViewController {
  @IBOutlet weak var collectionView: UICollectionView!
  var presenter: DogBreedImagesPresenter!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureCollectionVIew()
  }
  
  func configureCollectionVIew() {
    
  }
}
