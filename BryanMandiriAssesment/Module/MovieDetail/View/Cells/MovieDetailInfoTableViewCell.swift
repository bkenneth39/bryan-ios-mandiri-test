//
//  MovieDetailInfoTableViewCell.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 07/07/23.
//

import UIKit
import Reusable

class MovieDetailInfoTableViewCell: UITableViewCell, NibReusable {

  @IBOutlet weak var imgPoster: UIImageView!
  @IBOutlet weak var lblMovieTitle: UILabel!
  @IBOutlet weak var lblVote: UILabel!
  @IBOutlet weak var lblPopular: UILabel!
  @IBOutlet weak var lblGenre: UILabel!
  @IBOutlet weak var lblReleaseDate: UILabel!
  @IBOutlet weak var btnGotoReviews: UIButton!
  var goToFunction: (() -> ())?
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    self.selectionStyle = .none
  }
    
  @IBAction func btnGoToReviewsTapped(_ sender: Any) {
    guard let goToFunction = goToFunction else {return}
    goToFunction()
  }
}
