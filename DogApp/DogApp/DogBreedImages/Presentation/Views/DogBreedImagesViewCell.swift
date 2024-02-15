//
//  DogBreedImagesViewCell.swift
//  DogApp
//
//  Created by Federico Torres Mojica on 2/13/24.
//

import UIKit
import CoreData

class DogBreedImagesViewCell: UICollectionViewCell {
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var likeButton: UIButton!
  @IBOutlet weak var likesCountLabel: UILabel!
  @IBOutlet weak var likesLabel: UILabel!
  
  let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  
  var dogBreedImage: DogBreedImageModel! = nil {
    didSet {
      configureLikeButton()
      configureLikesCountLabel()
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    let heart = UIImage(systemName: "heart")
    likeButton.setImage(heart, for: .normal)
    let fillHeart = UIImage(systemName: "heart.fill")
    likeButton.setImage(fillHeart, for: .selected)
  }
  
  func updateUI() {
    self.reloadInputViews()
  }
  
  func configureLikeButton() {
    likeButton.isSelected = dogBreedImage.isLiked
  }
  
  func configureLikesCountLabel() {
    likesCountLabel.text = String(dogBreedImage.likes)
  }
  
  @IBAction func likeAction(_ sender: Any) {
    dogBreedImage.isLiked = !dogBreedImage.isLiked
    if dogBreedImage.isLiked {
      likeButton.isSelected = true
      dogBreedImage.likes += 1
    } else {
      likeButton.isSelected = false
      dogBreedImage.likes -= 1
    }
    
    likesCountLabel.text = String(dogBreedImage.likes)
    if dogBreedImage.likes == 0 {
      likesLabel.text = "Like"
    } else {
      likesLabel.text = "Likes"
    }
    createInteraction(dogBreedImage.isLiked)
    updateUI()
  }
  
  func createInteraction(_ isLiked: Bool) {
    let newLike = LikeModel(context: context)
    newLike.imageURL = dogBreedImage.imageURL
    newLike.likes = Int32(dogBreedImage.likes)
    newLike.isLiked = isLiked
    newLike.createdAt = Date()
    
    do {
      try context.save()
    } catch {
      print(error)
    }
  }
}
