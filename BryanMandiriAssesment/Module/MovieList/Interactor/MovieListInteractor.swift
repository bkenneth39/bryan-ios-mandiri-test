//
//  MovieListInteractor.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 07/07/23.
//

import Foundation
import ObjectMapper

protocol MovieListPresenterToInteractorProtocol: AnyObject {
  func fetchMovieList(param: MovieParam)
  func fetchMoreMovies(param: MovieParam, completion: @escaping () -> ())
}

protocol MovieListinteractorToPresenterProtocol: AnyObject {
  func movieListFetchSuccess()
  func movieListFetchFailed(message: String)
}

class MovieListInteractor: MovieListPresenterToInteractorProtocol {
  
  var pages: Int = 1
  var totalPages: Int = 2
  var movies: [Movie] = []
  var presenter: MovieListinteractorToPresenterProtocol?
  
  func fetchMovieList(param: MovieParam) {
    if pages < totalPages {
      NetworkService.shared.makeRequest(api: .getMovieList(param: param), mappableType: MovieListResponse.self) {[weak self] result, error in
        if let error = error {
          self?.presenter?.movieListFetchFailed(message: error.localizedDescription)
        } else if let result = result, let results = result.results {
          
          self?.movies = results
          
          self?.totalPages = result.totalPages ?? 0
          print("number of result: \(self?.movies.count)")
          self?.pages += 1
          self?.presenter?.movieListFetchSuccess()
        } else {
          self?.presenter?.movieListFetchFailed(message: Constants.otherErrorMsg)
        }
         
      }
    }
    
  }
  
  func fetchMoreMovies(param: MovieParam, completion: @escaping () -> ()) {
    if pages < totalPages {
      NetworkService.shared.makeRequest(api: .getMovieList(param: param), mappableType: MovieListResponse.self) { [weak self] result, error in
        if let error = error {
          self?.presenter?.movieListFetchFailed(message: error.localizedDescription)
          completion()
        } else if let result = result, let results = result.results {
          self?.movies.append(contentsOf: results)
          print("number of result: \(self?.movies.count)")
          self?.pages += 1
          completion()
        } else {
          self?.presenter?.movieListFetchFailed(message: Constants.otherErrorMsg)
          completion()
        }
      }
    } else {
      completion()
    }
    
  }
  
  
}
