//
//  GenreList.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 07/07/23.
//

import Foundation

public protocol GenreList {
  var genres: [Genre]? { get }
}

public protocol Genre {
  var id: Int? { get }
  var name: String? { get }
}
