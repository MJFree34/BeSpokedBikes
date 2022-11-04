//
//  Product.swift
//  BeSpoked Bikes
//
//  Created by Matt Free on 11/3/22.
//

import Foundation

struct Product: Equatable, Identifiable {
    var id: String { "\(manufacturer) \(name)" }
    
    var name: String
    var manufacturer: String
    var style: String
    var purchasePrice: Double
    var salePrice: Double
    var quantityOnHand: Int
    var commissionPercentage: Int
}
