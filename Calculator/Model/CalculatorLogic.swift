//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by karlis.stekels on 27/04/2021.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, calcMethode: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            
//            if symbol == "+/-" {
//                return n * -1
//            } else if symbol == "%" {
//                return n / 100
//            } else if symbol == "AC" {
//                return 0
//            }else if symbol == "=" {
//                return performTwoNumberCalculation(n2: n)
//            }else {
//                intermediateCalculation = (n1: n, calcMethode: symbol)
//            }
            
            
            switch symbol {
            case "+/-":
                return n * -1
            case "%":
                return n / 100
            case "AC":
                return 0
            case "=":
                return performTwoNumberCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, calcMethode: symbol)
            }
            
        }
        return nil
    }
    
    private func performTwoNumberCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethode {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "/":
                return n1 / n2
            default:
                fatalError("The operation passed in does match any of the case")
            }
        }
        return nil
    }
}
