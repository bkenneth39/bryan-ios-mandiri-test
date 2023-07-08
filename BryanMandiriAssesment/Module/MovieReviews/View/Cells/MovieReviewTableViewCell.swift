//
//  MovieReviewTableViewCell.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 08/07/23.
//

import UIKit
import Reusable

class MovieReviewTableViewCell: UITableViewCell, NibReusable {

  @IBOutlet weak var lblAuthor: UILabel!
  @IBOutlet weak var lblDateCreated: UILabel!
  @IBOutlet weak var lblReviewContent: UILabel!
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
    
}
