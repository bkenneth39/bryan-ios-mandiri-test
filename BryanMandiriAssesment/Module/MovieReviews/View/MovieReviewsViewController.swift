//
//  MovieReviewsViewController.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 08/07/23.
//

import UIKit

class MovieReviewsViewController: UIViewController {

  @IBOutlet weak var tblReviews: UITableView!
  var presenter: MovieReviewsViewToPresenterProtocol?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.viewDidLoad()
    presenter?.initData()
  }
  

}

extension MovieReviewsViewController: MovieReviewsPresenterToViewProtocol {

  
  func configureViews() {
    self.title = "Reviews for \(presenter?.getTitle() ?? "") "
    tblReviews.delegate = self
    tblReviews.dataSource = self
    tblReviews.separatorStyle = .none
    tblReviews.register(cellType: MovieReviewTableViewCell.self)
    tblReviews.register(cellType: EmptyDataTableViewCell.self)
    tblReviews.infiniteScrollDirection = .vertical
    tblReviews.addInfiniteScroll { tblReviews in
      let startIndex = (self.presenter?.numberOfItems() ?? 0) - 1 <= 0 ? 0 : (self.presenter?.numberOfItems() ?? 0)
      self.presenter?.getMoreData {
        let endIndex = (self.presenter?.numberOfItems() ?? 0) - 1
        if endIndex > startIndex {
          let indices = Array(startIndex...endIndex).compactMap({
            return IndexPath(row: $0, section: 0)
          })
          tblReviews.reloadData()
        }
        
        tblReviews.finishInfiniteScroll()
      }
    }
  }
  
  func showError(message: String) {
    self.showErrorAlert(message: message)
  }
  
  func showLoading() {
    self.showLoadingView()
  }
  
  func hideLoading() {
    self.hideLoadingView()
  }
  
  func reloadData() {
    tblReviews.reloadData()
  }
  
  
}

extension MovieReviewsViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let presenter = presenter else {return 0}
    
    if presenter.numberOfItems() == 0 {
      return 1
    }
    
    return presenter.numberOfItems()
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    if presenter?.numberOfItems() == 0 {
      return tblReviews.frame.height
    }
    
    return UITableView.automaticDimension
  }
  
  

  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if presenter?.numberOfItems() == 0 {
      let cell: EmptyDataTableViewCell = tableView.dequeueReusableCell(for: indexPath)
      return cell
    }
    
    guard let review = presenter?.getReview(index: indexPath.row) else {return UITableViewCell()}
    let cell: MovieReviewTableViewCell = tableView.dequeueReusableCell(for: indexPath)
    cell.lblAuthor.text = review.author
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    let date = dateFormatter.date(from: review.createdAt ?? "")
    cell.lblDateCreated.text = date?.getFormattedDate(format: "dd MMM yyyy, HH:MM:SS")
    let font = UIFont.systemFont(ofSize: 14)
    let html = """
      <html>
      <style type=\"text/css\">
        body { font-family: '\(font.fontName)', sans-serif; font-size: \(font.pointSize); color: \(self.traitCollection.userInterfaceStyle == .dark ? "#FFFFFF" : "#000000"); text-align: justify;}
        p {background-color: rgba(255, 255, 255, 0) !important}
      </style>
      <body>\(review.content ?? "")</body>
      </html>
    """
    
    cell.lblReviewContent.attributedText = html.htmlToAttributedString
    return cell
  }
  
  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    reloadData()
  }
  
  
}
