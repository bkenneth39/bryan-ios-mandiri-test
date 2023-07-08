//
//  MovieDetailInteractor.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 07/07/23.
//

import Foundation
import ObjectMapper

protocol MovieDetailPresenterToInteractorProtocol: AnyObject {
  func fetchMovieDetail(movieId: String)
}

protocol MovieDetailInteractorToPresenterProtocol: AnyObject {
  func movieDetailFetchSuccess()
  func movieDetailFetchFailed()
  func movieDetailTrailerFetchSuccess()
  func movieDetailTrailerFetchFailed()
  
}

class MovieDetailInteractor: MovieDetailPresenterToInteractorProtocol {
  
  var movieDetail: MovieDetail?
  var movieTrailers: [MovieTrailer]?
  var presenter: MovieDetailInteractorToPresenterProtocol?
  
  func fetchMovieTrailer(movieId: String) {
    NetworkService.shared.makeRequest(api: .getMovieTrailer(movieId: movieId), mappableType: MovieTrailerDataResponse.self) { [weak self] result, error in
      if let error = error {
        self?.presenter?.movieDetailTrailerFetchFailed()
      } else if let result = result {
        self?.movieTrailers = result.results
        self?.presenter?.movieDetailTrailerFetchSuccess()
      }
    }
  }
  
  func fetchMovieDetail(movieId: String) {
    NetworkService.shared.makeRequest(api: .getMovieDetail(movieId: movieId), mappableType: MovieDetailResponse.self) { [weak self] result, error in
      
      if let error = error {
        self?.presenter?.movieDetailFetchFailed()
      } else if let result = result {
        self?.movieDetail = result
        self?.presenter?.movieDetailFetchSuccess()
      }
    }
  }
}
