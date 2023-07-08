//
//  MovieDetailResponse.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 07/07/23.
//

import Foundation
import ObjectMapper

public struct MovieDetailResponse: MovieDetail, Mappable {
  
  public var adult: Bool?
  public var backdropPath: String?
  public var belongsToCollection: MovieDetailBelongToCollection?{
    _belongsToCollection
  }
  public var _belongsToCollection: MovieDetailBelongToCollectionResponse?
  public var budget: Int?
  public var genres: [Genre]? {
    _genres
  }
  public var _genres: [GenreResponse]?
  public var homepage: String?
  public var id: Int?
  public var imdbId: String?
  public var originalLanguage: String?
  public var originalTitle: String?
  public var overview: String?
  public var popularity: Float?
  public var posterPath: String?
  public var productionCompanies: [ProductionCompany]? {
    _productionCompanies
  }
  public var _productionCompanies: [ProductionCompanyResponse]?
  public var productionCountries: [ProductionCountry]? {
    _productionCountries
  }
  public var _productionCountries: [ProductionCountryResponse]?
  public var releaseDate: String?
  public var revenue: Int?
  public var runtime: Int?
  public var spokenLanguages: [MovieLanguage]? {
    _spokenLanguages
  }
  public var _spokenLanguages: [MovieLanguageResponse]?
  public var status: String?
  public var tagline: String?
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
    _belongsToCollection <- map["belongs_to_collection"]
    budget <- map["budget"]
    _genres <- map["genres"]
    homepage <- map["homepage"]
    id <- map["id"]
    imdbId <- map["imdb_id"]
    originalLanguage <- map["original_language"]
    originalTitle <- map["original_title"]
    overview <- map["overview"]
    popularity <- map["popularity"]
    posterPath <- map["poster_path"]
    _productionCompanies <- map["production_companies"]
    _productionCountries <- map["production_countries"]
    releaseDate <- map["release_date"]
    revenue <- map["revenue"]
    runtime <- map["runtime"]
    _spokenLanguages <- map["spoken_languages"]
    status <- map["status"]
    tagline <- map["tagline"]
    title <- map["title"]
    video <- map["video"]
    voteAverage <- map["vote_average"]
    voteCount <- map["vote_count"]
    
  }
  
  
}

public struct MovieDetailBelongToCollectionResponse: MovieDetailBelongToCollection, Mappable {
  
  public var id: Int?
  public var name: String?
  public var posterPath: String?
  public var backdropPath: String?
  
  public init?(map: ObjectMapper.Map) {
    mapping(map: map)
  }
  
  public mutating func mapping(map: ObjectMapper.Map) {
    id <- map["id"]
    name <- map["name"]
    posterPath <- map["poster_path"]
    backdropPath <- map["backdrop_path"]
  }
  
  
}

public struct ProductionCompanyResponse: ProductionCompany, Mappable {
  
  public var id: Int?
  public var logoPath: String?
  public var name: String?
  public var originCountry: String?
  
  public init?(map: ObjectMapper.Map) {
    mapping(map: map)
  }
  
  public mutating func mapping(map: ObjectMapper.Map) {
    id <- map["id"]
    logoPath <- map["logo_path"]
    name <- map["name"]
    originCountry <- map["origin_country"]
  }
  
  
}

public struct ProductionCountryResponse: ProductionCountry, Mappable {
  
  public var iso: String?
  public var name: String?
  
  public init?(map: ObjectMapper.Map) {
    mapping(map: map)
  }
  
  public mutating func mapping(map: ObjectMapper.Map) {
    iso <- map["iso_3166_1"]
    name <- map["name"]
  }
}

public struct MovieLanguageResponse: MovieLanguage, Mappable {
  
  public var englishName: String?
  public var iso: String?
  public var name: String?
  
  public init?(map: ObjectMapper.Map) {
    mapping(map: map)
  }
  
  public mutating func mapping(map: ObjectMapper.Map) {
    englishName <- map["english_name"]
    iso <- map["iso_639_1"]
    name <- map["name"]
  }
}

public struct MovieTrailerDataResponse: MovieTrailerData, Mappable {
  
  public var id: Int?
  public var results: [MovieTrailer]?{
    _results
  }
  public var _results: [MovieTrailerResponse]?
  
  public init?(map: ObjectMapper.Map) {
    mapping(map: map)
  }
  
  public mutating func mapping(map: ObjectMapper.Map) {
    id <- map["id"]
    _results <- map["results"]
  }
  
  
}

public struct MovieTrailerResponse: MovieTrailer, Mappable {
  
  public var iso: String?
  public var isoC: String?
  public var name: String?
  public var key: String?
  public var site: String?
  public var size: Int?
  public var type: String?
  public var official: Bool?
  public var publishedAt: String?
  public var id: String?
  
  public init?(map: ObjectMapper.Map) {
    mapping(map: map)
  }
  
  public mutating func mapping(map: ObjectMapper.Map) {
    iso <- map["iso_639_1"]
    isoC <- map["iso_3166_1"]
    name <- map["name"]
    key <- map["key"]
    site <- map["site"]
    size <- map["size"]
    type <- map["type"]
    official <- map["official"]
    publishedAt <- map["published_at"]
    id <- map["id"]
  }
  
  
}
