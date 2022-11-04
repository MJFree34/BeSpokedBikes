//
//  Product.swift
//  BeSpoked Bikes
//
//  Created by Matt Free on 11/3/22.
//

import Foundation

struct Product: Equatable {
    let name: String
    let manufacturer: String
    let style: String
    let purchasePrice: Double
    let salePrice: Double?
    let quantityOnHand: Int
    let commissionPercentage: Int
}
