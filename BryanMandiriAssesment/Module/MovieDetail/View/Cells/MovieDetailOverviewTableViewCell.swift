//
//  MovieDetailOverviewTableViewCell.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 07/07/23.
//

import UIKit
import Reusable

class MovieDetailOverviewTableViewCell: UITableViewCell, NibReusable {

  @IBOutlet weak var lblOverview: UILabel!
  override func awakeFromNib() {
    super.awakeFromNib()
    self.selectionStyle = .none
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
    
}
