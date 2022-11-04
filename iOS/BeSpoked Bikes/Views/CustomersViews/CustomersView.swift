//
//  SalesView.swift
//  BeSpoked Bikes
//
//  Created by Matt Free on 11/4/22.
//

import SwiftUI

struct CustomersView: View {
    @EnvironmentObject var bikesViewModel: BikesViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(bikesViewModel.customers) { customer in
                    customerRow(customer)
                }
            }
            .navigationTitle("Customers")
        }
    }
    
    @ViewBuilder
    func customerRow(_ customer: Customer) -> some View {
        VStack(alignment: .leading) {
            Text("\(customer.firstName) \(customer.lastName)")
                .font(.title3)
                .bold()
            
            Grid(alignment: .leading) {
                GridRow {
                    Text("Address:")
                    
                    Text(customer.address)
                        .font(.caption)
                }
                
                GridRow {
                    Text("Phone Number:")
                    
                    Text(customer.phoneNumber)
                        .font(.caption)
                }
                
                GridRow {
                    Text("First Purchase Date:")
                    
                    Text(customer.firstPurchaseDate.formatted(date: .numeric, time: .omitted))
                        .font(.caption)
                }
            }
        }
    }
}

struct CustomersView_Previews: PreviewProvider {
    static var previews: some View {
        CustomersView()
            .environmentObject(BikesViewModel.sampleData)
    }
}
