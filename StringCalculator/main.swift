import Darwin

let instructions = """
String Calculator

Finds the sum of all numbers within a provided string of numbers, with the following rules:
* all numbers must be comma-separated
* numbers greater than 1000 will be ignored
* newlines will be ignored
* will not find a sum if any negative numbers exist
* use the following format if you would like to use a custom separator instead of a comma:
  //[delimiter]\\n[delimiter separated numbers]

"""

print(instructions)
print("Please enter your string:")

guard let input = readLine() else {
    print("No input found.")
    exit(0)
}

do {
    let calculator = StringCalculator()
    let output = try calculator.add(input)
    print("Your sum is: \(output)")
} catch {
    print(error)
}
