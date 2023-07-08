//
//  GenreListInteractor.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 06/07/23.
//

import Foundation
import ObjectMapper


protocol GenreListPresenterToInteractorProtocol: AnyObject {
  func fetchMoviesGenre()
}

protocol GenreListInteractorToPresenterProcol: AnyObject {
  func moviesGenreFetchSuccess()
  func moviesGenreFetchFailed(message: String)
}

class GenreListInteractor: GenreListPresenterToInteractorProtocol {
  
  var genres: GenreList?
  var presenter: GenreListInteractorToPresenterProcol?
  
  func fetchMoviesGenre() {
    NetworkService.shared.makeRequest(api: .getGenreList, mappableType: GenreListResponse.self) { [weak self] (result, error) in
      if let error = error {
        self?.presenter?.moviesGenreFetchFailed(message: error.localizedDescription)
      } else if let result = result, let _ = result.genres {
        print("result: \(result)")
        self?.genres = result
        self?.presenter?.moviesGenreFetchSuccess()
      } else {
        self?.presenter?.moviesGenreFetchFailed(message: Constants.otherErrorMsg)
      }
    }
  }
  

  
}


