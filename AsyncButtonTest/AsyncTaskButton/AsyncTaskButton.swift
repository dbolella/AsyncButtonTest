//
//  AsyncTaskButton.swift
//  AsyncButtonTest
//
//  Created by Daniel Bolella on 4/10/25.
//

import SwiftUI

struct AsyncTaskButton<Label: View>: View {
    let action: () async throws -> Void
    @ViewBuilder let label: () -> Label
    let errorHandler: (any Error) -> Void

    @State private var isRunning = false
    
    init(action: @escaping () async throws -> Void,
         label: @escaping () -> Label,
         errorHandler: @escaping (any Error) -> Void = { e in print(e.localizedDescription) }) {
        self.action = action
        self.label = label
        self.errorHandler = errorHandler
    }

    var body: some View {
        Button(action: {
            isRunning = true
        }) {
            label()
                .opacity(isRunning ? 0.6 : 1)
        }
        .disabled(isRunning)
        .task(id: isRunning) {
            guard isRunning else { return }
            do {
                try await action()
            } catch is CancellationError {
                print("Task was cancelled")
            } catch {
                errorHandler(error)
            }
            isRunning = false
        }
    }
}
