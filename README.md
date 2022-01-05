#  StringCalculator

Updated January 5, 2021

By Kevin Yu

A command line program that, when given a comma-separated string such as `1,2,3`, prints the sum of all integers (which in this case, would be 6).


## Rules for Calculation

1. Numbers must be comma-separated, unless a custom separator is used ([see below](#custom-deliminator))
2. Numbers greater than 1000 are ignored
3. Newlines are ignored
4. Any negative numbers will return an error message and no sum will be returned


## Custom Deliminator

Using the following input format, a custom separator, apart from a comma, can be used:

`//[delimiter]\n[delimiter separated numbers]`

This deliminator must be a single character in length.


## Files

### StringCalculator

Main parser. Calculates the sum, parses the input, throws an error for all negative numbers found.

### StringCalculatorError

Custom error, includes 1 case for negative numbers.
