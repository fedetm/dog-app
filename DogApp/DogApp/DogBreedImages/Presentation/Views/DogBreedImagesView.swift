//
//  DogBreedImagesView.swift
//  DogApp
//
//  Created by Federico Torres Mojica on 2/13/24.
//

import UIKit

class DogBreedImagesView: UIViewController {
  @IBOutlet weak var collectionView: UICollectionView!
  
  var presenter: IDogBreedImagesPresenter!
  var collectionViewDelegate: CollectionViewDelegate!
  
  var dogBreedUIImages = [UIImage]()
  var dogBreedImages = [DogBreedImageModel]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initDogBreedImagesModule()
    presenter.getDogBreedImages()
  }
  
  func initDogBreedImagesModule() {
    let router = DogBreedImagesRouter()
    router.initDogBreedImagesModule(view: self)
  }
  
  func getDogBreedImages() {
    presenter.getDogBreedImages()
  }
  
  func configureCollectionVIew() {
    collectionViewDelegate = CollectionViewDelegate(view: self)
    DispatchQueue.main.async { [weak self] in
      guard let self = self else { return }
      collectionView.delegate = self.collectionViewDelegate
      collectionView.dataSource = self.collectionViewDelegate
      collectionView.register(UINib(nibName: "DogBreedImagesViewCell", bundle: nil), forCellWithReuseIdentifier: "DogBreedImagesViewCell")
    }
  }
  
}
