//
//  BikesViewModel.swift
//  BeSpoked Bikes
//
//  Created by Matt Free on 11/3/22.
//

import Foundation

class BikesViewModel: ObservableObject {
    @Published var salespersons: [Salesperson]
    @Published var products: [Product]
    @Published var customers: [Customer]
    @Published var sales: [Sale]
    
    var selectedSalespersonToEdit: Salesperson?
    
    init(salespersons: [Salesperson], products: [Product], customers: [Customer], sales: [Sale]) {
        self.salespersons = salespersons
        self.products = products
        self.customers = customers
        self.sales = sales
        
        if sales.isEmpty {
            self.sales = [
                Sale(
                    product: products.randomElement()!,
                    salesperson: salespersons.randomElement()!,
                    customer: customers.randomElement()!,
                    saleDate: try! Date("\(Int.random(in: 1...20))/\(Int.random(in: 1...12))/\(Int.random(in: 2012...2022))", strategy: BikesViewModel.dateParseStrategy)
                ),
                Sale(
                    product: products.randomElement()!,
                    salesperson: salespersons.randomElement()!,
                    customer: customers.randomElement()!,
                    saleDate: try! Date("\(Int.random(in: 1...20))/\(Int.random(in: 1...12))/\(Int.random(in: 2012...2022))", strategy: BikesViewModel.dateParseStrategy)
                ),
                Sale(
                    product: products.randomElement()!,
                    salesperson: salespersons.randomElement()!,
                    customer: customers.randomElement()!,
                    saleDate: try! Date("\(Int.random(in: 1...20))/\(Int.random(in: 1...12))/\(Int.random(in: 2012...2022))", strategy: BikesViewModel.dateParseStrategy)
                ),
                Sale(
                    product: products.randomElement()!,
                    salesperson: salespersons.randomElement()!,
                    customer: customers.randomElement()!,
                    saleDate: try! Date("\(Int.random(in: 1...20))/\(Int.random(in: 1...12))/\(Int.random(in: 2012...2022))", strategy: BikesViewModel.dateParseStrategy)
                ),
                Sale(
                    product: products.randomElement()!,
                    salesperson: salespersons.randomElement()!,
                    customer: customers.randomElement()!,
                    saleDate: try! Date("\(Int.random(in: 1...20))/\(Int.random(in: 1...12))/\(Int.random(in: 2012...2022))", strategy: BikesViewModel.dateParseStrategy)
                ),
                Sale(
                    product: products.randomElement()!,
                    salesperson: salespersons.randomElement()!,
                    customer: customers.randomElement()!,
                    saleDate: try! Date("\(Int.random(in: 1...20))/\(Int.random(in: 1...12))/\(Int.random(in: 2012...2022))", strategy: BikesViewModel.dateParseStrategy)
                ),
                Sale(
                    product: products.randomElement()!,
                    salesperson: salespersons.randomElement()!,
                    customer: customers.randomElement()!,
                    saleDate: try! Date("\(Int.random(in: 1...20))/\(Int.random(in: 1...12))/\(Int.random(in: 2012...2022))", strategy: BikesViewModel.dateParseStrategy)
                ),
                Sale(
                    product: products.randomElement()!,
                    salesperson: salespersons.randomElement()!,
                    customer: customers.randomElement()!,
                    saleDate: try! Date("\(Int.random(in: 1...20))/\(Int.random(in: 1...12))/\(Int.random(in: 2012...2022))", strategy: BikesViewModel.dateParseStrategy)
                ),
                Sale(
                    product: products.randomElement()!,
                    salesperson: salespersons.randomElement()!,
                    customer: customers.randomElement()!,
                    saleDate: try! Date("\(Int.random(in: 1...20))/\(Int.random(in: 1...12))/\(Int.random(in: 2012...2022))", strategy: BikesViewModel.dateParseStrategy)
                ),
                Sale(
                    product: products.randomElement()!,
                    salesperson: salespersons.randomElement()!,
                    customer: customers.randomElement()!,
                    saleDate: try! Date("\(Int.random(in: 1...20))/\(Int.random(in: 1...12))/\(Int.random(in: 2012...2022))", strategy: BikesViewModel.dateParseStrategy)
                ),
                Sale(
                    product: products.randomElement()!,
                    salesperson: salespersons.randomElement()!,
                    customer: customers.randomElement()!,
                    saleDate: try! Date("\(Int.random(in: 1...20))/\(Int.random(in: 1...12))/\(Int.random(in: 2012...2022))", strategy: BikesViewModel.dateParseStrategy)
                ),
                Sale(
                    product: products.randomElement()!,
                    salesperson: salespersons.randomElement()!,
                    customer: customers.randomElement()!,
                    saleDate: try! Date("\(Int.random(in: 1...20))/\(Int.random(in: 1...12))/\(Int.random(in: 2012...2022))", strategy: BikesViewModel.dateParseStrategy)
                ),
                Sale(
                    product: products.randomElement()!,
                    salesperson: salespersons.randomElement()!,
                    customer: customers.randomElement()!,
                    saleDate: try! Date("\(Int.random(in: 1...20))/\(Int.random(in: 1...12))/\(Int.random(in: 2012...2022))", strategy: BikesViewModel.dateParseStrategy)
                ),
                Sale(
                    product: products.randomElement()!,
                    salesperson: salespersons.randomElement()!,
                    customer: customers.randomElement()!,
                    saleDate: try! Date("\(Int.random(in: 1...20))/\(Int.random(in: 1...12))/\(Int.random(in: 2012...2022))", strategy: BikesViewModel.dateParseStrategy)
                ),
                Sale(
                    product: products.randomElement()!,
                    salesperson: salespersons.randomElement()!,
                    customer: customers.randomElement()!,
                    saleDate: try! Date("\(Int.random(in: 1...20))/\(Int.random(in: 1...12))/\(Int.random(in: 2012...2022))", strategy: BikesViewModel.dateParseStrategy)
                ),
                Sale(
                    product: products.randomElement()!,
                    salesperson: salespersons.randomElement()!,
                    customer: customers.randomElement()!,
                    saleDate: try! Date("\(Int.random(in: 1...20))/\(Int.random(in: 1...12))/\(Int.random(in: 2012...2022))", strategy: BikesViewModel.dateParseStrategy)
                ),
                Sale(
                    product: products.randomElement()!,
                    salesperson: salespersons.randomElement()!,
                    customer: customers.randomElement()!,
                    saleDate: try! Date("\(Int.random(in: 1...20))/\(Int.random(in: 1...12))/\(Int.random(in: 2012...2022))", strategy: BikesViewModel.dateParseStrategy)
                ),
                Sale(
                    product: products.randomElement()!,
                    salesperson: salespersons.randomElement()!,
                    customer: customers.randomElement()!,
                    saleDate: try! Date("\(Int.random(in: 1...20))/\(Int.random(in: 1...12))/\(Int.random(in: 2012...2022))", strategy: BikesViewModel.dateParseStrategy)
                ),
                Sale(
                    product: products.randomElement()!,
                    salesperson: salespersons.randomElement()!,
                    customer: customers.randomElement()!,
                    saleDate: try! Date("\(Int.random(in: 1...20))/\(Int.random(in: 1...12))/\(Int.random(in: 2012...2022))", strategy: BikesViewModel.dateParseStrategy)
                ),
                Sale(
                    product: products.randomElement()!,
                    salesperson: salespersons.randomElement()!,
                    customer: customers.randomElement()!,
                    saleDate: try! Date("\(Int.random(in: 1...20))/\(Int.random(in: 1...12))/\(Int.random(in: 2012...2022))", strategy: BikesViewModel.dateParseStrategy)
                )
            ]
        }
    }
}

