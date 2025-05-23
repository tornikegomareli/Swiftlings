// Exercise 3: Generic Constraints
// Learn about using type constraints with generics in Swift.

import Foundation

// In Swift, generic constraints allow you to require that a generic type
// conforms to specific protocols or inherits from a specific class.
// This enables you to create generic code that relies on specific capabilities.
//
// Constraints are specified with the 'where' clause or by adding protocol conformance
// requirements after the generic type parameter.
//
// This exercise will guide you through different ways to use constraints.

// TODO: Fix the 'max' function
// This function should find the maximum of two values of the same type
public func max<T: Comparable>(_ a: T, _ b: T) -> T {
    // The compiler will error because T doesn't guarantee comparison
    // Hint: Add a constraint to ensure T can be compared
    return a > b ? a : b
}

// TODO: Implement a 'describe' function that works with CustomStringConvertible types
// This function should return a string representation of any type that conforms to CustomStringConvertible
public func describe<T: CustomStringConvertible>(_ value: T) -> String {
    // Hint: Add a constraint so you can call the 'description' property
    return "Value: \(value.description)"
}

// TODO: Create a 'add' function that works with numeric types
// This function should add two values of the same numeric type
public func add<T: Numeric>(_ a: T, _ b: T) -> T {
    // Hint: Use the Numeric protocol as a constraint
    return a + b
}

// TODO: Implement a 'areEqual' function that works with equatable types
// This function should check if two values are equal
public func areEqual<T: Equatable>(_ a: T, _ b: T) -> Bool {
    // Hint: Add a constraint to ensure T can be compared for equality
    return a == b
}

// TODO: Create a 'sort' function that sorts a collection of comparable elements
// This function should sort a collection in ascending order
public func sort<C: Collection>(_ collection: C) -> [C.Element] where C.Element: Comparable {
    // Hint: Add constraints to ensure C is a collection and its elements are comparable
    return collection.sorted()
}

// TODO: Implement a 'merge' function that merges two dictionaries
// This function should combine two dictionaries, with values from the second dictionary
// taking precedence when keys overlap
public func merge<Key: Hashable, Value>(_ dict1: [Key: Value], _ dict2: [Key: Value]) -> [Key: Value] {
    // Hint: Add a constraint to ensure Key can be used as a dictionary key
    var result = dict1
    for (key, value) in dict2 {
        result[key] = value
    }
    return result
}

// TODO: Create a 'contains' function that checks if a value is in a collection
// This function should return true if the value is found in the collection
public func contains<C: Collection, T: Equatable>(_ collection: C, value: T) -> Bool where C.Element == T {
    // Hint: Add constraints to ensure C is a collection and T can be compared for equality
    return collection.contains(value)
}

// TODO: Implement a 'processItems' function with multiple constraints
// This function should convert a sequence of CustomStringConvertible items to strings
public func processItems<S: Sequence>(_ sequence: S) -> [String] where S.Element: CustomStringConvertible {
    // Hint: Add multiple constraints using a 'where' clause
    return sequence.map { $0.description }
}

// TODO: Create a generic cache with type constraints
// A cache that stores values indexed by keys, where keys must be hashable
public struct Cache<Key: Hashable, Value> {
    // Implement the cache using a dictionary
    // Hint: Add a constraint to ensure Key can be used as a dictionary key
    
    private var storage: [Key: Value] = [:]
    
    public init() {}
    
    public subscript(key: Key) -> Value? {
        get {
            return storage[key]
        }
        set {
            storage[key] = newValue
        }
    }
    
    public func allValues() -> [Value] {
        return Array(storage.values)
    }
}

// Main function to run all exercises
public func runConstraints() {
    print("=== Generic Constraints ===\n")
    
    // Uncomment these as you fix them:
    testMax()
    testDescribe()
    testAdd()
    testAreEqual()
    testSort()
    testMerge()
    testContains()
    testProcessItems()
    testCache()
}

// Test functions (uncomment in the main function above as you implement each task)
func testMax() {
    let maxInt = max(5, 10)
    print("Max of 5 and 10: \(maxInt)")
    
    let maxDouble = max(3.14, 2.71)
    print("Max of 3.14 and 2.71: \(maxDouble)")
    
    let maxString = max("apple", "banana")
    print("Max of 'apple' and 'banana': \(maxString)")
}

func testDescribe() {
    let number = 42
    let text = "Hello"
    let date = Date()
    
    print(describe(number))
    print(describe(text))
    print(describe(date))
}

func testAdd() {
    let sumInt = add(5, 10)
    print("5 + 10 = \(sumInt)")
    
    let sumDouble = add(3.14, 2.71)
    print("3.14 + 2.71 = \(sumDouble)")
    
    // This should work with any Numeric type
    let sumCGFloat = add(CGFloat(1.5), CGFloat(2.5))
    print("1.5 + 2.5 = \(sumCGFloat)")
}

func testAreEqual() {
    print("Are 5 and 5 equal? \(areEqual(5, 5))")
    print("Are 5 and 10 equal? \(areEqual(5, 10))")
    print("Are 'hello' and 'hello' equal? \(areEqual("hello", "hello"))")
    print("Are 'hello' and 'world' equal? \(areEqual("hello", "world"))")
}

func testSort() {
    let numbers = [5, 2, 8, 1, 9, 3]
    let sortedNumbers = sort(numbers)
    print("Sorted numbers: \(sortedNumbers)")
    
    let words = ["banana", "apple", "cherry", "date"]
    let sortedWords = sort(words)
    print("Sorted words: \(sortedWords)")
}

func testMerge() {
    let dict1 = ["a": 1, "b": 2, "c": 3]
    let dict2 = ["b": 22, "d": 4]
    let merged = merge(dict1, dict2)
    print("Merged dictionary: \(merged)")
}

func testContains() {
    let numbers = [1, 2, 3, 4, 5]
    print("Does [1, 2, 3, 4, 5] contain 3? \(contains(numbers, value: 3))")
    print("Does [1, 2, 3, 4, 5] contain 6? \(contains(numbers, value: 6))")
    
    let text = "Hello, world!"
    print("Does 'Hello, world!' contain 'o'? \(contains(text, value: "o"))")
    print("Does 'Hello, world!' contain 'z'? \(contains(text, value: "z"))")
}

func testProcessItems() {
    let numbers = [1, 2, 3, 4, 5]
    let strings = processItems(numbers)
    print("Processed numbers: \(strings)")
    
    // Create specific types that conform to CustomStringConvertible
    struct StringItem: CustomStringConvertible {
        let value: String
        var description: String { return value }
    }
    
    struct NumberItem: CustomStringConvertible {
        let value: Int
        var description: String { return "\(value)" }
    }
    
    // Create homogeneous arrays of each type
    let stringItems = [StringItem(value: "one"), StringItem(value: "two")]
    let numberItems = [NumberItem(value: 1), NumberItem(value: 2)]
    
    let stringDescriptions = processItems(stringItems)
    let numberDescriptions = processItems(numberItems)
    
    print("Processed string items: \(stringDescriptions)")
    print("Processed number items: \(numberDescriptions)")
}

func testCache() {
    var cache = Cache<String, Int>()
    cache["one"] = 1
    cache["two"] = 2
    cache["three"] = 3
    
    print("Value for key 'two': \(String(describing: cache["two"]))")
    print("All values: \(cache.allValues())")
    
    cache["two"] = 22
    print("Updated value for key 'two': \(String(describing: cache["two"]))")
}