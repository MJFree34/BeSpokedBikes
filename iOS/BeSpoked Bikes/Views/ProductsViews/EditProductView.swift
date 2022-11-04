//
//  EditProductView.swift
//  BeSpoked Bikes
//
//  Created by Matt Free on 11/4/22.
//

import SwiftUI

struct EditProductView: View {
    var product: Product
    
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject var bikesViewModel: BikesViewModel
    
    @State private var name = ""
    @State private var manufacturer = ""
    @State private var style = ""
    @State private var purchasePrice = 0.00
    @State private var salePrice = 0.00
    @State private var quantity = 0
    @State private var commissionPercentage = 0
    
    init(product: Product) {
        self.product = product
        
        self._name = State(wrappedValue: product.name)
        self._manufacturer = State(wrappedValue: product.manufacturer)
        self._style = State(wrappedValue: product.style)
        self._purchasePrice = State(wrappedValue: product.purchasePrice)
        self._salePrice = State(wrappedValue: product.salePrice)
        self._quantity = State(wrappedValue: product.quantityOnHand)
        self._commissionPercentage = State(wrappedValue: product.commissionPercentage)
    }
    
    var isFilledOut: Bool {
        !name.isEmpty && !manufacturer.isEmpty && !style.isEmpty && purchasePrice >= salePrice
    }
    
    private var doubleFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section("Type") {
                        TextField("Name", text: $name, prompt: Text("Bike"))
                        TextField("Manufacturer", text: $manufacturer, prompt: Text("Brand"))
                        TextField("Style", text: $style, prompt: Text("Mountain Bike"))
                    }
                    
                    Section("Price") {
                        TextField("Purchase Price", value: $purchasePrice, formatter: doubleFormatter, prompt: Text("50.00"))
                        TextField("Sale Price", value: $salePrice, formatter: doubleFormatter, prompt: Text("40.00"))
                    }
                    .keyboardType(.decimalPad)
                    
                    Section("Quantity") {
                        Stepper("\(quantity)", value: $quantity)
                    }
                    
                    Section("Commission Percentage") {
                        Stepper("\(commissionPercentage)%", value: $commissionPercentage)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Close")
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        let index = bikesViewModel.products.firstIndex(of: product) ?? 0
                        
                        let newProduct = Product(
                            name: name,
                            manufacturer: manufacturer,
                            style: style,
                            purchasePrice: purchasePrice,
                            salePrice: salePrice,
                            quantityOnHand: quantity,
                            commissionPercentage: commissionPercentage
                        )
                        
                        bikesViewModel.products[index] = newProduct
                        
                        dismiss()
                        
                        dismiss()
                    } label: {
                        Text("Update \(manufacturer.isEmpty ? "Polygon" : manufacturer) \(name.isEmpty ? "Trail" : name)")
                    }
                    .buttonStyle(.bordered)
                    .disabled(!isFilledOut)
                }
            }
        }
    }
}

struct EditProductView_Previews: PreviewProvider {
    static var previews: some View {
        EditProductView(product: BikesViewModel.sampleData.products[0])
            .environmentObject(BikesViewModel.sampleData)
    }
}
