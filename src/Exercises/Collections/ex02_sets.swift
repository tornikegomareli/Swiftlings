// Exercise 2: Sets
// Learn about creating and manipulating sets in Swift.

import Foundation

// TODO: Create a set of integers
public func setBasics() {
    // Fix this set declaration
    let uniqueNumbers: Set<Int> = // Add set literal here
    
    print("Set contains 5: \(uniqueNumbers.contains(5))")
    print("Set count: \(uniqueNumbers.count)")
}

// TODO: Remove duplicates using a set
public func removeDuplicates(from array: [Int]) -> [Int] {
    // Convert array to set and back to remove duplicates
    // Maintain the original order if possible
}

// TODO: Implement set operations
public func setOperations() {
    let evens: Set = [2, 4, 6, 8, 10]
    let odds: Set = [1, 3, 5, 7, 9]
    let primes: Set = [2, 3, 5, 7]
    
    // TODO: Find all numbers that are even AND prime
    let evenPrimes = // Use intersection
    
    // TODO: Find all numbers from 1-10
    let allNumbers = // Use union
    
    // TODO: Find odd numbers that are not prime
    let nonPrimeOdds = // Use subtracting
    
    print("Even primes: \(evenPrimes)")
    print("All numbers: \(allNumbers)")
    print("Non-prime odds: \(nonPrimeOdds)")
}

// TODO: Fix the type error
public func setTypes() {
    // This won't compile! Sets need hashable elements
    struct Person {
        let name: String
        let age: Int
    }
    
    let people: Set<Person> = [
        Person(name: "Alice", age: 30),
        Person(name: "Bob", age: 25)
    ]
    
    print("People in set: \(people.count)")
}

// TODO: Implement a function to find common elements
public func findCommonElements<T: Hashable>(_ array1: [T], _ array2: [T]) -> [T] {
    // Return elements that appear in both arrays
    // Use sets for efficiency
}

// Main function to run all exercises
public func runSetExercises() {
    print("=== Set Exercises ===\n")
    
    // Uncomment these as you fix them:
    // setBasics()
    // setOperations()
    // setTypes()
    
    // Test your implementations:
    // let noDupes = removeDuplicates(from: [1, 2, 2, 3, 3, 3, 4])
    // print("No duplicates: \(noDupes)")
    
    // let common = findCommonElements([1, 2, 3, 4], [3, 4, 5, 6])
    // print("Common elements: \(common)")
}