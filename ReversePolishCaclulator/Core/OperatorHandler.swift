import Foundation

protocol OperatorHandler {
    associatedtype Element = Numeric
    
    func handle(input: String) -> String
}

final class IntElementOperatorHandler: OperatorHandler {
    typealias Element = Int
    
    func handle(input: String) -> String {
        let characters: [String] = input.components(separatedBy: " ")
        
        guard let lastCharacter = characters.last,
              let calculationOperator = Operator(rawValue: lastCharacter) else {
                  return input
              }
        let operatorIndex = characters.count - 1
        
        guard let leftElement = characters[safe: operatorIndex - 2],
            let rightElement = characters[safe: operatorIndex - 1] else {
            return input
        }
        
        guard let result = calculationOperator.calculate(lh: (leftElement as NSString).intValue, rh: (rightElement as NSString).intValue) else {
            return input
        }
        var newString = characters.prefix(operatorIndex-2)
        newString.append(String("\(result)"))
        return newString.joined(separator: " ")
    }
}
