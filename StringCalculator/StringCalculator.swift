private let defaultDelimiter = Character(",")

/// A simple string calculator
/// Finds the sum of all integers in a comma-separated string.
public struct StringCalculator {
    
    /// Finds the sum of all integers in the provided comma-separated string
    /// - Parameter numbers: the comma-separated string of numbers to sum
    /// - Returns: the sum
    public func add(_ numbers: String) -> Int {
        guard !numbers.isEmpty else {
            return 0
        }
        
        var currentNumber = ""
        var sum = 0
        let (delimiter, numbersString) = self.delimiterCheck(for: numbers)
        
        for character in numbersString {
            switch character {
            case delimiter:
                sum += self.calculateValue(for: currentNumber)
                currentNumber = ""
            case "\n":
                continue
            default:
                currentNumber += String(character)
            }
        }
        
        sum += self.calculateValue(for: currentNumber)
        
        return sum
    }
}

extension StringCalculator {
    /// Calculates a value for the current number, ignoring numbers larger than 1000
    /// - Parameter numberString: string representing the current number
    /// - Returns: integer value of string
    private func calculateValue(for numberString: String) -> Int {
        let number = Int(numberString) ?? 0
        return number > 1000 ? 0 : number
    }
    
    /// Checks if a custom delimiter is used, and returns that delimiter
    /// - Parameter numberString: string representing the current number
    /// - Returns: the delimiter for the string and the numbers (without the delimiter prefix)
    private func delimiterCheck(for numberString: String) -> (Character, String) {
        guard numberString.count > 2, numberString.starts(with: "//") else {
            return (defaultDelimiter, numberString)
        }
        
        let numberStringWithDelimiter = numberString.dropFirst(2)
        guard let delimiter = numberStringWithDelimiter.first else {
            return (defaultDelimiter, numberString)
        }
        
        return (delimiter, String(numberStringWithDelimiter.dropFirst(2)))
    }
}
