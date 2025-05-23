// Exercise 3: Higher-Order Functions
// Learn to use and create functions that work with other functions.

import Foundation

// TODO: Implement using map
public func squareAll(_ numbers: [Int]) -> [Int] {
    // Don't use a for loop - use map instead
    var result: [Int] = []
    for number in numbers {
        result.append(number * number)
    }
    return result
}

// TODO: Implement using filter
public func getPassingGrades(_ grades: [Int]) -> [Int] {
    // Return only grades >= 70
    // Use filter, not a loop
    var passing: [Int] = []
    for grade in grades {
        if grade >= 70 {
            passing.append(grade)
        }
    }
    return passing
}

// TODO: Implement using reduce
public func concatenateStrings(_ strings: [String], separator: String) -> String {
    // Join all strings with the separator
    // Use reduce, not a loop
    var result = ""
    for (index, string) in strings.enumerated() {
        result += string
        if index < strings.count - 1 {
            result += separator
        }
    }
    return result
}

// TODO: Chain multiple operations
public func processScores(_ scores: [Int]) -> Int {
    // 1. Filter scores >= 50
    // 2. Add 10 bonus points to each (map)
    // 3. Calculate the average (reduce)
    // Do it in a single expression chain
}

// TODO: Create a higher-order function
public func repeatOperation<T>(
    times: Int,
    startingWith initial: T,
    operation: (T) -> T
) -> T {
    // Apply operation 'times' times, starting with initial
    // Example: repeatOperation(times: 3, startingWith: 2) { $0 * 2 } -> 16
}

// TODO: Implement function composition
public func compose<A, B, C>(
    _ f: @escaping (B) -> C,
    _ g: @escaping (A) -> B
) -> (A) -> C {
    // Return a function that applies g then f
    // h = compose(f, g) means h(x) = f(g(x))
}

// TODO: Create a curry function
public func curry<A, B, C>(
    _ function: @escaping (A, B) -> C
) -> (A) -> (B) -> C {
    // Convert a function of two arguments into a curried function
    // Example: let add = curry(+)
    // let add5 = add(5)
    // add5(3) -> 8
}

// TODO: Implement a memoization function
public func memoize<Input: Hashable, Output>(
    _ function: @escaping (Input) -> Output
) -> (Input) -> Output {
    var cache: [Input: Output] = [:]
    
    return { input in
        // Check cache first, compute if needed
        return function(input)  // Always computing - fix this!
    }
}

// TODO: Use lazy evaluation
public func findFirst<T>(
    in collection: [T],
    where predicate: (T) -> Bool
) -> T? {
    // Don't evaluate predicate for all elements
    // Stop as soon as you find a match
    let filtered = collection.filter(predicate)
    return filtered.first  // This evaluates predicate for ALL elements!
}

// TODO: Implement a custom operator for function composition
infix operator >>>: AdditionPrecedence

public func >>> <A, B, C>(
    _ f: @escaping (A) -> B,
    _ g: @escaping (B) -> C
) -> (A) -> C {
    // Implement f >>> g means g(f(x))
}

// TODO: Create a partial application function
public func partial<A, B, C>(
    _ function: @escaping (A, B) -> C,
    _ a: A
) -> (B) -> C {
    // Return a function with the first argument pre-filled
}

// Main function to run all exercises
public func runHigherOrderFunctions() {
    print("=== Higher-Order Functions ===\n")
    
    // Uncomment these as you fix them:
    // print("Squares: \(squareAll([1, 2, 3, 4, 5]))")
    
    // print("Passing grades: \(getPassingGrades([65, 72, 58, 90, 45, 83]))")
    
    // print("Joined: \(concatenateStrings(["Hello", "Swift", "World"], separator: " "))")
    
    // let scores = [45, 67, 82, 39, 90, 55, 71]
    // print("Processed average: \(processScores(scores))")
    
    // let doubled = repeatOperation(times: 3, startingWith: 2) { $0 * 2 }
    // print("Repeated doubling: \(doubled)")
    
    // let addOne = { $0 + 1 }
    // let double = { $0 * 2 }
    // let doubleThenAddOne = compose(addOne, double)
    // print("Compose (5 * 2) + 1: \(doubleThenAddOne(5))")
    
    // let curriedAdd = curry(+)
    // let add5 = curriedAdd(5)
    // print("Curried 5 + 3: \(add5(3))")
    
    // func expensiveOperation(_ n: Int) -> Int {
    //     print("Computing for \(n)...")
    //     return n * n
    // }
    // let memoized = memoize(expensiveOperation)
    // print("First call: \(memoized(5))")
    // print("Second call: \(memoized(5))")  // Should not print "Computing..."
    
    // let numbers = Array(1...1000000)
    // let found = findFirst(in: numbers) { $0 > 10 }
    // print("First > 10: \(found ?? 0)")
    
    // let triple = { $0 * 3 }
    // let plusTwo = { $0 + 2 }
    // let combined = triple >>> plusTwo
    // print("(4 * 3) + 2: \(combined(4))")
    
    // func multiply(_ a: Int, _ b: Int) -> Int { a * b }
    // let multiplyBy5 = partial(multiply, 5)
    // print("5 * 7: \(multiplyBy5(7))")
}