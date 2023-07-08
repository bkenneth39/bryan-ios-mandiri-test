//
//  GenreListInteractor.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 06/07/23.
//

import Foundation
import ObjectMapper
import RxSwift
import RxRelay

protocol GenreListPresenterToInteractorProtocol: AnyObject {
  func fetchMoviesGenre()
}

protocol GenreListInteractorToPresenterProcol: AnyObject {
  func moviesGenreFetchSuccess()
  func moviesGenreFetchFailed(message: String)
}

class GenreListInteractor: GenreListPresenterToInteractorProtocol {
  
  let genreList: BehaviorRelay<[Genre]> = BehaviorRelay(value: [])
  
  var genres: GenreList?
  var presenter: GenreListInteractorToPresenterProcol?
  
  func fetchMoviesGenre() {
    NetworkService.shared.makeRequest(api: .getGenreList, mappableType: GenreListResponse.self) { [weak self] (result, error) in
      if let error = error {
        self?.presenter?.moviesGenreFetchFailed(message: error.localizedDescription)
      } else if let result = result {
        print("result: \(result)")
        self?.genres = result
        print("genres count: \(self?.genres?.genres?.count)")
        self?.presenter?.moviesGenreFetchSuccess()
        self?.genreList.accept(result.genres ?? [])
      } else {
        self?.presenter?.moviesGenreFetchFailed(message: Constants.otherErrorMsg)
      }
    }
  }
  

  
}


