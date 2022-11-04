//
//  SalespersonView.swift
//  BeSpoked Bikes
//
//  Created by Matt Free on 11/4/22.
//

import SwiftUI

struct SalespersonsView: View {
    @EnvironmentObject var bikesViewModel: BikesViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(bikesViewModel.salespersons) { salesperson in
                    salespersonRow(salesperson)
                }
            }
            .navigationTitle("Salespersons")
        }
    }
    
    @ViewBuilder
    func salespersonRow(_ salesperson: Salesperson) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(salesperson.firstName) \(salesperson.lastName)")
                    .font(.title3)
                    .bold()
                
                Circle()
                    .frame(width: 10, height:10)
                    .foregroundColor(salesperson.terminationDate == nil ? .green : .red)
            }
            
            Grid(alignment: .leading) {
                GridRow {
                    Text("Address:")
                    
                    Text(salesperson.address)
                        .font(.caption)
                }
                
                GridRow {
                    Text("Phone Number:")
                    
                    Text(salesperson.phoneNumber)
                        .font(.caption)
                }
                
                GridRow {
                    Text("Start Date:")
                    
                    Text(salesperson.startDate.formatted(date: .numeric, time: .omitted))
                        .font(.caption)
                }
                
                if let terminationDate = salesperson.terminationDate {
                    GridRow {
                        Text("Termination Date:")
                        
                        Text(terminationDate.formatted(date: .numeric, time: .omitted))
                            .font(.caption)
                    }
                }
                
                GridRow {
                    Text("Manager:")
                    
                    Text(salesperson.manager)
                        .font(.caption)
                }
            }
        }
    }
}

struct SalespersonView_Previews: PreviewProvider {
    static var previews: some View {
        SalespersonsView()
            .environmentObject(BikesViewModel.sampleData)
    }
}
