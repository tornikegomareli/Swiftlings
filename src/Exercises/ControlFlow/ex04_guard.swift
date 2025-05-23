// Exercise 4: Guard Statements
// Learn to use guard for early exits and cleaner code.

import Foundation

// TODO: Convert if-let to guard
public func processOptionalValue(_ value: Int?) -> String {
    if let unwrapped = value {
        // Do lots of processing here
        let doubled = unwrapped * 2
        let result = "Value is \(unwrapped), doubled is \(doubled)"
        return result
    } else {
        return "No value"
    }
    // Convert this to use guard for better readability
}

// TODO: Fix the guard statement
public func validateAge(_ age: Int?) -> Bool {
    // This won't compile! Guard must transfer control.
    guard let validAge = age, validAge >= 0 else {
        print("Invalid age")
    }
    
    return validAge < 120
}

// TODO: Multiple conditions in guard
public func createUser(name: String?, email: String?, age: Int?) -> String {
    // Validate all parameters using a single guard statement
    // All must be non-nil
    // name must not be empty
    // email must contain "@"
    // age must be >= 18
    // Return "User created: (name)" or appropriate error message
}

// TODO: Guard vs if-let comparison
public func processDataBadStyle(_ data: [String: Any]?) -> String {
    if let dict = data {
        if let name = dict["name"] as? String {
            if !name.isEmpty {
                if let age = dict["age"] as? Int {
                    if age >= 0 {
                        return "Processing \(name), age \(age)"
                    }
                }
            }
        }
    }
    return "Invalid data"
}

public func processDataGoodStyle(_ data: [String: Any]?) -> String {
    // Rewrite the above using guard statements
    // Should be much more readable!
}

// TODO: Guard with where clause
public func processNumbers(_ numbers: [Int]?) -> Int {
    // Guard that numbers is not nil and not empty
    // Use where clause in the guard
    // Return sum of numbers, or 0 if guard fails
}

// TODO: Guard in loops
public func findValidEmails(in strings: [String]) -> [String] {
    var validEmails: [String] = []
    
    for string in strings {
        // Use guard to skip invalid emails
        // Email must contain "@" and "."
        // Email must be at least 5 characters
        // Add valid emails to the array
    }
    
    return validEmails
}

// TODO: Complex guard validation
public func processOrder(
    items: [String]?,
    customerID: Int?,
    paymentMethod: String?,
    shippingAddress: String?
) -> String {
    // Validate order using guard:
    // - items must not be nil or empty
    // - customerID must be positive
    // - paymentMethod must be "card" or "cash"
    // - shippingAddress must not be nil or empty
    // Return "Order processed for customer (ID)" or specific error
}

// TODO: Guard with defer
public func processFile(filename: String?) -> String {
    print("Starting file processing...")
    
    // Use defer to ensure cleanup message is printed
    // Use guard to validate filename
    // Simulate file processing
    // The "Cleanup complete" message should always print
    
    return "File processed"
}

// Main function to run all exercises
public func runGuardExercises() {
    print("=== Guard Exercises ===\n")
    
    // Uncomment these as you fix them:
    // print(processOptionalValue(42))
    // print(processOptionalValue(nil))
    
    // print("Valid age 25: \(validateAge(25))")
    // print("Valid age nil: \(validateAge(nil))")
    
    // print(createUser(name: "Alice", email: "alice@example.com", age: 25))
    // print(createUser(name: "", email: "alice@example.com", age: 25))
    // print(createUser(name: "Bob", email: "invalid", age: 17))
    
    // let testData: [String: Any] = ["name": "Charlie", "age": 30]
    // print("Bad style: \(processDataBadStyle(testData))")
    // print("Good style: \(processDataGoodStyle(testData))")
    
    // print("Sum: \(processNumbers([1, 2, 3, 4, 5]))")
    // print("Sum empty: \(processNumbers([]))")
    // print("Sum nil: \(processNumbers(nil))")
    
    // let emails = ["test@example.com", "invalid", "a@b.c", "valid@email.org"]
    // print("Valid emails: \(findValidEmails(in: emails))")
    
    // print(processOrder(
    //     items: ["Book", "Pen"],
    //     customerID: 123,
    //     paymentMethod: "card",
    //     shippingAddress: "123 Main St"
    // ))
    
    // print(processFile(filename: "data.txt"))
    // print(processFile(filename: nil))
}