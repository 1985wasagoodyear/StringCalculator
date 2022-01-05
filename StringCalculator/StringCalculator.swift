private let defaultDelimiter = Character(",")

/// A simple string calculator.
public struct StringCalculator {
    
    /// Finds the sum of all non-negative integers in the provided comma-separated string.
    /// Will throw an exception if a negative interger is found.
    /// - Parameter numbers: the comma-separated string of numbers to sum
    /// - Returns: the sum
    public func add(_ numbers: String) throws -> Int {
        guard !numbers.isEmpty else {
            return 0
        }
        
        var currentNumber = ""
        var sum = 0
        var negatives = [Int]()
        let (delimiter, numbersString) = self.delimiterCheck(for: numbers)
        
        for character in numbersString {
            switch character {
            case delimiter:
                self.sumOrAddException(for: currentNumber, sum: &sum, negatives: &negatives)
                currentNumber = ""
            case "\n":
                continue
            default:
                currentNumber += String(character)
            }
        }
        
        self.sumOrAddException(for: currentNumber, sum: &sum, negatives: &negatives)
        
        guard negatives.isEmpty else {
            throw StringCalculatorError.negativesNotAllowed(negatives)
        }
        
        return sum
    }
}

extension StringCalculator {
    /// Calculates a value for the current number, ignoring numbers larger than 1000.
    /// - Parameter numberString: string representing the current number
    /// - Returns: integer value of string
    private func calculateValue(for numberString: String) -> Int {
        let number = Int(numberString) ?? 0
        return number > 1000 ? 0 : number
    }
    
    /// Checks if a custom delimiter is used, and returns that delimiter.
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
    
    /// Add the number to the running sum if non-negative.
    /// Add it to the list of negative values otherwise.
    /// - Parameter numberString: string representing the current number
    /// - Parameter sum:          the current sum calculated
    /// - Parameter negatives:    the list of all negative numbers encountered
    private func sumOrAddException(for numberString: String, sum: inout Int, negatives: inout [Int]) {
        let newValue = self.calculateValue(for: numberString)
        if newValue < 0 {
            negatives.append(newValue)
        } else {
            sum += newValue
        }
    }
}
