import Foundation

enum Operator: RawRepresentable {
    typealias RawValue = String?
    
    case plus
    case minus
    
    var rawValue: String? {
        switch self {
        case .minus:
            return "-"
            
        case .plus:
            return "+"
            
        default:
            return nil
        }
    }
    
    init?(rawValue: String?) {
        switch rawValue {
        case "+":
            self = .plus
            
        case "-":
            self = .minus
            
        default:
            return nil
        }
    }
        
    func calculate<T: Numeric>(lh: T, rh: T) -> T? {
        switch self {
        case .plus:
            return sum(lh: lh, rh: rh)
        case .minus:
            return minus(lh: lh, rh: rh)
        }
    }
    
    func sum<T: Numeric>(lh: T, rh: T) -> T {
        return lh + rh
    }
    
    func minus<T: Numeric>(lh: T, rh: T) -> T {
        return lh - rh
    }
}
