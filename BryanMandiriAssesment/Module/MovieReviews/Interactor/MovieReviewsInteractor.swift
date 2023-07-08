//
//  MovieReviewsInteractor.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 08/07/23.
//

import Foundation
import ObjectMapper

protocol MovieReviewsPresenterToInteractorProtocol: AnyObject {
  func fetchMovieRevies(param: MovieParam)
  func fetchMoreReviews(param: MovieParam, completion: @escaping () -> ())
}

protocol MovieReviewsInteractorToPresenterProtocol: AnyObject {
  func moviesReviewsFetchSuccess()
  func moviesReviewsFetchFailed(message: String)
}

class MovieReviewsInteractor: MovieReviewsPresenterToInteractorProtocol {
  
  var pages: Int = 1
  var totalPages: Int = 2
  var movieReviews: [MovieReview] = []
  var presenter: MovieReviewsInteractorToPresenterProtocol?
  
  func fetchMovieRevies(param: MovieParam) {
    if pages < totalPages {
      NetworkService.shared.makeRequest(api: .getMovieReviews(param: param), mappableType: MovieReviewsResponse.self) { [weak self] result, error in
        
        if let error = error {
          self?.presenter?.moviesReviewsFetchFailed(message: error.localizedDescription)
        } else if let result = result, let results = result.results {
          self?.movieReviews = results
          self?.totalPages = result.totalPages ?? 0
          self?.pages += 1
          self?.presenter?.moviesReviewsFetchSuccess()
        } else {
          self?.presenter?.moviesReviewsFetchFailed(message: Constants.otherErrorMsg)
        }
      }
    }
  }
  
  func fetchMoreReviews(param: MovieParam, completion: @escaping () -> ()) {
    if pages < totalPages {
      NetworkService.shared.makeRequest(api: .getMovieReviews(param: param), mappableType: MovieReviewsResponse.self) { [weak self] result, error in
        if let error = error {
          self?.presenter?.moviesReviewsFetchFailed(message: error.localizedDescription)
        } else if let result = result, let results = result.results {
          self?.movieReviews.append(contentsOf: results)
          self?.pages += 1
          completion()
        } else {
          self?.presenter?.moviesReviewsFetchFailed(message: Constants.otherErrorMsg)
          completion()
        }
      }
    } else {
      completion()
    }
  }
  
  
}
