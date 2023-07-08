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
    return URL(string: "https://api.themoviedb.org/3")!
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
    return ["Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyNmJkMzE4YjgwZjYwYzQ4OGM1M2I4ZTQzMWE4N2JiNCIsInN1YiI6IjY0YTZkNzZlNzI0ZGUxMDBhY2E2Yzk1MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.3C89BzHbZliNwBLClDHu_RZ3NceUK09OVWEkWWTs37U"]
  }
  
  
}
