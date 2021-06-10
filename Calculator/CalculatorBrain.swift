//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Aleksandr Khalupa on 13.02.2021.
//

import Foundation


struct CalculatorBrain {
    
    func mathOper (_ num1: Float,_ num2: Float, actions:(Float, Float) -> String ) -> String {
    
        return actions(num1, num2)
    }
    
    
}
