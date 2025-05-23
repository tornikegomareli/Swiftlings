// Exercise 4: Advanced Functions
// Explore advanced function features and patterns.

import Foundation

// TODO: Fix the inout parameter function
public func incrementAll(numbers: [Int]) {
    // Make this function modify the array in-place
    for i in 0..<numbers.count {
        numbers[i] += 1  // This won't work!
    }
}

// TODO: Implement nested functions
public func calculateStatistics(for numbers: [Int]) -> (mean: Double, median: Double, mode: Int?) {
    // Implement helper functions inside this function:
    // - calculateMean()
    // - calculateMedian()
    // - calculateMode()
    // Use them to return all three statistics
    
    return (0.0, 0.0, nil)  // Fix this!
}

// TODO: Create a function builder
public struct StringBuilder {
    var components: [String] = []
    
    public init() {}
    
    // TODO: Add methods to make this work:
    // let result = StringBuilder()
    //     .add("Hello")
    //     .add(" ")
    //     .add("World")
    //     .build()
}

// TODO: Implement function with throws
enum MathError: Error {
    case divisionByZero
    case negativeSquareRoot
    case undefined
}

public func safeMathOperation(
    _ a: Double,
    _ b: Double,
    operation: String
) -> Double {
    // Make this throw appropriate errors
    // Supported operations: "+", "-", "*", "/", "sqrt", "pow"
    switch operation {
    case "/":
        return a / b  // What if b is 0?
    default:
        return 0
    }
}

// TODO: Implement recursive function with memoization
private var fibCache: [Int: Int] = [:]

public func fibonacci(_ n: Int) -> Int {
    // Implement with memoization to avoid recalculating
    if n <= 1 {
        return n
    }
    return fibonacci(n - 1) + fibonacci(n - 2)  // Very inefficient!
}

// TODO: Create a DSL for building configurations
public struct Config {
    var debug: Bool = false
    var timeout: TimeInterval = 30
    var retries: Int = 3
    var baseURL: String = ""
    
    public init() {}
}

public func configure(_ builder: (inout Config) -> Void) -> Config {
    // Allow configuration like:
    // let config = configure {
    //     $0.debug = true
    //     $0.timeout = 60
    // }
}

// TODO: Implement function with generic constraints
public func findDuplicates<T>(in array: [T]) -> [T] {
    // This should only work with Hashable types
    // Return elements that appear more than once
    var seen: Set<T> = []  // This won't compile!
    var duplicates: [T] = []
    
    for element in array {
        if seen.contains(element) {
            duplicates.append(element)
        } else {
            seen.insert(element)
        }
    }
    
    return duplicates
}

// TODO: Create a timing function
public func measureTime<T>(
    operation: () throws -> T
) rethrows -> (result: T, time: TimeInterval) {
    // Measure how long the operation takes
    // Return both the result and the time
}

// TODO: Implement function with multiple return paths
public func processCommand(_ command: String) -> String {
    // Use guard statements and early returns
    // Commands: "start X", "stop X", "status"
    // Validate and process each command type
    
    // No validation currently!
    if command.hasPrefix("start") {
        return "Started"
    }
    return "Unknown command"
}

// Main function to run all exercises
public func runAdvancedFunctions() {
    print("=== Advanced Functions ===\n")
    
    // Uncomment these as you fix them:
    // var numbers = [1, 2, 3, 4, 5]
    // incrementAll(numbers: &numbers)
    // print("Incremented: \(numbers)")
    
    // let stats = calculateStatistics(for: [1, 2, 2, 3, 4, 4, 4, 5])
    // print("Mean: \(stats.mean), Median: \(stats.median), Mode: \(stats.mode ?? -1)")
    
    // let message = StringBuilder()
    //     .add("Hello")
    //     .add(" ")
    //     .add("Swift")
    //     .add("!")
    //     .build()
    // print("Built string: \(message)")
    
    // do {
    //     print("10 / 2 = \(try safeMathOperation(10, 2, operation: "/"))")
    //     print("10 / 0 = \(try safeMathOperation(10, 0, operation: "/"))")
    // } catch {
    //     print("Error: \(error)")
    // }
    
    // print("Fibonacci(10): \(fibonacci(10))")
    // print("Fibonacci(20): \(fibonacci(20))")  // Should be fast with cache
    
    // let config = configure {
    //     $0.debug = true
    //     $0.timeout = 60
    //     $0.baseURL = "https://api.example.com"
    // }
    // print("Config: debug=\(config.debug), timeout=\(config.timeout)")
    
    // let duplicates = findDuplicates(in: [1, 2, 3, 2, 4, 3, 5])
    // print("Duplicates: \(duplicates)")
    
    // let (result, time) = measureTime {
    //     Thread.sleep(forTimeInterval: 0.1)
    //     return "Operation complete"
    // }
    // print("\(result) in \(time) seconds")
    
    // print(processCommand("start server"))
    // print(processCommand("stop"))  // Should handle invalid
    // print(processCommand("status"))
}