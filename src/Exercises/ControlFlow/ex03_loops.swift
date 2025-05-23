// Exercise 3: Loops
// Learn about different loop constructs in Swift.

import Foundation

// TODO: Fix the for-in loop syntax
public func basicForLoop() {
    // This won't compile! Fix the loop syntax.
    for i in 1..10 {
        print("Number: \(i)")
    }
}

// TODO: Implement array iteration
public func sumArray(_ numbers: [Int]) -> Int {
    var sum = 0
    // TODO: Use a for-in loop to calculate sum
    return sum
}

// TODO: Fix the infinite loop
public func countDown(from start: Int) {
    var current = start
    
    while current > 0 {
        print(current)
        // Something is missing here!
    }
    print("Liftoff!")
}

// TODO: Convert to repeat-while
public func getUserInput() -> String {
    var input = ""
    
    // This should ask at least once, even if input is valid
    if input.isEmpty {
        print("Enter non-empty string:")
        input = "simulated input" // Simulating user input
    }
    
    return input
    
    // Convert to use repeat-while instead
}

// TODO: Implement with stride
public func printEvenNumbers(from start: Int, to end: Int) {
    // Print all even numbers from start to end (inclusive)
    // Use stride(from:to:by:) or stride(from:through:by:)
}

// TODO: Fix the loop control
public func findFirstNegative(in numbers: [Int]) -> Int? {
    for number in numbers {
        if number < 0 {
            print("Found negative: \(number)")
            // How do we exit the loop and return this number?
        }
    }
    return nil
}

// TODO: Implement nested loops with labels
public func printMultiplicationTable(size: Int) {
    // Print a multiplication table up to size x size
    // Format: "2 x 3 = 6"
    // Use labeled break to stop when product exceeds 50
}

// TODO: Implement with enumerated()
public func findIndicesOf(value: Int, in array: [Int]) -> [Int] {
    var indices: [Int] = []
    // Find all indices where array contains value
    // Hint: Use enumerated() to get index and element
    return indices
}

// TODO: Fix the continue usage
public func printNonMultiplesOf3(upTo limit: Int) {
    for i in 1...limit {
        if i % 3 == 0 {
            // Skip multiples of 3
        }
        print(i)
    }
}

// TODO: Implement while loop with complex condition
public func playGame() -> Int {
    var score = 0
    var lives = 3
    var level = 1
    
    // Continue playing while lives > 0 AND score < 100
    // Each iteration:
    // - Add 10 * level to score
    // - 30% chance to lose a life (use Int.random(in: 1...10) <= 3)
    // - If score reaches 50, advance to level 2
    // Return final score
    
    return score
}

// TODO: Advanced - Implement sequence iteration
public func fibonacciNumbers(upTo limit: Int) -> [Int] {
    var fibonacci: [Int] = []
    // Generate Fibonacci numbers up to limit
    // Use a loop to generate: 1, 1, 2, 3, 5, 8, ...
    // Stop when next number would exceed limit
    return fibonacci
}

// Main function to run all exercises
public func runLoopExercises() {
    print("=== Loop Exercises ===\n")
    
    // Uncomment these as you fix them:
    // basicForLoop()
    
    // print("Sum of [1,2,3,4,5]: \(sumArray([1, 2, 3, 4, 5]))")
    
    // countDown(from: 5)
    
    // print("User input: \(getUserInput())")
    
    // print("Even numbers from 1 to 10:")
    // printEvenNumbers(from: 1, to: 10)
    
    // let numbers = [1, 5, -3, 7, -2]
    // if let negative = findFirstNegative(in: numbers) {
    //     print("First negative: \(negative)")
    // }
    
    // print("\nMultiplication table:")
    // printMultiplicationTable(size: 10)
    
    // let indices = findIndicesOf(value: 3, in: [1, 3, 5, 3, 7, 3])
    // print("Indices of 3: \(indices)")
    
    // print("\nNon-multiples of 3 up to 10:")
    // printNonMultiplesOf3(upTo: 10)
    
    // print("\nGame score: \(playGame())")
    
    // print("\nFibonacci numbers up to 100: \(fibonacciNumbers(upTo: 100))")
}