// Exercise 1: Arrays
// Learn about creating, accessing, and modifying arrays in Swift.

import Foundation

// TODO: Fix the array initialization
public func arrayBasics() {
    // This won't compile! Fix the array declaration.
    let numbers = // Add array literal here
    
    print("First number: \(numbers[0])")
    print("Array count: \(numbers.count)")
}

// TODO: Make this array mutable and add elements
public func mutableArrays() {
    // Change this to allow mutations
    let fruits = ["apple", "banana"]
    
    // TODO: Add "orange" to the array
    // fruits.???
    
    // TODO: Insert "grape" at index 1
    // fruits.???
    
    print("Fruits: \(fruits)")
}

// TODO: Fix the index out of bounds error
public func arrayBounds() {
    let colors = ["red", "green", "blue"]
    
    // This will crash! Fix it.
    let fourthColor = colors[3]
    print("Fourth color: \(fourthColor)")
}

// TODO: Complete the function to return an array
public func createArray(size: Int, defaultValue: String) -> [String] {
    // Create an array of given size filled with defaultValue
    // Hint: Use Array(repeating:count:)
}

// TODO: Implement array transformation
public func doubleNumbers(_ numbers: [Int]) -> [Int] {
    // Return a new array with all numbers doubled
    // Hint: Use map
}

// Main function to run all exercises
public func runArrayExercises() {
    print("=== Array Exercises ===\n")
    
    // Uncomment these as you fix them:
    // arrayBasics()
    // mutableArrays()
    // arrayBounds()
    
    // Test your implementations:
    // let testArray = createArray(size: 5, defaultValue: "hello")
    // print("Created array: \(testArray)")
    
    // let doubled = doubleNumbers([1, 2, 3, 4, 5])
    // print("Doubled: \(doubled)")
}