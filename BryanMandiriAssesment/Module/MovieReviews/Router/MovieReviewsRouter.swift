//
//  MovieReviewsRouter.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 08/07/23.
//

import Foundation
import UIKit

final class MovieReviewsRouter {
  weak var viewController: MovieReviewsViewController?
  
  static func createModule(movieId: String, movieName: String) -> MovieReviewsViewController {
    let view = MovieReviewsViewController()
    let interactor = MovieReviewsInteractor()
    let router = MovieReviewsRouter()
    let presenter = MovieReviewsPresenter(view: view, router: router, interactor: interactor, movieId: movieId, movieName: movieName)
    interactor.presenter = presenter
    view.presenter = presenter
    router.viewController = view
    return view
  }
}
