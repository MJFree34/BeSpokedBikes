//
//  SalespersonDetailView.swift
//  BeSpoked Bikes
//
//  Created by Matt Free on 11/4/22.
//

import SwiftUI

struct EditSalespersonView: View {
    var salesperson: Salesperson
    
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
    
    init(salesperson: Salesperson) {
        self.salesperson = salesperson
        
        self._firstName = State(wrappedValue: salesperson.firstName)
        self._lastName = State(wrappedValue: salesperson.lastName)
        self._address = State(wrappedValue: salesperson.address)
        self._phoneNumber = State(wrappedValue: salesperson.phoneNumber)
        self._startDate = State(wrappedValue: salesperson.startDate)
        self._terminated = State(wrappedValue: salesperson.terminationDate != nil)
        self._terminationDate = State(wrappedValue: salesperson.terminationDate ?? Date.now)
        self._manager = State(wrappedValue: salesperson.manager)
    }
    
    var isFilledOut: Bool {
        !firstName.isEmpty && !lastName.isEmpty && !address.isEmpty && !phoneNumber.isEmpty && !manager.isEmpty
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
                        TextField("Manager", text: $manager, prompt: Text("Jane Smith"))
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
                        let index = bikesViewModel.salespersons.firstIndex(of: salesperson) ?? 0
                        
                        let newSalesperson = Salesperson(
                            firstName: firstName,
                            lastName: lastName,
                            address: address,
                            phoneNumber: phoneNumber,
                            startDate: startDate,
                            terminationDate: terminated ? terminationDate : nil,
                            manager: manager
                        )
                        
                        bikesViewModel.salespersons[index] = newSalesperson
                        
                        dismiss()
                    } label: {
                        Text("Update \(firstName.isEmpty ? "John" : firstName) \(lastName.isEmpty ? "Doe" : lastName)")
                    }
                    .buttonStyle(.bordered)
                    .disabled(!isFilledOut)
                }
            }
        }
    }
}

struct SalespersonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EditSalespersonView(salesperson: BikesViewModel.sampleData.salespersons[0])
            .environmentObject(BikesViewModel.sampleData)
    }
}
