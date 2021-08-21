import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var result: Float?
    var numberOfPeople: Float?
    var tipPercentage: Float?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = String(format: "%.2f", result!)
        let someText = "Split between \(numberOfPeople ?? 1) people, with \(tipPercentage ?? 0)% tip."
        settingsLabel.text = someText
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
