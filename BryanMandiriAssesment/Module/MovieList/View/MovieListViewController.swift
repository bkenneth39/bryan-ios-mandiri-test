//
//  MovieListViewController.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 07/07/23.
//

import UIKit
import UIScrollView_InfiniteScroll

class MovieListViewController: UIViewController {

  @IBOutlet weak var colMovies: UICollectionView!
  var presenter: MovieListViewToPresenterProtocol?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.viewDidLoad()
    print("initing data")
    presenter?.initData()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
  }

}

extension MovieListViewController: MovieListPresenterToViewProtocol {
  func showError(message: String) {
    self.showErrorAlert(message: message)
  }
  
  func configureViews() {
    self.title = "\(presenter?.getTitle() ?? "") Movie List"
    colMovies.delegate = self
    colMovies.dataSource = self
    colMovies.register(cellType: MovieListCollectionViewCell.self)
    colMovies.infiniteScrollDirection = .vertical
    colMovies.addInfiniteScroll { colMovies in
      print("infinite added")
      let startIndex = (self.presenter?.numberOfItems() ?? 0) - 1 <= 0 ? 0 : (self.presenter?.numberOfItems() ?? 0)
      self.presenter?.getMoreData {
        
        
        let endIndex = (self.presenter?.numberOfItems() ?? 0) - 1
        if endIndex > startIndex {
          let indices = Array(startIndex...endIndex).compactMap({
            return IndexPath(row: $0, section: 0)
          })
          print("finishing infinite")
          colMovies.insertItems(at: indices)
        }
        
        colMovies.finishInfiniteScroll()
      }
      
      
    }
  }
  
  func showLoading() {
    
  }
  
  func hideLoading() {
    
  }
  
  func reloadData() {
    colMovies.reloadData()
  }
  
  
}

extension MovieListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    guard let presenter = presenter else {return 0}
    print("fetching sum items")
    return presenter.numberOfItems()
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    presenter?.didSelectMovie(index: indexPath.row)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/3)
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell: MovieListCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
    let movie = presenter?.getMovie(index: indexPath.row)
    let urlImage = URL(string: "https://image.tmdb.org/t/p/original/\(movie?.posterPath ?? "")")
    cell.imgPoster.kf.setImage(with: urlImage)
    cell.lblTitle.text = movie?.title
    cell.lblRating.text = "\(movie?.voteAverage ?? 0.0) (\(movie?.voteCount ?? 0))"
    return cell
  }
  
  
}
