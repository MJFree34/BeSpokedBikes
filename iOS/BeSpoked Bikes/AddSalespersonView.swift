//
//  AddSalespersonView.swift
//  BeSpoked Bikes
//
//  Created by Matt Free on 11/4/22.
//

import SwiftUI

struct AddSalespersonView: View {
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject var bikesViewModel: BikesViewModel
    
    @State var firstName = ""
    @State var lastName = ""
    @State var address = ""
    @State var phoneNumber = ""
    @State var startDate = Date.now
    @State var terminated = false
    @State var terminationDate = Date.now
    @State var manager = ""
    
    var isFilledOut: Bool {
        !firstName.isEmpty && !lastName.isEmpty && !address.isEmpty && !phoneNumber.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section("Name") {
                        TextField("First Name", text: $firstName, prompt: Text("John"))
                        TextField("Last Name", text: $lastName, prompt: Text("Doe"))
                    }
                    
                    Section("Information") {
                        TextField("Address", text: $address, prompt: Text("1111 Ferst Drive, Atlanta, GA, United States, 30332"))
                        TextField("Phone Number", text: $phoneNumber, prompt: Text("(999) 999-9999"))
                    }
                    
                    Section("Dates") {
                        DatePicker(selection: $startDate, displayedComponents: [.date]) {
                            Text("Start Date")
                        }
                        
                        Toggle(isOn: $terminated) {
                            Text("Terminated")
                        }
                        
                        if terminated {
                            DatePicker(selection: $terminationDate, displayedComponents: [.date]) {
                                Text("Termination Date")
                            }
                        }
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
                        let salesperson = Salesperson(
                            firstName: firstName,
                            lastName: lastName,
                            address: address,
                            phoneNumber: phoneNumber,
                            startDate: startDate,
                            terminationDate: terminated ? terminationDate : nil,
                            manager: manager
                        )
                        
                        bikesViewModel.salespersons.append(salesperson)
                        
                        dismiss()
                    } label: {
                        Text("Add \(firstName.isEmpty ? "John" : firstName) \(lastName.isEmpty ? "Doe" : lastName)")
                    }
                    .buttonStyle(.bordered)
                    .disabled(!isFilledOut)
                }
            }
        }
    }
}

struct AddSalespersonView_Previews: PreviewProvider {
    static var previews: some View {
        AddSalespersonView()
            .environmentObject(BikesViewModel.sampleData)
    }
}
