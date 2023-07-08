//
//  MovieListRouter.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 07/07/23.
//

import Foundation
import UIKit

protocol MovieListRouterProtocol: AnyObject {
  func navigate(movieId: String)
}

final class MovieListRouter {
  weak var viewController: MovieListViewController?
  
  static func createModule(genreId: String, genreName: String) -> MovieListViewController {
    
      let view = MovieListViewController()
      let interactor = MovieListInteractor()
      let router = MovieListRouter()
      let presenter = MovieListPresenter(view: view, router: router, interactor: interactor, genreId: genreId, genreName: genreName)
      interactor.presenter = presenter
      view.presenter = presenter
      router.viewController = view
      return view
  }
}

extension MovieListRouter: MovieListRouterProtocol {
  func navigate(movieId: String) {
    let movieDetailVC = MovieDetailRouter.createModule(movieId: movieId)
    viewController?.navigationController?.pushViewController(movieDetailVC, animated: true)
  }
}

