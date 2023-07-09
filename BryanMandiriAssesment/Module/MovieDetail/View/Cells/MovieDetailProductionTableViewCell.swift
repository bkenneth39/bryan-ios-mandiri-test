//
//  MovieDetailProductionTableViewCell.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 09/07/23.
//

import UIKit
import Reusable

class MovieDetailProductionTableViewCell: UITableViewCell, NibReusable {

  @IBOutlet weak var colProduction: UICollectionView!
  var productionCompanies: [ProductionCompany]? {
    didSet {
      colProduction.reloadData()
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    configureViews()
  }
  
  private func configureViews() {
    colProduction.delegate = self
    colProduction.dataSource = self
    colProduction.register(cellType: MovieProductionCompanyCollectionViewCell.self)
    
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
    
}

extension MovieDetailProductionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    guard let productionCompanies = productionCompanies else {return 0}
    if productionCompanies.count == 0 {
      return 1
    }
    return productionCompanies.count
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 250, height: 100)
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let productionCompanies = productionCompanies else {return UICollectionViewCell()}
    let cell: MovieProductionCompanyCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
    if productionCompanies.count == 0 {
      cell.lblProdName.text = Constants.noProductionCompany
      cell.lblProdCountry.text = ""
      return cell
    }
    if let urlString = productionCompanies[indexPath.row].logoPath {
      let urlImage = URL(string:"\(Constants.imgUrl)\(urlString)")
      cell.imgProdLogo.kf.setImage(with: urlImage)
    }
    
    cell.lblProdName.text = productionCompanies[indexPath.row].name
    cell.lblProdCountry.text = productionCompanies[indexPath.row].originCountry
    return cell
  }
  
  
}