extension BikesViewModel {
    private static let dateParseStrategy = Date.ParseStrategy(format: "\(day: .twoDigits)/\(month: .twoDigits)/\(year: .defaultDigits)", timeZone: .current)
    
    static let sampleData = BikesViewModel(
        salespersons: [
            Salesperson(
                firstName: "Donnell",
                lastName: "Acevedo",
                address: "49310 Colt Square, Suite 915, 62078, New Clara, Kentucky, United States",
                phoneNumber: "(205) 847-4044",
                startDate: try! Date("12/08/2015", strategy: dateParseStrategy),
                terminationDate: nil,
                manager: "Terrie Knight"
            ),
            Salesperson(
                firstName: "Ester",
                lastName: "Kelly",
                address: "1075 Benedict Expressway, Suite 035, 85078, Lake Alta, Rhode Island, United States",
                phoneNumber: "(938) 634-2953",
                startDate: try! Date("27/11/2014", strategy: dateParseStrategy),
                terminationDate: try! Date("28/08/2016", strategy: dateParseStrategy),
                manager: "Gaston Patton"
            ),
            Salesperson(
                firstName: "Felecia",
                lastName: "Oneal",
                address: "7128 Reynolds Locks, Apt. 236, 75417-4894, Scottieton, Texas, United States",
                phoneNumber: "(862) 407-0330",
                startDate: try! Date("01/07/2020", strategy: dateParseStrategy),
                terminationDate: nil,
                manager: "Terrie Knight"
            ),
            Salesperson(
                firstName: "Rogelio",
                lastName: "Zimmerman",
                address: "60980 Gerhold Crossing, Suite 724, 40448-0758, Elwinstad, Michigan, United States",
                phoneNumber: "(590) 890-4899",
                startDate: try! Date("08/01/2016", strategy: dateParseStrategy),
                terminationDate: nil,
                manager: "Gaston Patton"
            ),
            Salesperson(
                firstName: "Paul",
                lastName: "Fox",
                address: "97269 Reymundo Flats, Suite 567, 02616-7778, West Willie, Vermont, United States",
                phoneNumber: "(922) 403-2136",
                startDate: try! Date("26/04/2020", strategy: dateParseStrategy),
                terminationDate: nil,
                manager: "Gaston Patton"
            )
        ],
        products: [
            Product(
                name: "Cascade 4",
                manufacturer: "Polygon",
                style: "Recreational Mountain Bike",
                purchasePrice: 599.00,
                salePrice: 419.00,
                quantityOnHand: 4,
                commissionPercentage: 6
            ),
            Product(
                name: "Siskiu T8",
                manufacturer: "Polygon",
                style: "Trail Mountain Bike",
                purchasePrice: 2699.00,
                salePrice: nil,
                quantityOnHand: 2,
                commissionPercentage: 4
            ),
            Product(
                name: "Bayview Trail",
                manufacturer: "Marin",
                style: "Kids Mountain Bike",
                purchasePrice: 569.00,
                salePrice: 499.00,
                quantityOnHand: 6,
                commissionPercentage: 5
            ),
            Product(
                name: "Gestalt",
                manufacturer: "Marin",
                style: "Gravel Bike",
                purchasePrice: 1099.00,
                salePrice: nil,
                quantityOnHand: 3,
                commissionPercentage: 5
            ),
            Product(
                name: "DSX 1",
                manufacturer: "Marin",
                style: "Gravel Bike",
                purchasePrice: 1199.00,
                salePrice: nil,
                quantityOnHand: 7,
                commissionPercentage: 6
            ),
            Product(
                name: "MT Bromo N8",
                manufacturer: "Polygon",
                style: "Mountain eBike",
                purchasePrice: 5999.00,
                salePrice: 5499.00,
                quantityOnHand: 2,
                commissionPercentage: 7
            )
        ],
        customers: [
            Customer(
                firstName: "Sama",
                lastName: "Emery",
                address: "907 Hill Trafficway, Apt. 761, 48228, Port Giovani, Louisiana, United States",
                phoneNumber: "309-304-2129",
                firstPurchaseDate: try! Date("27/12/2018", strategy: dateParseStrategy)
            ),
            Customer(
                firstName: "Darrell",
                lastName: "Begum",
                address: "8846 Jada Points, Suite 650, 12076-2538, Hauckberg, New Mexico, United States",
                phoneNumber: "443-945-3432",
                firstPurchaseDate: try! Date("01/12/2021", strategy: dateParseStrategy)
            ),
            Customer(
                firstName: "Emilija",
                lastName: "Brett",
                address: "8053 Macy Highway, Suite 424, 57270, Gulgowskiport, Montana, United States",
                phoneNumber: "978-309-7324",
                firstPurchaseDate: try! Date("06/02/2016", strategy: dateParseStrategy)
            ),
            Customer(
                firstName: "Bethan",
                lastName: "Brandt",
                address: "929 Kurt Common, Suite 174, 47285, New Elisaside, Missouri, United States",
                phoneNumber: "727-483-2048",
                firstPurchaseDate: try! Date("04/03/2014", strategy: dateParseStrategy)
            ),
            Customer(
                firstName: "Sonya",
                lastName: "Ross",
                address: "26886 Kuhn Freeway, Apt. 077, 36934-5959, Travonside, Maine, United States",
                phoneNumber: "918-754-0406",
                firstPurchaseDate: try! Date("25/08/2014", strategy: dateParseStrategy)
            ),
            Customer(
                firstName: "Ellouise",
                lastName: "Tapia",
                address: "1077 Rippin Street, Suite 448, 18246-7736, Port Angelo, New Jersey, United States",
                phoneNumber: "559-730-9815",
                firstPurchaseDate: try! Date("21/07/2020", strategy: dateParseStrategy)
            ),
            Customer(
                firstName: "Caius",
                lastName: "McDowell",
                address: "03963 Haylie Courts, Suite 152, 97042-9957, West Rosettashire, New Jersey, United States",
                phoneNumber: "231-837-1652",
                firstPurchaseDate: try! Date("18/05/2019", strategy: dateParseStrategy)
            ),
            Customer(
                firstName: "Owais",
                lastName: "Trevino",
                address: "433 Stephen Lake, Apt. 841, 32955, Brownport, Wyoming, United States",
                phoneNumber: "707-527-3302",
                firstPurchaseDate: try! Date("16/08/2016", strategy: dateParseStrategy)
            ),
            Customer(
                firstName: "Maximillian",
                lastName: "Welsh",
                address: "103 Lang Underpass, Apt. 747, 75227, New Brodyfurt, Kentucky, United States",
                phoneNumber: "217-927-6292",
                firstPurchaseDate: try! Date("16/08/2021", strategy: dateParseStrategy)
            ),
            Customer(
                firstName: "Zaara",
                lastName: "Hanna",
                address: "7482 Kattie Greens, Apt. 922, 89896, East Reanna, Oklahoma, United States",
                phoneNumber: "717-730-3347",
                firstPurchaseDate: try! Date("19/05/2016", strategy: dateParseStrategy)
            )
        ],
        sales: []
    )
}
