//
//  StructuredTestView.swift
//  AsyncButtonTest
//
//  Created by Daniel Bolella on 4/15/25.
//

import SwiftUI

struct StructuredTestView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    StructuredDetailView(identifier: 1)
                        .navigationTitle("Structured: Task 1")
                        .background(Color.blue)
                } label: {
                    Text("Task 1")
                }
                NavigationLink {
                    StructuredDetailView(identifier: 2)
                        .navigationTitle("Structured: Task 2")
                        .background(Color.red)
                } label: {
                    Text("Task 2")
                }

            }
            .padding()
        }
    }
}

struct StructuredDetailView: View {
    let identifier: Int
    
    var body: some View {
        AsyncStructuredButton {
            for i in 1...TEST_DURATION {
                try await Task.sleep(nanoseconds: TASK_SLEEP_AMOUNT)
                print("Structured Task \(identifier) Count: \(i)")
            }
        } label: {
            Text("Start Task \(identifier)")
        }
    }
}
