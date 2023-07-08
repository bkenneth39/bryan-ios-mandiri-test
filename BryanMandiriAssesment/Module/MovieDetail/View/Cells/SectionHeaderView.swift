//
//  SectionHeaderView.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 07/07/23.
//

import UIKit
import Reusable

class SectionHeaderView: UITableViewHeaderFooterView, NibReusable {

  @IBOutlet weak var viewBackground: UIView!
  @IBOutlet weak var lblTitle: UILabel!
  
  override class func awakeFromNib() {
    super.awakeFromNib()
  }

}
