//
//  GlobalEnvironment.swift
//  FunkyCalculator
//
//  Created by Elena Galluzzo on 2023-05-13.
//

import Foundation

class GlobalEnvironment: ObservableObject {
    
    @Published var display = ""
    var isFinishedTypingNumber = false
    var functionality = Functionality()
    func receiveInput(calculatorButton: Buttons) {
        ButtonPressed(calculatorButton: calculatorButton)
    }
    
    var displayValue: Double {
        get {
            guard let number = Double(display) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set {
            display = String(newValue)
        }
    }
    
    func ButtonPressed(calculatorButton: Buttons) {
        switch calculatorButton {
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero, .dot:
            
            if isFinishedTypingNumber {
                display = calculatorButton.title
                isFinishedTypingNumber = false
            } else {
                if calculatorButton.title == "." {
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                display = display + calculatorButton.title
            }

        case .divide, .multiply, .subtract, .add, .equal, .ac, . addSubtract, .percent:
            isFinishedTypingNumber = true
            functionality.setNumber(displayValue)
            if let result = functionality.calculate(symbol: calculatorButton.title) {
                displayValue = result
                
            }
        }
    }
}

