//
//  GenreListResponse.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 07/07/23.
//

import Foundation
import ObjectMapper

public struct GenreListResponse: GenreList, Mappable {
  
  public var genres: [Genre]? {
    _genres
  }
  public var _genres: [GenreResponse]?
  
  public init?(map: ObjectMapper.Map) {
    mapping(map: map)
  }
  
  public mutating func mapping(map: ObjectMapper.Map) {
    _genres <- map["genres"]
  }
  
}

public struct GenreResponse: Genre, Mappable {
  
  public var id: Int?
  public var name: String?
  
  public init?(map: ObjectMapper.Map) {
    mapping(map: map)
  }
  
  public mutating func mapping(map: ObjectMapper.Map) {
    id <- map["id"]
    name <- map["name"]
  }
  
  
}
