//
//  Salesperson.swift
//  BeSpoked Bikes
//
//  Created by Matt Free on 11/3/22.
//

import Foundation

struct Salesperson: Equatable, Identifiable {
    var id: String { firstName + lastName }
    
    var firstName: String
    var lastName: String
    var address: String
    var phoneNumber: String
    var startDate: Date
    var terminationDate: Date?
    var manager: String
    
    init(firstName: String, lastName: String, address: String, phoneNumber: String, startDate: Date, terminationDate: Date?, manager: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.phoneNumber = phoneNumber
        self.startDate = startDate
        self.terminationDate = terminationDate
        self.manager = manager
    }
}
