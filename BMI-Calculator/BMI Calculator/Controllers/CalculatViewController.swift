//
//  CalculatViewController.swift
//  BMI Calculator
//
//  Created by Esam SHARFELDIN on 28/08/2022.
//  Copyright © 2022 EsamTech. All rights reserved.
//


import UIKit

class CalculatViewController: UIViewController {
    
    var calculaterBrain = CalculaterBrain()
    //var bmiValue = "0.0"

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var wieghtSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChaged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
    }
    @IBAction func weightSliderChaged(_ sender: UISlider) {
        let weight = String(format: "%.0f",sender.value)
        weightLabel.text = "\(weight)kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = wieghtSlider.value
        
        calculaterBrain.calculaterBrain(height: height,weight: weight)
//        let bmi = weight / pow(height, 2)
//        bmiValue = String(format: "%.1f", bmi)
        self.performSegue(withIdentifier: "goToResult", sender: CalculatViewController.self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculaterBrain.getBMIValue()
            destinationVC.advice = calculaterBrain.getAdvice()
            destinationVC.color = calculaterBrain.getColor()
        }
    }
}

