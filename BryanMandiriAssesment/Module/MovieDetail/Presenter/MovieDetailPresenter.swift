//
//  MovieDetailPresenter.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 07/07/23.
//

import Foundation

protocol MovieDetailViewToPresenterProtocol: AnyObject {
  func initData()
  func viewDidLoad()
  func getDetailMovie() -> MovieDetail?
  func getMovieTrailer() -> MovieTrailer?
  func numberOfItems() -> Int
  func goToReview()
  func getTableSections() -> [MovieDetailSection]
  func getGenre() -> String
}

protocol MovieDetailPresenterToViewProtocol: AnyObject {
  func configureViews()
  func showLoading()
  func hideLoading()
  func showError(message: String)
  func reloadData()
}

enum MovieDetailSection: String {
  case generalInfo = ""
  case trailer = "Trailer"
  case overview = "Overview"
  case production = "Producted by"
}

class MovieDetailPresenter: MovieDetailViewToPresenterProtocol {
  
  unowned var view: MovieDetailPresenterToViewProtocol?
  let router: MovieDetailRouter
  let interactor: MovieDetailInteractor
  let movieId: String
  let tableSections: [MovieDetailSection] = [.generalInfo, .trailer, .overview, .production]
  
  init(view: MovieDetailPresenterToViewProtocol? = nil, router: MovieDetailRouter, interactor: MovieDetailInteractor, movieId: String) {
    self.view = view
    self.router = router
    self.interactor = interactor
    self.movieId = movieId
  }
  
  func initData() {
    view?.showLoading()
    interactor.fetchMovieDetail(movieId: movieId)
  }
  
  func getTableSections() -> [MovieDetailSection] {
    return tableSections
  }
  
  func getGenre() -> String {
    let movieDetailGenres = interactor.movieDetail?.genres
    
    guard let movieDetailGenres = movieDetailGenres else {return ""}
    let genres = movieDetailGenres.map {$0.name ?? ""}
    
    let genreResult = genres.joined(separator: ",")
    return genreResult
    
  }
  
  func viewDidLoad() {
    view?.configureViews()
  }
  
  func getMovieTrailer() -> MovieTrailer? {
    let trailers = interactor.movieTrailers
    let filteredTrailer = trailers?.filter{$0.type == "Trailer"}
    guard let filteredTrailer = filteredTrailer, !filteredTrailer.isEmpty else {return nil}
    return filteredTrailer[0]
  }
  
  
  func getDetailMovie() -> MovieDetail? {
    return interactor.movieDetail
  }
  
  func numberOfItems() -> Int {
    return tableSections.count
  }
  
  func goToReview() {
    let movie = interactor.movieDetail
    router.navigateToReviews(movieId: movieId, movieName: movie?.title ?? "")
  }
  
  
}

extension MovieDetailPresenter: MovieDetailInteractorToPresenterProtocol {
  func movieDetailFetchSuccess() {
    view?.hideLoading()
    interactor.fetchMovieTrailer(movieId: movieId)
    view?.reloadData()
  }
  
  func movieDetailFetchFailed(message: String) {
    view?.hideLoading()
    view?.showError(message: message)
  }
  
  func movieDetailTrailerFetchSuccess() {
    view?.hideLoading()
    view?.reloadData()
  }
  
  func movieDetailTrailerFetchFailed() {
    view?.hideLoading()
    view?.reloadData()
  }
  
  
}
