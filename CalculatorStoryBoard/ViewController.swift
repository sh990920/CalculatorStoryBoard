import UIKit

class ViewController: UIViewController {
    
    let calculator = Calculator()
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func numberButton(_ sender: Any) {
        if let str = textLabel.text, let text = (sender as! UIButton).titleLabel?.text {
            if let num = Int(str), num == 0 {
                textLabel.text = text
            } else {
                textLabel.text = str + text
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
    
    @IBAction func operate(_ sender: Any) {
        if let text = (sender as! UIButton).titleLabel?.text, let textLabelText = textLabel.text {
            textLabel.text = textLabelText + text
        }
    }
}

