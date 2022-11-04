//
//  BeSpoked_BikesApp.swift
//  BeSpoked Bikes
//
//  Created by Matt Free on 11/3/22.
//

import SwiftUI

@main
struct BeSpoked_BikesApp: App {
    @StateObject private var bikesViewModel: BikesViewModel
    
    init() {
        _bikesViewModel = StateObject(wrappedValue: BikesViewModel.sampleData)
    }
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(bikesViewModel)
        }
    }
}
