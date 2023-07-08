//
//  GenreListPresenter.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 07/07/23.
//

import Foundation

protocol GenreListViewToPresenterProtocol: AnyObject {
  func initData()
  func getGenre(index: Int) -> Genre
  func numberOfItems() -> Int
  func didSelectGenre(index: Int)
}

protocol GenreListPresenterToViewProtocol: AnyObject {
  func configureViews()
  func showLoading()
  func hideLoading()
  func showError(message: String)
  func reloadData()
}

class GenreListPresenter: GenreListViewToPresenterProtocol {
  
  unowned var view: GenreListPresenterToViewProtocol?
  let router: GenreListRouter
  let interactor: GenreListInteractor
  
  init(view: GenreListPresenterToViewProtocol? = nil, router: GenreListRouter, interactor: GenreListInteractor) {
    self.view = view
    self.router = router
    self.interactor = interactor
  }
  
  func initData() {
    view?.showLoading()
    interactor.fetchMoviesGenre()
    view?.configureViews()
  }
  
  func numberOfItems() -> Int {
    print("genres count: \(interactor.genres?.genres?.count ?? 0)")
    return interactor.genres?.genres?.count ?? 0
  }
  
  func getGenre(index: Int) -> Genre {
    let genres = interactor.genres?.genres ?? []
    return genres[index]
  }
  
  func didSelectGenre(index: Int) {
    let genres = interactor.genres?.genres ?? []
    router.navigate(genreId: "\(genres[index].id ?? 0)", genreName: genres[index].name ?? "")
  }
  
}

extension GenreListPresenter: GenreListInteractorToPresenterProcol {
  
  func moviesGenreFetchSuccess() {
    print("fetch success")
    view?.hideLoading()
    view?.reloadData()
  }
  
  func moviesGenreFetchFailed(message: String) {
    view?.hideLoading()
    view?.showError(message: message)
  }
  
  
}
