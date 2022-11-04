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
            
            Text("Products")
                .tabItem {
                    Label("Products", systemImage: "bicycle")
                }
            
            Text("Customers")
                .tabItem {
                    Label("Customers", systemImage: "person.3.fill")
                }
            
            Text("Sales")
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
