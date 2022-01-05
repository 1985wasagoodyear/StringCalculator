/// Errors found while adding the numbers in `StringCalculator`'s input
public enum StringCalculatorError: Error {
    /// Negative number(s) were found
    case negativesNotAllowed([Int])
}

extension StringCalculatorError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .negativesNotAllowed(let negativeNumbers):
            return "Negatives not allowed: \(negativeNumbers)"
        }
    }
}
