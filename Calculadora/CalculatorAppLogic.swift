//
//  CalculatorAppLogic.swift
//  Calculadora
//
//  Created by antonio on 08/05/22.
//

import Foundation

struct CalculatorAppLogic{
    
    
    // Executa a operacao de soma
    func calc( value: Double, startValue: Double, operation: String )->(Double){
        switch operation {
            case "+":
            return startValue + value
            case "-":
                return startValue - value
            case "x":
                return startValue * value
            case "/":
                return startValue / value
            case "%":
                return startValue.truncatingRemainder(dividingBy: value)
            default:
                if(value == 0){
                    return startValue
                }
                return value
        }
        
    }
    
    func validOperation(inputText: String)->(Bool){
        
        if(inputText == "+" || inputText == "-" || inputText == "x" || inputText == "/" || inputText == "%"){
            return false
        }

        return true
    }
    
}
