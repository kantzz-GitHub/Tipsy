import UIKit
struct CalculatorBrain{
    var tipString: String!
    var tipAmount: Float = 0.0
    var stepperValue: Float = 0.0
    var bill: Float = 0.0
    var billSplit: Float = 0.0
    
    
    
    mutating func updateTipString(tip: String){
        self.tipString = tip
    }
    
    mutating func updateBill(value: Float){
        self.bill = value
    }
    
    mutating func updateStepperValue(value: Float){
        self.stepperValue = value
    }
    
    mutating func updateTipAmount(){
        if tipString == "10%"{
            tipAmount = 0.1
        } else if tipString == "20%"{
            tipAmount = 0.2
        } else {
            tipAmount = 0.0
        }
    }
    
    mutating func updateBillSplit(){
        self.billSplit = (bill * tipAmount + bill)/stepperValue
    }
    
    func getStepperValue() -> Float{
        return self.stepperValue
    }
    
    func getBillSplit() -> Float{
        return self.billSplit
    }
    
    func getTipPercentage() -> Float{
        return self.tipAmount * 100
    }
}
