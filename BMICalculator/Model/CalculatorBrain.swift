//
//  CalculatorBrain.swift
//  BMICalculator
//
//  Created by mac on 4/26/23.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMICategory?
    
    func getBMIValue() -> String {
        let bmiPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiPlace
    }
    
    func detAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 0.003166666953, green: 0.003166666487, blue: 0.003166666953, alpha: 1)
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            bmi = BMICategory(value: bmiValue, advice: "Eat more pies!", color: .cyan)
        } else if bmiValue < 24.9 {
            bmi = BMICategory(value: bmiValue, advice: "Fit as a fiddle!", color: .green)
        } else {
            bmi = BMICategory(value: bmiValue, advice: "Eat less pies!", color: .red)
        }
    }
}

