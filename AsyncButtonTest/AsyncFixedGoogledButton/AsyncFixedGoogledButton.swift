//
//  AsyncFixedGoogledButton.swift
//  AsyncButtonTest
//
//  Created by Daniel Bolella on 4/15/25.
//

import SwiftUI

struct AsyncFixedGoogledButton<Label: View>: View {
    var action: () async throws -> Void
    @ViewBuilder var label: () -> Label
    let errorHandler: (any Error) -> Void

    @State private var isRunning = false
    @State var holdTask: Task<Void, Error>? = nil
    
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
                holdTask = Task {
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
        .onDisappear {
            holdTask?.cancel()
        }
    }
}
