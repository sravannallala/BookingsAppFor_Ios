//
//  Client.swift
//  BookingApp
//
//  Created by Zenchef on 21/08/2018.
//  Copyright © 2018 zenchef. All rights reserved.
//

import Foundation

class Client {
    func getBookings(_ maxBooking: Int) -> [Booking] {
        var bookings: [Booking] = []
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        UserList(maxBooking: maxBooking).request(type: UserResultList.self) { (error, data) in
            if let results = data?.results {
                bookings = results.map { User(firstName: $0.name?.first ?? "",
                                            lastName: $0.name?.last ?? "",
                                            gender: $0.gender ?? .female,
                                            email: $0.email,
                                            phone: $0.phone)}.map({ Booking(user: $0) })
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.wait()
        return bookings
    }
}
