//
//  NetworkProtocal.swift
//  BookingApp
//
//  Created by sravan on 5/4/21.
//  Copyright © 2018 zenchef. All rights reserved.
//
import Foundation

protocol NetworkProtocol {
    var urlString: String { get }
    var method: URLMethod { get }
    var queryItems: [URLQueryItem]? { get }
}

enum URLMethod: String {
  case GET
  case POST
  case DELETE
  case PUT
  case PATCH
}

extension String {
  func url(withQueryItems queryItems: [URLQueryItem]? = nil) -> URL? {
    var urlComponents = URLComponents(string: self)
    
    if queryItems?.count ?? 0 > 0 {
      urlComponents?.queryItems = queryItems
    }
    
    return urlComponents?.url
  }
}


extension NetworkProtocol {
    var urlString: URL? {
      guard let url = urlString.url(withQueryItems: queryItems?.filter({ $0.value != nil })) else { return nil }
      return url
    }
        
    func request<T: Decodable>(type: T.Type, completionHandler: @escaping (_ error: Error?, _ obj: T?) -> ()) {
        guard let finalURL = urlString else {
            completionHandler(nil, nil)
            return
        }
        URLSession.shared.dataTask(with: finalURL) { (data, response, error) in
            if error != nil{
                completionHandler(error, nil)
                return
            }
            do {
                let dataObj = try JSONDecoder().decode(T.self, from: data!)
                completionHandler(nil, dataObj)
            } catch let error {
                completionHandler(error, nil)
                return
            }
        }.resume()
    }
}
