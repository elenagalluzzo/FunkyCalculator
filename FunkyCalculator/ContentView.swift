//
//  ContentView.swift
//  FunkyCalculator
//
//  Created by Elena Galluzzo on 2023-05-12.
//

import SwiftUI


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


struct ContentView: View {

    @EnvironmentObject var env: GlobalEnvironment
    
    var functionality = Functionality()
    
    let buttonsArray: [[Buttons]] = [
        [.ac,       .addSubtract, .percent, .divide],
        [.seven,    .eight,      .nine,     .multiply],
        [.four,     .five,       .six,      .subtract],
        [.one,      .two,        .three,    .add],
        [.zero,     .dot,        .equal],
    ]
    
    var body: some View {
        ZStack {
            Color(red:0.5, green:0.5, blue:0)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text(env.display) .frame(maxWidth: .infinity, alignment: .trailing)
                        .font(.system(size: 75))
                        .padding()
                }
                ForEach(buttonsArray, id:\.self) { row in
                    HStack (spacing: 10){
                        ForEach(row, id:\.self) { button in
                            Button(action: {
                                self.env.receiveInput(calculatorButton: button)
                            }) {
                                Text(button.title)
                                    .frame(width: self.buttonWidth(button: button), height: self.buttonHeight())
                                    .foregroundColor(.white)
                                    .background(button.backgroundColor)
                                    .border(.white)
                                    .font(.system(size: 50))
                                    .cornerRadius(self.buttonWidth(button: button))
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    func buttonWidth(button: Buttons) -> CGFloat {
        if button == .zero {
            return (UIScreen.main.bounds.width - 40)/2
        }
        return (UIScreen.main.bounds.width - 50)/4
    }
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - 50)/4
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalEnvironment())
    }
}
