//
//  MovieReview.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 08/07/23.
//

import Foundation

public protocol MovieReviews {
  var page: Int? { get }
  var results: [MovieReview]? { get }
  var totalPages: Int? { get }
  var totalResults: Int? { get }
}

public protocol MovieReview {
  var author: String? { get }
  var authorDetails: AuthorDetail? { get }
  var content: String? { get }
  var createdAt: String? { get }
  var id: String? { get }
  var updatedAt: String? { get }
  var url: String? { get }
}

public protocol AuthorDetail {
  var name: String? { get }
  var username: String? { get }
  var avatarPath: String? { get }
  var rating: Int? { get }
}
