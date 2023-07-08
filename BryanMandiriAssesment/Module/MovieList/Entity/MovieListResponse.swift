//
//  MovieListResponse.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 07/07/23.
//

import Foundation
import ObjectMapper

public struct MovieListResponse: MovieList, Mappable {
  
  public var page: Int?
  public var results: [Movie]? {
    _results
  }
  public var _results: [MovieResponse]?
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

public struct MovieResponse: Movie, Mappable {
  
  public var adult: Bool?
  public var backdropPath: String?
  public var genreIds: [Int]?
  public var id: Int?
  public var originalLanguage: String?
  public var originalTitle: String?
  public var overview: String?
  public var popularity: Float?
  public var posterPath: String?
  public var releaseDate: String?
  public var title: String?
  public var video: Bool?
  public var voteAverage: Float?
  public var voteCount: Int?
  
  public init?(map: ObjectMapper.Map) {
    mapping(map: map)
  }
  
  public mutating func mapping(map: ObjectMapper.Map) {
    adult <- map["adult"]
    backdropPath <- map["backdrop_path"]
    genreIds <- map["genre_ids"]
    id <- map["id"]
    originalLanguage <- map["original_language"]
    originalTitle <- map["original_title"]
    overview <- map["overview"]
    popularity <- map["popularity"]
    posterPath <- map["poster_path"]
    releaseDate <- map["release_date"]
    title <- map["title"]
    video <- map["video"]
    voteAverage <- map["vote_average"]
    voteCount <- map["vote_count"]
  }
  
  
}
