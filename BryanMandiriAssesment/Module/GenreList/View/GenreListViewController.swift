//
//  GenreListViewController.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 06/07/23.
//

import UIKit

class GenreListViewController: UIViewController {

  @IBOutlet weak var tblGenre: UITableView!
  var presenter: GenreListViewToPresenterProtocol?
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    presenter?.initData()
  }
}

extension GenreListViewController: GenreListPresenterToViewProtocol {
  
  func showError(message: String) {
    self.showErrorAlert(message: message)
  }
  
  
  func configureViews() {
    tblGenre.delegate = self
    tblGenre.dataSource = self
    tblGenre.register(cellType: GenreListTableViewCell.self)
    tblGenre.register(cellType: EmptyDataTableViewCell.self)
  }
  
  func showLoading() {
    self.showLoadingView()
  }
  
  func hideLoading() {
    self.hideLoadingView()
  }
  
  func reloadData() {
    tblGenre.reloadData()
  }
  
}

extension GenreListViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let presenter = presenter else {return 0}
    if presenter.numberOfItems() == 0 {
      return 1
    }
    return presenter.numberOfItems()
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if presenter?.numberOfItems() == 0 {
      return tblGenre.frame.height
    }
    return UITableView.automaticDimension
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if presenter?.numberOfItems() == 0 {
      let cell: EmptyDataTableViewCell = tableView.dequeueReusableCell(for: indexPath)
      return cell
    }
    
    let cell: GenreListTableViewCell = tableView.dequeueReusableCell(for: indexPath)
    let genre = presenter?.getGenre(index: indexPath.row)
    cell.lblGenreName.text = genre?.name
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presenter?.didSelectGenre(index: indexPath.row)
  }
  
  
}
