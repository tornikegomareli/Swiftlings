// Exercise 1: Generic Functions
// Learn about creating and using generic functions in Swift.

import Foundation

// In Swift, generic functions allow you to write flexible, reusable functions that can work with any type.
// Generic functions use placeholder types (like T, U) that are specified when the function is called.
// 
// Benefits of generics:
// - Type safety: Compiler ensures you're using the correct types
// - Code reuse: Write one function that works with multiple types
// - Performance: No runtime casting or boxing/unboxing required
//
// This exercise will guide you through creating various generic functions.

// TODO: Fix the swapValues function
// This function should swap the values of two variables of the same type
// 
// The 'inout' keyword allows a function to modify the parameters passed to it.
// The generic type parameter <T> means this function can swap any type.
public func swapValues<T>(_ a: inout T, _ b: inout T) {
    // Hint: Parameters need to be 'inout' to be modified
    let temp = a
    a = b
    b = temp
}

// TODO: Implement a generic 'findFirstWhere' function
// This function should find the first element in an array that satisfies a given condition
// 
// The function takes:
// - An array of type T
// - A closure that takes a T and returns a Bool (the condition)
// - Returns an optional T (T?) which will be nil if no element matches
public func findFirstWhere<T>(in array: [T], where condition: (T) -> Bool) -> T? {
    // Implement: Return the first element that satisfies the condition, or nil if none found
    for element in array {
        if condition(element) {
            return element
        }
    }
    return nil
}

// TODO: Create a generic 'zipArrays' function
// This function should combine elements from two arrays into an array of pairs
// 
// Note: This implements similar functionality to Swift's built-in zip function
// but we're naming it differently to avoid conflicts
public func zipArrays<T, U>(_ first: [T], _ second: [U]) -> [(T, U)] {
    // Return an array of tuples containing elements from both arrays
    // If arrays have different lengths, only include pairs up to the shorter length
    var result: [(T, U)] = []
    let count = min(first.count, second.count)
    
    for i in 0..<count {
        result.append((first[i], second[i]))
    }
    
    return result
}

// TODO: Implement a generic 'reduceElements' function
// This function should combine all elements in an array into a single value
// 
// This is similar to Swift's built-in reduce, but we're implementing it ourselves:
// - T is the type of elements in the array
// - U is the type of the result
// - initialResult is the starting value
// - combine is a function that takes the current result and next element, returning the new result
public func reduceElements<T, U>(_ array: [T], initialResult: U, combine: (U, T) -> U) -> U {
    var result = initialResult
    
    for element in array {
        result = combine(result, element)
    }
    
    return result
}

// TODO: Create a generic 'filterElements' function
// This function should return a new array containing only elements that satisfy a condition
// 
// This function takes:
// - An array of elements of type T
// - A condition closure that takes a T and returns a Bool
// - Returns a new array with only elements where condition(element) is true
public func filterElements<T>(_ array: [T], where condition: (T) -> Bool) -> [T] {
    var result: [T] = []
    
    for element in array {
        if condition(element) {
            result.append(element)
        }
    }
    
    return result
}

// TODO: Implement a 'mapWithKeyPath' function with a keypath instead of a closure
// This function should transform an array by extracting a property from each element
// 
// KeyPath is a powerful Swift feature that lets you reference properties without calling them
// For example: \.name references the name property of an object
//
// This function:
// - Takes an array of T and a KeyPath from T to U
// - Returns an array of U by extracting the property specified by the keyPath from each element
public func mapWithKeyPath<T, U>(_ array: [T], keyPath: KeyPath<T, U>) -> [U] {
    var result: [U] = []
    
    for element in array {
        result.append(element[keyPath: keyPath])
    }
    
    return result
}

// A sample GenericPerson struct to test your functions with properties
// This is used in the test functions below to demonstrate generics with custom types
// This is used to test your implemented functions
// Don't change anything here
public struct GenericPerson {
    let name: String
    let age: Int
}

// Main function to run all exercises
public func runGenericFunctions() {
    print("=== Generic Functions ===\n")
    testSwap()
    testFindFirst()
    testZip()
    testReduce()
    testFilter()
    testMapKeyPath()
}

func testSwap() {
    var a = 5
    var b = 10
    print("Before swap: a = \(a), b = \(b)")
    swapValues(&a, &b)
    print("After swap: a = \(a), b = \(b)")
    
    var name1 = "Alice"
    var name2 = "Bob"
    print("Before swap: name1 = \(name1), name2 = \(name2)")
    swapValues(&name1, &name2)
    print("After swap: name1 = \(name1), name2 = \(name2)")
}

func testFindFirst() {
    let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    if let firstEven = findFirstWhere(in: numbers, where: { $0 % 2 == 0 }) {
        print("First even number: \(firstEven)")
    }
    
    let people = [
        GenericPerson(name: "Alice", age: 25),
        GenericPerson(name: "Bob", age: 17),
        GenericPerson(name: "Charlie", age: 30)
    ]
    if let firstAdult = findFirstWhere(in: people, where: { $0.age >= 18 }) {
        print("First adult: \(firstAdult.name)")
    }
}

func testZip() {
    let names = ["Alice", "Bob", "Charlie"]
    let ages = [25, 17, 30, 42]  // Deliberately longer than names
    let people = zipArrays(names, ages)
    print("Zipped people: \(people)")
}

func testReduce() {
    let numbers = [1, 2, 3, 4, 5]
    let sum = reduceElements(numbers, initialResult: 0) { result, element in
        result + element
    }
    print("Sum of numbers: \(sum)")
    
    let words = ["Hello", " ", "World", "!"]
    let sentence = reduceElements(words, initialResult: "") { result, element in
        result + element
    }
    print("Sentence: \(sentence)")
}

func testFilter() {
    let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    let evenNumbers = filterElements(numbers) { $0 % 2 == 0 }
    print("Even numbers: \(evenNumbers)")
    
    let people = [
        GenericPerson(name: "Alice", age: 25),
        GenericPerson(name: "Bob", age: 17),
        GenericPerson(name: "Charlie", age: 30)
    ]
    let adults = filterElements(people) { $0.age >= 18 }
    print("Adults: \(adults.map { $0.name })")
}

func testMapKeyPath() {
    let people = [
        GenericPerson(name: "Alice", age: 25),
        GenericPerson(name: "Bob", age: 17),
        GenericPerson(name: "Charlie", age: 30)
    ]
    let names = mapWithKeyPath(people, keyPath: \.name)
    print("Names: \(names)")
    
    let ages = mapWithKeyPath(people, keyPath: \.age)
    print("Ages: \(ages)")
}
