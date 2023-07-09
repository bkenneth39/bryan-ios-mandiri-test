//
//  MovieProductionCompanyCollectionViewCell.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 09/07/23.
//

import UIKit
import Reusable
import Kingfisher

class MovieProductionCompanyCollectionViewCell: UICollectionViewCell, NibReusable {
  
  @IBOutlet weak var lblProdName: UILabel!
  @IBOutlet weak var imgProdLogo: UIImageView!
  @IBOutlet weak var lblProdCountry: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    imgProdLogo.layer.cornerRadius = 10
  }

}
