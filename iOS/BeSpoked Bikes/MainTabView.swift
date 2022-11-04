//
//  ContentView.swift
//  BeSpoked Bikes
//
//  Created by Matt Free on 11/3/22.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
