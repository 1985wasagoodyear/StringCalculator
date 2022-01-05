import XCTest

final class StringCalculatorTests: XCTestCase {
    private let calculator = StringCalculator()
    
    func testEmptyStringReturnsZero() {
        let emptyString = ""
        let result = self.calculator.add(emptyString)
        XCTAssertEqual(result, 0)
    }
    
    func testBasicAddition() {
        let inputString = "1,2,5"
        let result = self.calculator.add(inputString)
        XCTAssertEqual(result, 8)
    }
    
    func testAdditionWithTens() {
        let inputString = "12,34,56"
        let result = self.calculator.add(inputString)
        XCTAssertEqual(result, 102)
    }
    
    func testAdditionWithHundreds() {
        let inputString = "123,123,10,5"
        let result = self.calculator.add(inputString)
        XCTAssertEqual(result, 261)
    }
    
    func testAdditionWithThousand() {
        let inputString = "1000,1,2,3"
        let result = self.calculator.add(inputString)
        XCTAssertEqual(result, 1006)
    }
    
    func testAdditionIgnoresNumbersGreaterThanThousand() {
        let inputString = "2, 1001"
        let result = self.calculator.add(inputString)
        XCTAssertEqual(result, 2)
    }
    
    func testAdditionIgnoresLargeNumbers() {
        let inputString = "1000000000,1000000,10000,2,4,6"
        let result = self.calculator.add(inputString)
        XCTAssertEqual(result, 12)
    }
    
    func testAdditionIgnoresNewlineAfterComma() {
        let inputString = "1\n,2,3"
        let result = self.calculator.add(inputString)
        XCTAssertEqual(result, 6)
    }
    
    func testAdditionIgnoresNewlineBeforeComma() {
        let inputString = "1,\n2,4"
        let result = self.calculator.add(inputString)
        XCTAssertEqual(result, 7)
    }
    
    func testAdditionIgnoresNewlines() {
        let inputString = "\n1\n,\n\n2\n\n,\n\n\n3\n\n\n"
        let result = self.calculator.add(inputString)
        XCTAssertEqual(result, 6)
    }
    
    func testAdditionWithCustomDelimiter() {
        let inputString = "//$\n1$2$3"
        let result = self.calculator.add(inputString)
        XCTAssertEqual(result, 6)
    }
    
    func testAdditionWithCustomDelimiterAndLargeNumber() {
        let inputString = "//@\n2@3@8@1001"
        let result = self.calculator.add(inputString)
        XCTAssertEqual(result, 13)
    }
    
    func testAdditionWithCustomDelimiterAndLargeNumberAndNewLine() {
        let inputString = "//@\n1@\n2@4"
        let result = self.calculator.add(inputString)
        XCTAssertEqual(result, 7)
    }
}
