//
//  Customer.swift
//  BeSpoked Bikes
//
//  Created by Matt Free on 11/3/22.
//

import Foundation

struct Customer: Identifiable {
    var id: String { "\(firstName) \(lastName)"}
    
    let firstName: String
    let lastName: String
    let address: String
    let phoneNumber: String
    let firstPurchaseDate: Date
}
