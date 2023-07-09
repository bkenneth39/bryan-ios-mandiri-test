//
//  MovieAPI.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 06/07/23.
//

import Foundation
import Moya

enum MovieAPI {
  case getGenreList
  case getMovieList(param: MovieParam)
  case getMovieDetail(movieId: String)
  case getMovieTrailer(movieId: String)
  case getMovieReviews(param: MovieParam)
}

extension MovieAPI: TargetType {
  var baseURL: URL {
    return URL(string: Constants.baseUrl)!
  }
  
  var path: String {
    switch self {
      
    case .getGenreList:
      return "/genre/movie/list"
    case .getMovieList:
      return "/discover/movie"
    case .getMovieDetail (let movieId):
      return "/movie/\(movieId)"
    case .getMovieTrailer (let movieId):
      return "/movie/\(movieId)/videos"
    case .getMovieReviews(let param):
      return "/movie/\(param.withGenre ?? "")/reviews"
    }
  }
  
  var method: Moya.Method {
    switch self {
    
    case .getGenreList, .getMovieList, .getMovieDetail, .getMovieTrailer, .getMovieReviews:
      return .get
    }
  }
  
  var task: Moya.Task {
    switch self {
    
    case .getGenreList, .getMovieTrailer, .getMovieDetail, .getMovieReviews:
      return .requestPlain
    case .getMovieList(let param):
      return .requestParameters(parameters: [
        "page": param.page ?? 0,
        "with_genres": param.withGenre ?? ""
      ], encoding: URLEncoding.default)
    }
  }
  
  var headers: [String : String]? {
    return ["Authorization": "Bearer \(Constants.apiKey)"]
  }
  
  
}
