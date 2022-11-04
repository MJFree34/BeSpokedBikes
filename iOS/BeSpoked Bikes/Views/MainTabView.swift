//
//  ContentView.swift
//  BeSpoked Bikes
//
//  Created by Matt Free on 11/3/22.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            SalespersonsView()
                .tabItem {
                    Label("Salespersons", systemImage: "person.fill")
                }
            
            ProductsView()
                .tabItem {
                    Label("Products", systemImage: "bicycle")
                }
            
            CustomersView()
                .tabItem {
                    Label("Customers", systemImage: "person.3.fill")
                }
            
            SalesView()
                .tabItem {
                    Label("Sales", systemImage: "tag.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(BikesViewModel.sampleData)
    }
}
