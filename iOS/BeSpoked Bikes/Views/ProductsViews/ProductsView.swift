//
//  ProductsView.swift
//  BeSpoked Bikes
//
//  Created by Matt Free on 11/4/22.
//

import SwiftUI

struct ProductsView: View {
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
                ForEach(bikesViewModel.products) { product in
                    productRow(product)
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                bikesViewModel.products.remove(at: bikesViewModel.products.firstIndex(of: product) ?? 0)
                            } label: {
                                Label("Remove", systemImage: "trash")
                            }
                        }
                    
                        .swipeActions(edge: .leading) {
                            Button {
                                bikesViewModel.selectedProductToEdit = product
                                currentSheet = .edit
                            } label: {
                                Label("Edit", systemImage: "pencil")
                            }
                            .tint(.yellow)
                        }
                }
                .onMove { indexSet, offset in
                    bikesViewModel.products.move(fromOffsets: indexSet, toOffset: offset)
                }
                .onDelete { indexSet in
                    bikesViewModel.products.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("Products")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        currentSheet = .add
                    } label: {
                        Label("Add Product", systemImage: "plus")
                    }
                }
            }
            .sheet(item: $currentSheet) { sheetType in
                if sheetType == .add {
                    AddProductView()
                } else {
                    EditProductView(product: bikesViewModel.selectedProductToEdit!)
                }
            }
        }
    }
    
    @ViewBuilder
    func productRow(_ product: Product) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(product.manufacturer) \(product.name)")
                    .font(.title3)
                    .bold()
                
                if product.salePrice != product.purchasePrice {
                    Image(systemName: "tag.slash.fill")
                        .foregroundColor(.green)
                }
            }
            
            Grid(alignment: .leading) {
                GridRow {
                    Text("Style:")
                    
                    Text(product.style)
                        .font(.caption)
                }
                
                GridRow {
                    Text("Purchase Price:")
                    
                    Text(String(format: "$%.2f", product.purchasePrice))
                        .font(.caption)
                }
                
                GridRow {
                    Text("Sale Price:")
                    
                    Text(String(format: "$%.2f", product.salePrice))
                        .font(.caption)
                }
                
                GridRow {
                    Text("Quantity:")
                    
                    Text("\(product.quantityOnHand)")
                        .font(.caption)
                }
                
                GridRow {
                    Text("Commission:")
                    
                    Text("\(product.commissionPercentage)%")
                        .font(.caption)
                }
            }
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
            .environmentObject(BikesViewModel.sampleData)
    }
}
