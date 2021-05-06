//
//  DateWithFormat.swift
//  BookingApp
//
//  Created by sravan on 5/4/21.
//  Copyright © 2018 zenchef. All rights reserved.
//
import Foundation

struct DateWithFormat<T: CustomDateFormatter>: Codable {
  let value: Date

  init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    let text = try container.decode(String.self)
    guard let date = T.dateFormatter.date(from: text) else {
      let context = DecodingError.Context(codingPath: [], debugDescription: "Error converting date \(text) using format \(T.dateFormatter.dateFormat ?? "")")
      throw Swift.DecodingError.typeMismatch(Date.self, context)
    }
    value = date
  }

  func encode(to encoder: Encoder) throws {
    let stringValue = T.dateFormatter.string(from: value)
    var container = encoder.singleValueContainer()
    try container.encode(stringValue)
  }
  init(value: Date) {
    self.value = value
  }
}
