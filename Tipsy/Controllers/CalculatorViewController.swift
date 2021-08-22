import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var calculatorBrain = CalculatorBrain()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        updateUI()
        sender.isSelected = true
        calculatorBrain.updateTipString(tip: sender.currentTitle!)
        
        let billText = billTextField.text ?? "0.0"
        
        calculatorBrain.updateBill(value: (billText as NSString).floatValue)
        billTextField.endEditing(true)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        sender.minimumValue = 1
        sender.stepValue = 1
        
        calculatorBrain.updateStepperValue(value: Float(sender.value))
        splitNumberLabel.text = String(format: "%.0f", calculatorBrain.getStepperValue())
        billTextField.endEditing(true)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        calculatorBrain.updateTipAmount()

        calculatorBrain.updateBillSplit()

        performSegue(withIdentifier: "goToResults", sender: self)
        
    }
    
    func updateUI(){
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = calculatorBrain.getBillSplit()
            destinationVC.tipPercentage = calculatorBrain.getTipPercentage()
            destinationVC.numberOfPeople = calculatorBrain.getStepperValue()
        }
    }
}

