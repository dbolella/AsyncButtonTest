//
//  AsyncButtonTestApp.swift
//  AsyncButtonTest
//
//  Created by Daniel Bolella on 4/10/25.
//

import SwiftUI

@main
struct AsyncButtonTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

let TASK_SLEEP_AMOUNT: UInt64 = 1000000000
let TEST_DURATION: Int = 10
