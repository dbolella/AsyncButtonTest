//
//  GoogledTestView.swift
//  AsyncButtonTest
//
//  Created by Daniel Bolella on 4/13/25.
//

import SwiftUI

struct GoogledTestView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    GoogledDetailView(identifier: 1)
                        .navigationTitle("Googled: Task 1")
                        .background(Color.blue)
                } label: {
                    Text("Task 1")
                }
                NavigationLink {
                    GoogledDetailView(identifier: 2)
                        .navigationTitle("Googled: Task 2")
                        .background(Color.red)
                } label: {
                    Text("Task 2")
                }

            }
            .padding()
        }
    }
}

struct GoogledDetailView: View {
    let identifier: Int
    
    var body: some View {
        AsyncGoogledButton {
            for i in 1...TEST_DURATION {
                try? await Task.sleep(nanoseconds: TASK_SLEEP_AMOUNT)
                print("Googled Task \(identifier) Count: \(i)")
            }
        } label: {
            Text("Start Task \(identifier)")
        }
    }
}
