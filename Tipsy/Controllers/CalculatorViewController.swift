//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipString: String!
    var tipAmount: Float = 0.0
    var stepperValue: Float = 0.0
    var bill: Float = 0.0
    var billSplit: Float = 0.0
    
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        updateUI()
        sender.isSelected = true
        tipString = sender.currentTitle!
        
        let billText = billTextField.text ?? "0.0"
        
        bill = (billText as NSString).floatValue
        billTextField.endEditing(true)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        sender.minimumValue = 1
        sender.stepValue = 1
        stepperValue = Float(sender.value)
        updateUI()
        
        
    
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if tipString == "10%"{
            tipAmount = 0.1
        } else if tipString == "20%"{
            tipAmount = 0.2
        } else {
            tipAmount = 0.0
        }
        
        print(tipAmount)
        
        print(stepperValue)
        
        print(bill)
        
        billSplit = splitTheBill()
        print(billSplit)
        
        performSegue(withIdentifier: "goToResults", sender: self)
        
        
    }
    
    func updateUI(){
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        splitNumberLabel.text = String(format: "%.0f", stepperValue)
    }
    
    func splitTheBill() ->Float{
        let answer = (bill * tipAmount + bill)/stepperValue
        return answer
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = billSplit
            destinationVC.tipPercentage = tipAmount * 100
            destinationVC.numberOfPeople = stepperValue
        }
    }
    
}

