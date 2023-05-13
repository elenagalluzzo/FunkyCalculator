//
//  ContentView.swift
//  FunkyCalculator
//
//  Created by Elena Galluzzo on 2023-05-12.
//

import SwiftUI

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
        ZStack (alignment: .bottom){
            Color(red: 255 / 255, green: 220 / 255, blue: 255 / 255)
                .edgesIgnoringSafeArea(.all)
            VStack (spacing: 15) {
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
