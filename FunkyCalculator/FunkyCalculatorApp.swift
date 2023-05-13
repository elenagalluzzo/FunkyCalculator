//
//  FunkyCalculatorApp.swift
//  FunkyCalculator
//
//  Created by Elena Galluzzo on 2023-05-12.
//

import SwiftUI

@main
struct FunkyCalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(GlobalEnvironment())
        }
    }
}
