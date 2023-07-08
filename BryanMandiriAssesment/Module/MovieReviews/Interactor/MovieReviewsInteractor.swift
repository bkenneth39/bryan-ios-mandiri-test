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
  func moviesReviewsFetchFailed()
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
          self?.presenter?.moviesReviewsFetchFailed()
        } else if let result = result {
          self?.movieReviews = result.results ?? []
          self?.totalPages = result.totalPages ?? 0
          self?.pages += 1
          self?.presenter?.moviesReviewsFetchSuccess()
        }
      }
    }
  }
  
  func fetchMoreReviews(param: MovieParam, completion: @escaping () -> ()) {
    if pages < totalPages {
      NetworkService.shared.makeRequest(api: .getMovieReviews(param: param), mappableType: MovieReviewsResponse.self) { [weak self] result, error in
        if let error = error {
          self?.presenter?.moviesReviewsFetchFailed()
        } else if let result = result {
          self?.movieReviews.append(contentsOf: result.results ?? [])
          self?.pages += 1
          completion()
        }
      }
    } else {
      completion()
    }
  }
  
  
}
