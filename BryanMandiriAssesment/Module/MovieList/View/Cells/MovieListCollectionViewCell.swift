//
//  MovieListCollectionViewCell.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 07/07/23.
//

import UIKit
import Reusable
import Kingfisher

class MovieListCollectionViewCell: UICollectionViewCell, NibReusable {
  
  @IBOutlet weak var lblTitle: UILabel!
  @IBOutlet weak var imgPoster: UIImageView!
  @IBOutlet weak var lblRating: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }

}
