//
//  MovieParam.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 07/07/23.
//

import Foundation

public struct MovieParam: Encodable {
  public var page: Int?
  public var withGenre: String?
  
  public init(page: Int? = 1, withGenre: String? = ""){
    self.page = page
    self.withGenre = withGenre
  }
}
