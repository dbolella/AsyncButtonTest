//
//  AsyncGoogledButton.swift
//  AsyncButtonTest
//
//  Created by Daniel Bolella on 4/13/25.
//

import SwiftUI

struct AsyncGoogledButton<Label: View>: View {
    var action: () async throws -> Void
    @ViewBuilder var label: () -> Label
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
        Button(
            action: {
                isRunning = true
                Task {
                    do {
                        try await action()
                    } catch is CancellationError {
                        print("Task was cancelled")
                    } catch {
                        errorHandler(error)
                    }
                    isRunning = false
                }
            },
            label: {
                label()
                    .opacity(isRunning ? 0.6 : 1)
            }
        )
    }
}
