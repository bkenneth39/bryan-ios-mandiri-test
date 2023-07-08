//
//  MovieDetailViewController.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 07/07/23.
//

import UIKit

class MovieDetailViewController: UIViewController {

  @IBOutlet weak var tblMovieDetail: UITableView!
  var presenter: MovieDetailViewToPresenterProtocol?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    presenter?.initData()
  }

}

extension MovieDetailViewController: MovieDetailPresenterToViewProtocol {
  func configureViews() {
    tblMovieDetail.delegate = self
    tblMovieDetail.dataSource = self
    tblMovieDetail.register(cellType: MovieDetailInfoTableViewCell.self)
    tblMovieDetail.separatorStyle = .none
    tblMovieDetail.register(headerFooterViewType: SectionHeaderView.self)
    tblMovieDetail.register(cellType: MovieDetailReviewButtonsTableViewCell.self)
    tblMovieDetail.register(cellType: MovieDetailOverviewTableViewCell.self)
  }
  
  func showLoading() {
    
  }
  
  func hideLoading() {
    
  }
  
  func reloadData() {
    tblMovieDetail.reloadData()
  }
  
  
}

extension MovieDetailViewController: UITableViewDelegate, UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    print("number: \(presenter?.numberOfItems())")
    return presenter?.numberOfItems() ?? 0
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let sections = presenter?.getTableSections()
    guard let sections = sections else {return 0.0}
    switch sections[indexPath.section] {
    case .generalInfo:
      return 275.0
    default:
      return UITableView.automaticDimension
    }
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let sections = presenter?.getTableSections()
    guard let sections = sections else {return UIView()}
    let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: SectionHeaderView.reuseIdentifier) as! SectionHeaderView
    let backgroundView = UIView(frame: header.bounds)
    backgroundView.backgroundColor = .white
    header.backgroundView = backgroundView
    header.lblTitle.text = sections[section].rawValue
    
    return header
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    let sections = presenter?.getTableSections()
    guard let sections = sections else {return 0.0}
    switch sections[section] {
    case .generalInfo:
      return 0.0
    default:
      return 50.0
    }
  }
  
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 0.0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let sections = presenter?.getTableSections()
    let movieDetail = presenter?.getDetailMovie()
    guard let sections = sections, let movieDetail = movieDetail else {return UITableViewCell()}
    
    print("movie Detail: \(movieDetail)")
    switch sections[indexPath.section] {
    case .generalInfo:
      let cell: MovieDetailInfoTableViewCell = tableView.dequeueReusableCell(for: indexPath)
      let url = URL(string: "https://image.tmdb.org/t/p/original/\(movieDetail.posterPath ?? "")")
      cell.imgPoster.kf.setImage(with: url)
      cell.lblMovieTitle.text = movieDetail.title
      cell.lblVote.text = "\(movieDetail.voteAverage ?? 0.0) (\(movieDetail.voteCount ?? 0))"
      cell.lblPopular.text = "\(movieDetail.popularity ?? 0.0)"
      cell.lblGenre.text = presenter?.getGenre()
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "yyyy-MM-dd"
      let date = dateFormatter.date(from: movieDetail.releaseDate ?? "")
      cell.lblReleaseDate.text = "Release Date: \(date?.getFormattedDate(format: "dd MMM yyyy") ?? "")"
      cell.goToFunction = presenter?.goToReview
      return cell
    case .userReviews:
      let cell: MovieDetailReviewButtonsTableViewCell = tableView.dequeueReusableCell(for: indexPath)
      let trailer = presenter?.getMovieTrailer()
      print("trailer: \(trailer)")
      cell.playerTrailer.load(withVideoId: trailer?.key ?? "")
      return cell
    case .overview:
      let cell: MovieDetailOverviewTableViewCell = tableView.dequeueReusableCell(for: indexPath)
      cell.lblOverview.text = movieDetail.overview
      return cell
    case .production:
      return UITableViewCell()
    }
  }
  
  
}
