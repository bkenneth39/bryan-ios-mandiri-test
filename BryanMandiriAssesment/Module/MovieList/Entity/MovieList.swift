//
//  MovieList.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 07/07/23.
//

import Foundation

public protocol MovieList {
  var page: Int? { get }
  var results: [Movie]? { get }
  var totalPages: Int? { get }
  var totalResults: Int? { get }
}

public protocol Movie {
  var adult: Bool? { get }
  var backdropPath: String? { get }
  var genreIds: [Int]? { get }
  var id: Int? { get }
  var originalLanguage: String? { get }
  var originalTitle: String? { get }
  var overview: String? { get }
  var popularity: Float? { get }
  var posterPath: String? { get }
  var releaseDate: String? { get }
  var title: String? { get }
  var video: Bool? { get }
  var voteAverage: Float? { get }
  var voteCount: Int? { get }
}
