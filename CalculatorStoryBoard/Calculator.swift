import Foundation

class Calculator {
    
    let operateArr = ["+", "-", "x", "÷"]
    
    func isValidExpression(_ expression: String) -> Bool {
        let trimmedExpression = expression.replacingOccurrences(of: " ", with: "")
        let pattern = "^[0-9]+([+\\-*/][0-9]+)*$"
        if let _ = trimmedExpression.range(of: pattern, options: .regularExpression) {
            return true
        } else {
            return false
        }
    }
    
    func calculate(expression: String) -> Int? {
        let str = expression.replacingOccurrences(of: "x", with: "*").replacingOccurrences(of: "÷", with: "/")
        guard isValidExpression(str) else {
            print("Error : 수식이 올바르지 않습니다.")
            return nil
        }
        let express = NSExpression(format: str)
        if let result = express.expressionValue(with: nil, context: nil) as? NSNumber {
            return result.intValue
        } else {
            print("Error : 수식이 잘못됨")
            return nil
        }
    }
    
    func removeZero(_ str: String) -> String {
        var result = ""
        var currentNumber = ""
        for char in str {
            if char.isNumber {
                print(1)
                currentNumber.append(char)
            } else {
                print(2)
                if !currentNumber.isEmpty {
                    print(3)
                    if let num = Int(currentNumber) {
                        print(4)
                        result.append(String(num))
                        currentNumber = ""
                    }
                }
                if "+-x÷".contains(char) {
                    print(5)
                    result.append(char)
                }
            }
        }
        if !currentNumber.isEmpty {
            if let num = Int(currentNumber) {
                result.append(String(num))
            }
        }
        return result
    }
    
}
