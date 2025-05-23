// Exercise 1: Function Basics
// Learn about defining and using functions in Swift.

import Foundation

// TODO: Fix the function syntax
public func greet name: String {
    print("Hello, \(name)!")
}

// TODO: Add parameter labels
public func calculateArea(width: Double, height: Double) -> Double {
    // Make this function use argument labels:
    // calculateArea(width: 10, height: 20)
    return width * height
}

// TODO: Add default parameter
public func printMessage(_ message: String, times: Int) {
    // Add a default value for 'times' parameter
    for _ in 1...times {
        print(message)
    }
}

// TODO: Fix the return type
public func divide(_ a: Int, by b: Int) -> Int {
    // This should handle division by zero
    // Return an optional Int instead
    if b == 0 {
        return 0  // This is wrong!
    }
    return a / b
}

// TODO: Implement variadic function
public func calculateAverage(/* what goes here? */) -> Double {
    // Accept any number of Double values
    // Return their average (0.0 if no values)
}

// TODO: Use tuple for multiple returns
public func minMax(array: [Int]) -> Int {
    // Return BOTH minimum and maximum values
    // Handle empty array case
    guard !array.isEmpty else {
        return 0  // This is wrong!
    }
    
    let minimum = array.min()!
    let maximum = array.max()!
    
    return minimum  // We want to return both!
}

// TODO: Add argument labels and parameter names
public func move(x: Int, y: Int) {
    // Change this so it's called like:
    // move(from: oldPosition, to: newPosition)
    print("Moving from \(x) to \(y)")
}

// TODO: Implement function overloading
public func process(_ value: Int) -> String {
    return "Processing integer: \(value)"
}

// Add an overloaded version that accepts String
// Add an overloaded version that accepts Double

// TODO: Fix the inout parameter usage
public func swapValues(a: Int, b: Int) {
    // Make this actually swap the values
    let temp = a
    // a = b  // This won't work!
    // b = temp
}

// TODO: Implement a function that returns a function
public func makeMultiplier(factor: Int) -> (Int) -> Int {
    // Return a function that multiplies its input by factor
}

// Main function to run all exercises
public func runFunctionBasics() {
    print("=== Function Basics ===\n")
    
    // Uncomment these as you fix them:
    // greet(name: "Swift")
    
    // let area = calculateArea(width: 10, height: 20)
    // print("Area: \(area)")
    
    // printMessage("Hello")  // Should use default times
    // printMessage("Hi", times: 3)
    
    // if let result = divide(10, by: 2) {
    //     print("10 / 2 = \(result)")
    // }
    // if let result = divide(10, by: 0) {
    //     print("This shouldn't print")
    // } else {
    //     print("Cannot divide by zero")
    // }
    
    // let avg = calculateAverage(1.0, 2.0, 3.0, 4.0, 5.0)
    // print("Average: \(avg)")
    
    // let (min, max) = minMax(array: [3, 1, 4, 1, 5, 9])
    // print("Min: \(min), Max: \(max)")
    
    // move(from: 5, to: 10)
    
    // print(process(42))
    // print(process("Hello"))
    // print(process(3.14))
    
    // var x = 5, y = 10
    // swapValues(a: &x, b: &y)
    // print("After swap: x = \(x), y = \(y)")
    
    // let triple = makeMultiplier(factor: 3)
    // print("Triple 4: \(triple(4))")
}