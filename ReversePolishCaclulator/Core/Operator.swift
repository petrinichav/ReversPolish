import Foundation

enum Operator: RawRepresentable {
    typealias RawValue = String?
    
    case plus
    case minus
    case multiplyer(operand: String)
    case divider(operand: String)
    
    var rawValue: String? {
        switch self {
        case .minus:
            return "-"
            
        case .plus:
            return "+"
            
        case .multiplyer(let operand):
            return operand
            
        case .divider(let operand):
            return operand
        }
    }
    
    init?(rawValue: String?) {
        switch rawValue {
        case "+":
            self = .plus
            
        case "-":
            self = .minus
            
        case "*", "x":
            self = .multiplyer(operand: rawValue!)
        
        case "/", ":":
            self = .divider(operand: rawValue!)
            
        default:
            return nil
        }
    }
        
    func calculate<T: BinaryInteger>(lh: T, rh: T) -> T? {
        switch self {
        case .plus:
            return sum(lh: lh, rh: rh)
        case .minus:
            return minus(lh: lh, rh: rh)
        case .multiplyer:
            return multiplyer(lh: lh, rh: rh)
        case .divider:
            return divide(lh: lh, rh: rh)
        }
    }
    
    func sum<T: BinaryInteger>(lh: T, rh: T) -> T {
        return lh + rh
    }
    
    func minus<T: BinaryInteger>(lh: T, rh: T) -> T {
        return lh - rh
    }
    
    func multiplyer<T: BinaryInteger>(lh: T, rh: T) -> T {
        return lh * rh
    }
    
    func divide<T: BinaryInteger>(lh: T, rh: T) -> T {
        return lh / rh
    }
}
