//
//  MovieReviewsPresenter.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 08/07/23.
//

import Foundation

protocol MovieReviewsViewToPresenterProtocol: AnyObject {
  func initData()
  func viewDidLoad()
  func getMoreData(completion: @escaping () -> ())
  func getReview(index: Int) -> MovieReview
  func numberOfItems() -> Int
  func didSelectReview(index: Int)
  func getTitle() -> String
}

protocol MovieReviewsPresenterToViewProtocol: AnyObject {
  func configureViews()
  func showLoading()
  func hideLoading()
  func showError(message: String)
  func reloadData()
}

class MovieReviewsPresenter: MovieReviewsViewToPresenterProtocol {
  
  unowned var view: MovieReviewsPresenterToViewProtocol?
  let router: MovieReviewsRouter
  let interactor: MovieReviewsInteractor
  let movieId: String
  let movieName: String
  
  init(view: MovieReviewsPresenterToViewProtocol? = nil, router: MovieReviewsRouter, interactor: MovieReviewsInteractor, movieId: String, movieName: String) {
    self.view = view
    self.router = router
    self.interactor = interactor
    self.movieId = movieId
    self.movieName = movieName
  }
  
  func initData() {
    print("movieid: \(movieId)")
    view?.showLoading()
    interactor.fetchMovieRevies(param: .init(page: 1, withGenre: movieId))
  }
  
  func viewDidLoad() {
    view?.configureViews()
  }
  
  func getMoreData(completion: @escaping () -> ()) {
    interactor.fetchMoreReviews(param: .init(page: interactor.pages, withGenre: movieId), completion: completion)
  }
  
  func getReview(index: Int) -> MovieReview {
    let reviews = interactor.movieReviews
    return reviews[index]
  }
  
  func getTitle() -> String {
    return movieName
  }
  
  func numberOfItems() -> Int {
    return interactor.movieReviews.count
  }
  
  func didSelectReview(index: Int) {
    
  }
}

extension MovieReviewsPresenter: MovieReviewsInteractorToPresenterProtocol {
  func moviesReviewsFetchSuccess() {
    view?.hideLoading()
    view?.reloadData()
  }
  
  func moviesReviewsFetchFailed(message: String) {
    view?.hideLoading()
  }
  
  
}
