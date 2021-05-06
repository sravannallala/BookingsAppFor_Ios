//
//  UserList.swift
//  BookingApp
//
//  Created by sravan on 5/4/21.
//  Copyright © 2018 zenchef. All rights reserved.
//
import Foundation

struct UserList: NetworkProtocol {

    let maxBooking: Int
    var urlString: String {
        return BaseURL.userBaseURL
    }
    
    var method: URLMethod {
        .GET
    }
    
    var queryItems: [URLQueryItem]? {
        return [
          URLQueryItem(name: "results", value: String(maxBooking))
        ]
    }
}
