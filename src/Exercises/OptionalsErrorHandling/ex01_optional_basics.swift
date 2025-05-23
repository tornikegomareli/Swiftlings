// Exercise 1: Optional Basics
// Learn about creating and using optionals in Swift.

import Foundation

// In Swift, an optional is a type that can either hold a value or be nil.
// Optionals are denoted with a ? after the type.
// This exercise will guide you through basic optional concepts.

// TODO: Fix the function to return a proper optional
// This function should convert a string to an integer if possible
public func stringToInt(_ string: String) -> Int? {
    // Try to convert the string to an integer and return the result
    // If the conversion fails, return nil
    return nil
}

// TODO: Implement forced unwrapping
// This function assumes the optional contains a value and extracts it directly
// WARNING: Will crash if the optional is nil
public func forceUnwrap(_ optional: Int?) -> Int {
    // Use the ! operator to forcibly unwrap the optional
    return 0  // Replace this
}

// TODO: Implement optional binding with if let
// This function safely unwraps an optional and returns true if it has a value
public func checkValueWithIfLet(_ optional: String?) -> Bool {
    // Use if let to check if the optional has a value
    // Return true if it has a value, false otherwise
    return false
}

// TODO: Implement optional binding with guard let
// This function safely unwraps an optional and performs an action if it has a value
public func processWithGuardLet(_ optional: Double?) -> String {
    // Use guard let to unwrap the optional
    // If it has a value, return "Value is [value]"
    // If it's nil, return "No value provided"
    return ""
}

// TODO: Implement implicitly unwrapped optionals
// This struct uses an implicitly unwrapped optional for a property that
// will be set before use but might not have a value at initialization
public struct LateInitializedData {
    // Create a name property that's an implicitly unwrapped optional String
    // (hint: use ! instead of ? after the type)
    
    public init() {
        // Don't set the name here
    }
    
    public mutating func setName(_ newName: String) {
        // Set the name here
    }
    
    public func displayName() -> String {
        // Return the name (this would crash if name is nil)
        return ""
    }
}

// TODO: Implement optional pattern matching
// This function categorizes an optional value using switch
public func categorizeOptional(_ optional: Int?) -> String {
    // Use a switch statement with optional pattern matching to:
    // - Return "No value" if the optional is nil
    // - Return "Small value" if the value is less than 10
    // - Return "Large value" if the value is 10 or greater
    return ""
}

// Main function to run all exercises
public func runOptionalBasics() {
    print("=== Optional Basics ===\n")
    
    // Uncomment these as you fix them:
    // testStringToInt()
    // testForceUnwrap()
    // testOptionalBindingWithIfLet()
    // testOptionalBindingWithGuardLet()
    // testImplicitlyUnwrappedOptionals()
    // testOptionalPatternMatching()
}

// Test functions (uncomment in the main function above as you implement each task)
func testStringToInt() {
    print("Testing stringToInt:")
    if let number = stringToInt("123") {
        print("Successfully converted to \(number)")
    } else {
        print("Failed to convert - unexpected!")
    }
    
    if stringToInt("hello") == nil {
        print("Correctly returned nil for invalid input")
    } else {
        print("Should have returned nil for invalid input")
    }
    print()
}

func testForceUnwrap() {
    print("Testing forceUnwrap:")
    let number: Int? = 42
    let unwrapped = forceUnwrap(number)
    print("Forced unwrapped \(number!) to \(unwrapped)")
    print()
    
    // Uncomment to see it crash:
    // let nilValue: Int? = nil
    // let _ = forceUnwrap(nilValue)
}

func testOptionalBindingWithIfLet() {
    print("Testing ifLet:")
    let hasValue = checkValueWithIfLet("Hello")
    let noValue = checkValueWithIfLet(nil)
    print("String with value: \(hasValue)")
    print("Nil string: \(noValue)")
    print()
}

func testOptionalBindingWithGuardLet() {
    print("Testing guardLet:")
    let withValue = processWithGuardLet(3.14)
    let withoutValue = processWithGuardLet(nil)
    print(withValue)
    print(withoutValue)
    print()
}

func testImplicitlyUnwrappedOptionals() {
    print("Testing implicitly unwrapped optionals:")
    var data = LateInitializedData()
    data.setName("Swift Example")
    print("Name: \(data.displayName())")
    print()
}

func testOptionalPatternMatching() {
    print("Testing optional pattern matching:")
    print("nil: \(categorizeOptional(nil))")
    print("5: \(categorizeOptional(5))")
    print("15: \(categorizeOptional(15))")
    print()
}