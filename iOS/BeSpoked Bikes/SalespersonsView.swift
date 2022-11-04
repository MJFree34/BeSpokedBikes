//
//  SalespersonView.swift
//  BeSpoked Bikes
//
//  Created by Matt Free on 11/4/22.
//

import SwiftUI

struct SalespersonsView: View {
    private enum SheetType: Identifiable {
        var id: Int { hashValue }
        case add, edit
    }
    
    @Environment(\.editMode) private var editMode
    
    @EnvironmentObject var bikesViewModel: BikesViewModel
    
    @State private var currentSheet: SheetType?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(bikesViewModel.salespersons) { salesperson in
                    salespersonRow(salesperson)
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                bikesViewModel.salespersons.remove(at: bikesViewModel.salespersons.firstIndex(of: salesperson) ?? 0)
                            } label: {
                                Label("Remove", systemImage: "trash")
                            }
                        }
                    
                        .swipeActions(edge: .leading) {
                            Button {
                                bikesViewModel.selectedSalespersonToEdit = salesperson
                                currentSheet = .edit
                            } label: {
                                Label("Edit", systemImage: "pencil")
                            }
                            .tint(.yellow)
                        }
                }
                .onMove { indexSet, offset in
                    bikesViewModel.salespersons.move(fromOffsets: indexSet, toOffset: offset)
                }
                .onDelete { indexSet in
                    bikesViewModel.salespersons.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("Salespersons")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        currentSheet = .add
                    } label: {
                        Label("Add Salesperson", systemImage: "plus")
                    }
                }
            }
            .sheet(item: $currentSheet) { sheetType in
                if sheetType == .add {
                    AddSalespersonView()
                } else {
                    EditSalespersonView(salesperson: bikesViewModel.selectedSalespersonToEdit!)
                }
            }
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
