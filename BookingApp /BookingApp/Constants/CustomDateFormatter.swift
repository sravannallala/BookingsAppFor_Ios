//
//  CustomDateFormatter.swift
//  BookingApp
//
//  Created by sravan on 5/4/21.
//  Copyright © 2018 zenchef. All rights reserved.
//
import Foundation

protocol CustomDateFormatter {
  static var dateType: DateType { get }
}

extension CustomDateFormatter {
  static var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = dateType.rawValue
    return formatter
  }
}

struct Format1: CustomDateFormatter {
  static var dateType: DateType {
    return .format1
  }
}
