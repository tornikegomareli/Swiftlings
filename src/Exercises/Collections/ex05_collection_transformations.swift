// Exercise 5: Collection Transformations
// Master functional programming with map, filter, reduce, and more.

import Foundation

// TODO: Use map to transform strings
public func uppercaseFirstLetters(_ words: [String]) -> [String] {
    // Capitalize the first letter of each word
    // Hint: Use map and String manipulation
}

// TODO: Use filter to select elements
public func filterValidEmails(_ emails: [String]) -> [String] {
    // Return only valid email addresses (containing @ and .)
    // Use filter with a closure
}

// TODO: Use reduce to calculate a result
public func calculateTotalPrice(items: [(name: String, price: Double, quantity: Int)]) -> Double {
    // Calculate total price of all items (price * quantity)
    // Use reduce
}

// TODO: Chain multiple operations
public func processNumbers(_ numbers: [Int]) -> Int {
    // 1. Filter even numbers
    // 2. Square them
    // 3. Take only those > 50
    // 4. Sum them all
    // Chain map, filter, and reduce
}

// TODO: Use compactMap to handle optionals
public func parseValidIntegers(_ strings: [String]) -> [Int] {
    // Convert strings to integers, keeping only valid ones
    // Use compactMap
}

// TODO: Implement a custom transformation
public func groupAndCount<T: Hashable>(_ items: [T]) -> [(element: T, count: Int)] {
    // Group elements and return array of (element, count) tuples
    // Sorted by count (descending)
    // Use Dictionary and map
}

// TODO: Work with lazy collections
public func firstFivePrimesAfter(_ start: Int) -> [Int] {
    // Find first 5 prime numbers after start
    // Use lazy to avoid computing all numbers
    func isPrime(_ n: Int) -> Bool {
        guard n > 1 else { return false }
        guard n > 3 else { return true }
        for i in 2...Int(sqrt(Double(n))) {
            if n % i == 0 { return false }
        }
        return true
    }
    
    // Use sequence or lazy collection here
}

// TODO: Combine multiple collections
public func zipAndCombine<T, U>(_ array1: [T], _ array2: [U], 
                                 combiner: (T, U) -> String) -> [String] {
    // Combine two arrays using zip and the combiner function
    // Handle arrays of different lengths gracefully
}

// TODO: Create a pipeline for data processing
struct Person {
    let name: String
    let age: Int
    let city: String
}

public func processPersonData(_ people: [Person]) -> [String: [String]] {
    // Group people by city, but only include adults (age >= 18)
    // Return dictionary: city -> [names]
    // Sort names alphabetically within each city
}

// Main function to run all exercises
public func runTransformationExercises() {
    print("=== Collection Transformations ===\n")
    
    // Test your implementations:
    
    // let words = ["hello", "world", "swift", "programming"]
    // print("Capitalized: \(uppercaseFirstLetters(words))")
    
    // let emails = ["valid@email.com", "invalid", "also@valid.org", "nope"]
    // print("Valid emails: \(filterValidEmails(emails))")
    
    // let items = [
    //     (name: "Book", price: 15.99, quantity: 2),
    //     (name: "Pen", price: 1.50, quantity: 10),
    //     (name: "Notebook", price: 5.00, quantity: 3)
    // ]
    // print("Total price: $\(calculateTotalPrice(items: items))")
    
    // let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    // print("Processed sum: \(processNumbers(numbers))")
    
    // let strings = ["123", "abc", "456", "78.9", "101"]
    // print("Valid integers: \(parseValidIntegers(strings))")
    
    // let letters = ["a", "b", "a", "c", "b", "a", "d", "b"]
    // print("Grouped and counted: \(groupAndCount(letters))")
    
    // print("First 5 primes after 100: \(firstFivePrimesAfter(100))")
    
    // let names = ["Alice", "Bob", "Charlie"]
    // let ages = [25, 30, 35, 40]
    // let combined = zipAndCombine(names, ages) { name, age in
    //     "\(name) is \(age) years old"
    // }
    // print("Combined: \(combined)")
    
    // let people = [
    //     Person(name: "Alice", age: 25, city: "New York"),
    //     Person(name: "Bob", age: 17, city: "London"),
    //     Person(name: "Charlie", age: 30, city: "New York"),
    //     Person(name: "David", age: 22, city: "London"),
    //     Person(name: "Eve", age: 16, city: "Paris")
    // ]
    // print("Grouped adults: \(processPersonData(people))")
}