//
//  TaskTestView.swift
//  AsyncButtonTest
//
//  Created by Daniel Bolella on 4/13/25.
//

import SwiftUI

struct TaskTestView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    TaskDetailView(identifier: 1)
                        .navigationTitle("Task-Based: Task 1")
                        .background(Color.blue)
                } label: {
                    Text("Task 1")
                }
                NavigationLink {
                    TaskDetailView(identifier: 2)
                        .navigationTitle("Task-Based: Task 2")
                        .background(Color.red)
                } label: {
                    Text("Task 2")
                }

            }
            .padding()
        }
    }
}

struct TaskDetailView: View {
    let identifier: Int
    
    var body: some View {
        AsyncTaskButton {
            for i in 1...TEST_DURATION {
                try await Task.sleep(nanoseconds: TASK_SLEEP_AMOUNT)
                print("Task-Based Task \(identifier) Count: \(i)")
            }
        } label: {
            Text("Start Task \(identifier)")
        }
    }
}
