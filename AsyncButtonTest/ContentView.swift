//
//  ContentView.swift
//  AsyncButtonTest
//
//  Created by Daniel Bolella on 4/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Select AsyncButton Test")
                
                NavigationLink {
                    TaskTestView()
                        .navigationTitle("Task-Based")
                } label: {
                    Text("Task-Based")
                }
                
                NavigationLink {
                    GoogledTestView()
                        .navigationTitle("Googled")
                } label: {
                    Text("Googled")
                }
                
                NavigationLink {
                    FixedGoogledTestView()
                        .navigationTitle("Fixed Googled")
                } label: {
                    Text("Fixed Googled")
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
