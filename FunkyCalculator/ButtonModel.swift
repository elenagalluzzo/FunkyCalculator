//
//  ButtonModel.swift
//  FunkyCalculator
//
//  Created by Elena Galluzzo on 2023-05-13.
//

import SwiftUI

enum Buttons: String {
    
    case one, two, three, four, five, six, seven, eight, nine, zero
    case divide, multiply, subtract, add, equal
    case ac, addSubtract, percent, dot
    
    var title: String {
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .dot: return "."
        case .equal: return "="
        case .add: return "+"
        case .subtract: return "-"
        case .multiply: return "x"
        case .divide: return "÷"
        case .addSubtract: return "±"
        case .percent: return "%"
        default: return "AC"
        }
    }
    var backgroundColor: Color {
        switch self {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .dot:
            return Color(.red)
        case .ac, .addSubtract, .percent:
            return Color(.orange)
        default:
            return .yellow
        }
    }
}
