//
//  CalculaterBrain.swift
//  BMI Calculator
//
//  Created by Esam SHARFELDIN on 29/08/2022.
//  Copyright © 2022 EsamTech. All rights reserved.
//

import UIKit

struct CalculaterBrain {
    
    var bmi: BMI?
    
    mutating func calculaterBrain(height: Float,weight: Float){
        
        let bmiValue = weight / pow(height, 2)
        if bmiValue < 18.5 {
//            print("underwight")
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: UIColor.blue)
        } else if bmiValue < 24.9 {
//            print("normal weight")
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: UIColor.green)
        } else {
//            print("overweight")
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: UIColor.red)
        }
        
        
    }
    
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
    
    func getAdvice() -> String{
        return bmi?.advice ?? "NO Advice"
    }
    
    func getColor() -> UIColor{
        return bmi?.color ?? UIColor.white
    }
}
