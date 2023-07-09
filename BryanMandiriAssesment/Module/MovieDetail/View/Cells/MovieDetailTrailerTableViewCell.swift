//
//  MovieDetailTrailerTableViewCell.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 09/07/23.
//

import UIKit
import Reusable
import youtube_ios_player_helper

class MovieDetailTrailerTableViewCell: UITableViewCell, NibReusable {

  @IBOutlet var playerTrailer: YTPlayerView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    self.selectionStyle = .none
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
    
}
