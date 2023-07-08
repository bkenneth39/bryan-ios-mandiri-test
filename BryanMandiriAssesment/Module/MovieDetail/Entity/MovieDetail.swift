//
//  MovieDetail.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 07/07/23.
//

import Foundation

public protocol MovieDetail {
  var adult: Bool? { get }
  var backdropPath: String? { get }
  var belongsToCollection: MovieDetailBelongToCollection? { get }
  var budget: Int? { get }
  var genres: [Genre]? { get }
  var homepage: String? { get }
  var id: Int? { get }
  var imdbId: String? { get }
  var originalLanguage: String? { get }
  var originalTitle: String? { get }
  var overview: String? { get }
  var popularity: Float? { get }
  var posterPath: String? { get }
  var productionCompanies: [ProductionCompany]? { get }
  var productionCountries: [ProductionCountry]? { get }
  var releaseDate: String? { get }
  var revenue: Int? { get }
  var runtime: Int? { get }
  var spokenLanguages: [MovieLanguage]? { get }
  var status: String? { get }
  var tagline: String? { get }
  var title: String? { get }
  var video: Bool? { get }
  var voteAverage: Float? { get }
  var voteCount: Int? { get }
}

public protocol MovieDetailBelongToCollection {
  var id: Int? { get }
  var name: String? { get }
  var posterPath: String? { get }
  var backdropPath: String? { get }
}

public protocol MovieLanguage {
  var englishName: String? { get }
  var iso: String? { get }
  var name: String? { get }
}

public protocol ProductionCompany {
  var id: Int? { get }
  var logoPath: String? { get }
  var name: String? { get }
  var originCountry: String? { get }
}

public protocol ProductionCountry {
  var iso: String? { get }
  var name: String? { get }
}

public protocol MovieTrailerData {
  var id: Int? { get }
  var results: [MovieTrailer]? { get }
}

public protocol MovieTrailer {
  var iso: String? { get }
  var isoC: String? { get }
  var name: String? { get }
  var key: String? { get }
  var site: String? { get }
  var size: Int? { get }
  var type: String? { get }
  var official: Bool? { get }
  var publishedAt: String? { get }
  var id: String? { get }
}
