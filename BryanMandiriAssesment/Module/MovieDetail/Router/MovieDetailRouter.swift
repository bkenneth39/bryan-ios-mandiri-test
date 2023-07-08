//
//  MovieDetailRouter.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 07/07/23.
//

import Foundation
import UIKit

protocol MovieDetailRouterProtocol: AnyObject {
  func navigateToReviews(movieId: String, movieName: String)
}

final class MovieDetailRouter {
  weak var viewController: MovieDetailViewController?
  
  static func createModule(movieId: String) -> MovieDetailViewController {
    
      let view = MovieDetailViewController()
      let interactor = MovieDetailInteractor()
      let router = MovieDetailRouter()
      let presenter = MovieDetailPresenter(view: view, router: router, interactor: interactor, movieId: movieId)
      interactor.presenter = presenter
      view.presenter = presenter
      router.viewController = view
      return view
  }
}

extension MovieDetailRouter: MovieDetailRouterProtocol {
  func navigateToReviews(movieId: String, movieName: String) {
    let movieReviewsVC = MovieReviewsRouter.createModule(movieId: movieId, movieName: movieName)
    viewController?.navigationController?.pushViewController(movieReviewsVC, animated: true)
  }
  
  
}

