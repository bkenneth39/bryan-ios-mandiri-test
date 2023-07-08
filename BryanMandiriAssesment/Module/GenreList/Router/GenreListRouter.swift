//
//  GenreListRouter.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 06/07/23.
//

import Foundation
import UIKit

protocol GenreListRouterProtocol: AnyObject {
  func navigate(genreId: String, genreName: String)
}

final class GenreListRouter {
  weak var viewController: GenreListViewController?
  
  static func createModule() -> GenreListViewController {
    
      let view = GenreListViewController()
      let interactor = GenreListInteractor()
      let router = GenreListRouter()
      let presenter = GenreListPresenter(view: view, router: router, interactor: interactor)
      interactor.presenter = presenter
      view.presenter = presenter
      router.viewController = view
      return view
  }
}

extension GenreListRouter: GenreListRouterProtocol {
  func navigate(genreId: String, genreName: String) {
    let movieListVC = MovieListRouter.createModule(genreId: genreId, genreName: genreName)
    viewController?.navigationController?.pushViewController(movieListVC, animated: true)
  }
  
  
}
