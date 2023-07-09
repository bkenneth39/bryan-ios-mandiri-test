//
//  EmptyDataTableViewCell.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 08/07/23.
//

import UIKit
import Reusable

class EmptyDataTableViewCell: UITableViewCell, NibReusable {

  override func awakeFromNib() {
    super.awakeFromNib()
    self.selectionStyle = .none
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
    
}
