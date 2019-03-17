//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Konstantin on 17/03/2019.
//  Copyright © 2019 Konstantin. All rights reserved.
//

import Foundation

class CalculatorLogic {
    
    var number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    func calculate(calcMethod: String) -> Double? {

        if calcMethod == "AC" {
            number = 0
        } else if calcMethod == "%" {
            number *= 0.01
        } else if calcMethod == "+/-" {
            number *= -1
        }
        
        return number
        
    }
    
}
