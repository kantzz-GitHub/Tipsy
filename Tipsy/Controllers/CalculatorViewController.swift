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
    
    var tipAmount: String!
    
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        updateUI()
        sender.isSelected = true
        print(sender.currentTitle!)
        tipAmount = sender.currentTitle!
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
    
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if tipAmount == "10%"{
            let tipTest = "0.1"
            print(tipTest)
        } else if tipAmount == "20%"{
            let tipTest = "0.2"
            print(tipTest)
        } else {
            let tipTest = "0.0"
            print(tipTest)
        }
    }
    
    func updateUI(){
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    


}

