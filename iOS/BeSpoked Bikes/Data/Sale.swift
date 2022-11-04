//
//  Sale.swift
//  BeSpoked Bikes
//
//  Created by Matt Free on 11/3/22.
//

import Foundation

struct Sale: Identifiable {
    var id: String { "\(product.manufacturer) \(product.name), \(salesperson.firstName) \(salesperson.lastName), \(customer.firstName) \(customer.lastName)" }
    
    let product: Product
    let salesperson: Salesperson
    let customer: Customer
    let saleDate: Date
}
