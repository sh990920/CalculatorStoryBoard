import UIKit

class ViewController: UIViewController {
    
    let calculator = Calculator()
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func numberButton(_ sender: UIButton) {
        if let str = textLabel.text, let text = sender.currentTitle {
            if let num = Int(str), num == 0 {
                textLabel.text = text
            } else {
                textLabel.text = calculator.removeZero(str + text)
            }
        }
    }
    
    @IBAction func allClear(_ sender: Any) {
        textLabel.text = "0"
    }
    
    @IBAction func result(_ sender: Any) {
        if let expression = textLabel.text, let result = calculator.calculate(expression: expression) {
            textLabel.text = String(result)
        }
    }
    
    @IBAction func operate(_ sender: UIButton) {
        if let text = sender.currentTitle, let textLabelText = textLabel.text {
            textLabel.text = textLabelText + text
        }
    }
}

