//
//  MovieReviewsResponse.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 08/07/23.
//

import Foundation
import ObjectMapper

public struct MovieReviewsResponse: MovieReviews, Mappable {
  public var page: Int?
  
  public var results: [MovieReview]? {
    _results
  }
  public var _results: [MovieReviewResponse]?
  
  public var totalPages: Int?
  
  public var totalResults: Int?
  
  public init?(map: ObjectMapper.Map) {
    mapping(map: map)
  }
  
  public mutating func mapping(map: ObjectMapper.Map) {
    page <- map["page"]
    _results <- map["results"]
    totalPages <- map["total_pages"]
    totalResults <- map["total_results"]
  }
  
}

public struct MovieReviewResponse: MovieReview, Mappable {
  
  public var author: String?
  public var authorDetails: AuthorDetail? {
    _authorDetails
  }
  public var _authorDetails: AuthorDetailResponse?
  public var content: String?
  public var createdAt: String?
  public var id: String?
  public var updatedAt: String?
  public var url: String?
  
  public init?(map: ObjectMapper.Map) {
    mapping(map: map)
  }
  
  public mutating func mapping(map: ObjectMapper.Map) {
    author <- map["author"]
    _authorDetails <- map["author_details"]
    content <- map["content"]
    createdAt <- map["created_at"]
    id <- map["id"]
    updatedAt <- map["updated_at"]
    url <- map["url"]
  }
  
}

public struct AuthorDetailResponse: AuthorDetail, Mappable {
  
  public var name: String?
  public var username: String?
  public var avatarPath: String?
  public var rating: Int?
  
  public init?(map: ObjectMapper.Map) {
    mapping(map: map)
  }
  
  public mutating func mapping(map: ObjectMapper.Map) {
    name <- map["name"]
    username <- map["username"]
    avatarPath <- map["avatar_path"]
    rating <- map["rating"]
  }
  
  
}
