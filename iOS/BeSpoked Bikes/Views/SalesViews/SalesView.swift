//
//  SalesView.swift
//  BeSpoked Bikes
//
//  Created by Matt Free on 11/4/22.
//

import SwiftUI

struct SalesView: View {
    @EnvironmentObject var bikesViewModel: BikesViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(bikesViewModel.sales) { sale in
                    saleRow(sale)
                }
            }
            .navigationTitle("Sales")
        }
    }
    
    @ViewBuilder
    func saleRow(_ sale: Sale) -> some View {
        VStack(alignment: .leading) {
            Text("Product: \(sale.product.manufacturer) \(sale.product.name)")
                .font(.title3)
                .bold()
            
            Grid(alignment: .leading) {
                GridRow {
                    Text("Customer:")
                    
                    Text("\(sale.customer.firstName) \(sale.customer.lastName)")
                        .font(.caption)
                }
                
                GridRow {
                    Text("Sale Date:")
                    
                    Text(sale.saleDate.formatted(date: .numeric, time: .omitted))
                        .font(.caption)
                }
                
                GridRow {
                    Text("Sale Price:")
                    
                    Text(String(format: "$%.2f", sale.product.salePrice))
                        .font(.caption)
                }
                
                GridRow {
                    Text("Salesperson:")
                    
                    Text("\(sale.salesperson.firstName) \(sale.salesperson.lastName)")
                        .font(.caption)
                }
                
                GridRow {
                    Text("Commission:")
                    
                    Text("\(sale.product.commissionPercentage)%")
                        .font(.caption)
                }
            }
        }
    }
}

struct SalesView_Previews: PreviewProvider {
    static var previews: some View {
        SalesView()
            .environmentObject(BikesViewModel.sampleData)
    }
}
