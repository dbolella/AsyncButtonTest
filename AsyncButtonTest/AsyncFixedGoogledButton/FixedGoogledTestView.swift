//
//  FixedGoogledTestView.swift
//  AsyncButtonTest
//
//  Created by Daniel Bolella on 4/15/25.
//

import SwiftUI

struct FixedGoogledTestView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    FixedGoogledDetailView(identifier: 1)
                        .navigationTitle("Fixed Googled: Task 1")
                        .background(Color.blue)
                } label: {
                    Text("Task 1")
                }
                NavigationLink {
                    FixedGoogledDetailView(identifier: 2)
                        .navigationTitle("Fixed Googled: Task 2")
                        .background(Color.red)
                } label: {
                    Text("Task 2")
                }

            }
            .padding()
        }
    }
}

struct FixedGoogledDetailView: View {
    let identifier: Int
    
    var body: some View {
        AsyncFixedGoogledButton {
            for i in 1...TEST_DURATION {
                try await Task.sleep(nanoseconds: TASK_SLEEP_AMOUNT)
                print("Fixed Googled Task \(identifier) Count: \(i)")
            }
        } label: {
            Text("Start Task \(identifier)")
        }
    }
}
