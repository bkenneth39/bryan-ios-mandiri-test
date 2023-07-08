//
//  GenreListTableViewCell.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 07/07/23.
//

import UIKit
import Reusable

class GenreListTableViewCell: UITableViewCell, NibReusable {

  @IBOutlet weak var lblGenreName: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
    
}
