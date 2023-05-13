//
//  Functionality.swift
//  CalculatorApp
//
//  Created by Elena Galluzzo on 2023-05-12.
//

import Foundation

struct Functionality {
    private var number: Double?
    private var intermediateCalc: (n1: Double, symbolChosen: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "±":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return doCalculation(n2: n)
            default:
                intermediateCalc = (n1: n, symbolChosen: symbol)
            }
        }
        return nil
    }
    
    private func doCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalc?.n1,
           let operation = intermediateCalc?.symbolChosen {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "x":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("No cases chosen")
            }
        }
        return nil
    }
}
