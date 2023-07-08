//
//  MovieListPresenter.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 07/07/23.
//

import Foundation

protocol MovieListViewToPresenterProtocol: AnyObject {
  func initData()
  func viewDidLoad()
  func getMoreData(completion: @escaping () -> ())
  func getMovie(index: Int) -> Movie
  func numberOfItems() -> Int
  func didSelectMovie(index: Int)
  func getTitle() -> String
}

protocol MovieListPresenterToViewProtocol: AnyObject {
  func configureViews()
  func showLoading()
  func hideLoading()
  func showError(message: String)
  func reloadData()
}

class MovieListPresenter: MovieListViewToPresenterProtocol {
  
  unowned var view: MovieListPresenterToViewProtocol?
  let router: MovieListRouter
  let interactor: MovieListInteractor
  let genreId: String
  let genreName: String
  
  init(view: MovieListPresenterToViewProtocol? = nil, router: MovieListRouter, interactor: MovieListInteractor, genreId: String, genreName: String) {
    self.view = view
    self.router = router
    self.interactor = interactor
    self.genreId = genreId
    self.genreName = genreName
  }
  
  func viewDidLoad() {
    view?.configureViews()
  }
  
  func initData() {
    
    print("genreId: \(genreId)")
    interactor.fetchMovieList(param: .init(page: 1, withGenre: genreId))
    
  }
  
  func getTitle() -> String {
    return genreName
  }
  
  
  func getMovie(index: Int) -> Movie {
    let movies = interactor.movies
    return movies[index]
  }
  
  func getMoreData(completion: @escaping () -> ()) {
    interactor.fetchMoreMovies(param: .init(page: interactor.pages, withGenre: genreId), completion: completion)
  }
  
  func numberOfItems() -> Int {
    print("number of items: \(interactor.movies.count)")
    return interactor.movies.count
  }
  
  func didSelectMovie(index: Int) {
    let movies = interactor.movies
    router.navigate(movieId: "\(movies[index].id ?? 0)")
  }
  
  
}


extension MovieListPresenter: MovieListinteractorToPresenterProtocol {
  
  func movieListFetchSuccess() {
    print("movie Fetch Done")
    view?.hideLoading()
    view?.reloadData()
  }
  
  func movieListFetchFailed(message: String) {
    view?.hideLoading()
    view?.showError(message: message)
  }
  
  
}
