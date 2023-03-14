//
//  CalcLogic.swift
//  Calculator
//
//  Created by Nikita on 14/3/23.
//

import UIKit

struct CalcLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, calcMethodTag: Int)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1,
           let operation = intermediateCalculation?.calcMethodTag {
            switch operation {
            case 4:
                return n1 / n2
            case 5:
                return n1 * n2
            case 6:
                return n1 - n2
            case 7:
                return n1 + n2
            default:
                print("problem")
            }
        }
        return nil
    }
    
    mutating func calculate(with tag: Int) -> Double? {
        
        if let n = number {
            if tag == 2 {
                return n * -1
            } else if tag == 1 {
                return 0
            } else if tag == 3 {
                return n * 0.01
            } else if tag == 8 {
                return performTwoNumCalculation (n2: n)
            } else {
                intermediateCalculation = (n1: n, calcMethodTag: tag)
            }
        }
        return nil
    }
}

