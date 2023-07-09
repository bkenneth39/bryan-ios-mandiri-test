//
//  NetworkService.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 06/07/23.
//

import Foundation
import Moya
import ObjectMapper


final class NetworkService {
  static let shared = NetworkService()
  
  func makeRequest<T: Mappable>(api: MovieAPI, mappableType: T.Type, completionHandler: @escaping (T?, Error?) -> ()) {
//    let subject = ReplaySubject<T>.createUnbounded()
    
    let provider = MoyaProvider<MovieAPI>()
    
    provider.request(api) { result in
      switch result {
        
      case .success(let response):
        do {
          let json = try response.mapJSON()
          guard let json = json as? [String: Any] else {return}
          if let data = Mapper<T>().map(JSON: json) {
            completionHandler(data, nil)
//            subject.onNext(data)
          }
        } catch {
          completionHandler(nil, error)
        }
      case .failure(let error):
        completionHandler(nil, error)
      }
    }
    
//    return subject
  }
}
