// Exercise 2: Closures
// Master closure expressions and capture semantics.

import Foundation

// TODO: Fix the closure syntax
public func sortNames(_ names: [String]) -> [String] {
    // This closure syntax is wrong
    return names.sorted(by: { s1, s2 in s1 > s2 })
}

// TODO: Use trailing closure syntax
public func filterEvenNumbers(_ numbers: [Int]) -> [Int] {
    return numbers.filter({ (number: Int) -> Bool in
        return number % 2 == 0
    })
    // Convert to trailing closure syntax
}

// TODO: Use shorthand argument names
public func multiplyAll(_ numbers: [Int], by factor: Int) -> [Int] {
    return numbers.map { number in
        return number * factor
    }
    // Use $0 instead of naming the parameter
}

// TODO: Fix the capture issue
public func makeCounter() -> () -> Int {
    var count = 0
    
    let counter = {
        count += 1
        return count
    }
    
    return counter
    // This should work, but make sure you understand why
}

// TODO: Add @escaping attribute
public func performAsyncOperation(completion: () -> Void) {
    // This simulates an async operation
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        completion()  // This won't compile!
    }
}

// TODO: Use capture list to avoid retain cycle
public class Calculator {
    var result = 0
    
    lazy var add: (Int) -> Void = { value in
        self.result += value  // Potential retain cycle!
    }
    
    public init() {}
}

// TODO: Implement a closure that captures values
public func makeGreeting(for name: String) -> (String) -> String {
    // Return a closure that captures 'name' and uses it
    // Example: let greetBob = makeGreeting(for: "Bob")
    // greetBob("morning") -> "Good morning, Bob!"
}

// TODO: Use multiple trailing closures
public func animate(
    duration: Double,
    animations: () -> Void,
    completion: (Bool) -> Void
) {
    print("Animating for \(duration) seconds")
    animations()
    completion(true)
}

public func demonstrateMultipleTrailingClosures() {
    // Call animate using multiple trailing closure syntax
    // animate(duration: 1.0) {
    //     print("Animating...")
    // } completion: { finished in
    //     print("Finished: \(finished)")
    // }
}

// TODO: Fix the optional closure call
public func executeIfProvided(_ closure: (() -> Void)?) {
    // Safely call the optional closure
    closure()  // This could crash!
}

// TODO: Implement autoclosure
public func logIfTrue(_ condition: Bool, _ message: String) {
    // Change message parameter to use @autoclosure
    // So it's only evaluated if condition is true
    if condition {
        print(message)
    }
}

// TODO: Create a complex closure example
public struct CourseStudent {
    let name: String
    let grade: Int
    let subjects: [String]
    
    public init(name: String, grade: Int, subjects: [String]) {
        self.name = name
        self.grade = grade
        self.subjects = subjects
    }
}

public func processStudents(_ students: [Student]) -> [String] {
    // Use closures to:
    // 1. Filter students with grade >= 80
    // 2. Sort by grade (descending)
    // 3. Map to strings: "Name: X, Grade: Y"
    // Do it in a single chain
}

// Main function to run all exercises
public func runClosureExercises() {
    print("=== Closure Exercises ===\n")
    
    // Uncomment these as you fix them:
    // let sorted = sortNames(["Charlie", "Alice", "Bob"])
    // print("Sorted: \(sorted)")
    
    // let evens = filterEvenNumbers([1, 2, 3, 4, 5, 6])
    // print("Evens: \(evens)")
    
    // let doubled = multiplyAll([1, 2, 3], by: 2)
    // print("Doubled: \(doubled)")
    
    // let counter = makeCounter()
    // print("Count: \(counter())")  // 1
    // print("Count: \(counter())")  // 2
    
    // performAsyncOperation {
    //     print("Async operation completed")
    // }
    
    // let calc = Calculator()
    // calc.add(5)
    // print("Result: \(calc.result)")
    
    // let greetBob = makeGreeting(for: "Bob")
    // print(greetBob("morning"))
    // print(greetBob("evening"))
    
    // demonstrateMultipleTrailingClosures()
    
    // executeIfProvided(nil)
    // executeIfProvided { print("Closure executed") }
    
    // logIfTrue(true, "This should print")
    // logIfTrue(false, "This expensive operation shouldn't run")
    
    // let students = [
    //     Student(name: "Alice", grade: 95, subjects: ["Math", "Science"]),
    //     Student(name: "Bob", grade: 78, subjects: ["English", "History"]),
    //     Student(name: "Charlie", grade: 88, subjects: ["Math", "English"]),
    //     Student(name: "Diana", grade: 82, subjects: ["Science", "History"])
    // ]
    // let topStudents = processStudents(students)
    // topStudents.forEach { print($0) }
}