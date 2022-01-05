import XCTest

final class StringCalculatorTests: XCTestCase {
    private let calculator = StringCalculator()
    
    func testEmptyStringReturnsZero() throws {
        let emptyString = ""
        let result = try self.calculator.add(emptyString)
        XCTAssertEqual(result, 0)
    }
    
    func testBasicAddition() throws {
        let inputString = "1,2,5"
        let result = try self.calculator.add(inputString)
        XCTAssertEqual(result, 8)
    }
    
    func testAdditionWithTens() throws {
        let inputString = "12,34,56"
        let result = try self.calculator.add(inputString)
        XCTAssertEqual(result, 102)
    }
    
    func testAdditionWithHundreds() throws {
        let inputString = "123,123,10,5"
        let result = try self.calculator.add(inputString)
        XCTAssertEqual(result, 261)
    }
    
    func testAdditionWithThousand() throws {
        let inputString = "1000,1,2,3"
        let result = try self.calculator.add(inputString)
        XCTAssertEqual(result, 1006)
    }
    
    func testAdditionIgnoresNumbersGreaterThanThousand() throws {
        let inputString = "2, 1001"
        let result = try self.calculator.add(inputString)
        XCTAssertEqual(result, 2)
    }
    
    func testAdditionIgnoresLargeNumbers() throws {
        let inputString = "1000000000,1000000,10000,2,4,6"
        let result = try self.calculator.add(inputString)
        XCTAssertEqual(result, 12)
    }
    
    func testAdditionIgnoresNewlineAfterComma() throws {
        let inputString = "1\n,2,3"
        let result = try self.calculator.add(inputString)
        XCTAssertEqual(result, 6)
    }
    
    func testAdditionIgnoresNewlineBeforeComma() throws {
        let inputString = "1,\n2,4"
        let result = try self.calculator.add(inputString)
        XCTAssertEqual(result, 7)
    }
    
    func testAdditionIgnoresNewlines() throws {
        let inputString = "\n1\n,\n\n2\n\n,\n\n\n3\n\n\n"
        let result = try self.calculator.add(inputString)
        XCTAssertEqual(result, 6)
    }
    
    func testAdditionWithCustomDelimiter() throws {
        let inputString = "//$\n1$2$3"
        let result = try self.calculator.add(inputString)
        XCTAssertEqual(result, 6)
    }
    
    func testAdditionWithCustomDelimiterAndLargeNumber() throws {
        let inputString = "//@\n2@3@8@1001"
        let result = try self.calculator.add(inputString)
        XCTAssertEqual(result, 13)
    }
    
    func testAdditionWithCustomDelimiterAndLargeNumberAndNewLine() throws {
        let inputString = "//@\n1@\n2@4"
        let result = try self.calculator.add(inputString)
        XCTAssertEqual(result, 7)
    }
    
    func testAdditionWithNegative() throws {
        let inputString = "-1,2,3"
        XCTAssertThrowsError(try self.calculator.add(inputString)) { error in
            guard case let StringCalculatorError.negativesNotAllowed(negatives) = error else {
                XCTFail("Wrong exception thrown")
                return
            }
            
            XCTAssertEqual(negatives, [-1])
        }
    }
    
    func testAdditionWithMultipleNegatives() throws {
        let inputString = "-1,-2,-3"
        XCTAssertThrowsError(try self.calculator.add(inputString)) { error in
            guard case let StringCalculatorError.negativesNotAllowed(negatives) = error else {
                XCTFail("Wrong exception thrown")
                return
            }
            
            XCTAssertEqual(negatives, [-1, -2, -3])
        }
    }
    
    func testAdditionWithCustomDelimiterAndLargeNumberAndNewLineAndNegatives() throws {
        let inputString = "//@\n1@\n2@4@-1"
        XCTAssertThrowsError(try self.calculator.add(inputString)) { error in
            guard case let StringCalculatorError.negativesNotAllowed(negatives) = error else {
                XCTFail("Wrong exception thrown")
                return
            }
                    
            XCTAssertEqual(negatives, [-1])
        }
    }
}
