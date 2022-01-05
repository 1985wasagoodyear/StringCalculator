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
        
        for character in numbers {
            if character.isNumber {
                currentNumber += String(character)
            } else {
                sum += self.calculateValue(for: currentNumber)
                currentNumber = ""
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
}
