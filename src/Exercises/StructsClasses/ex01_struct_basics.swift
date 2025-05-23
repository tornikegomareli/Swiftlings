// Exercise 1: Struct Basics
// Learn about creating and using structs in Swift.

import Foundation

// TODO: Fix the struct declaration
public struct Point
    var x: Double
    var y: Double
}

// TODO: Add a memberwise initializer
public struct Rectangle {
    let width: Double
    let height: Double
    
    // The compiler provides this automatically, but try writing it explicitly
}

// TODO: Fix the mutating method
public struct Counter {
    private var count = 0
    
    func increment() {
        count += 1  // This won't compile!
    }
    
    func getCount() -> Int {
        return count
    }
}

// TODO: Understand value semantics
public func demonstrateValueSemantics() {
    var point1 = Point(x: 10, y: 20)
    var point2 = point1  // What happens here?
    
    point2.x = 30
    
    print("point1.x: \(point1.x)")  // What will this print?
    print("point2.x: \(point2.x)")  // What will this print?
}

// TODO: Implement computed properties
public struct Circle {
    var radius: Double
    
    // Add computed properties for:
    // - diameter (2 * radius)
    // - area (π * radius²)
    // - circumference (2 * π * radius)
}

// TODO: Create a struct with validation
public struct Email {
    private(set) var address: String
    
    // Create an initializer that validates the email
    // Must contain @ and .
    // Return nil if invalid
    init?(address: String) {
        self.address = address
        // Add validation here
    }
}

// TODO: Implement methods
public struct BankAccount {
    private(set) var balance: Double
    let accountNumber: String
    
    public init(accountNumber: String, initialBalance: Double = 0) {
        self.accountNumber = accountNumber
        self.balance = initialBalance
    }
    
    // Add methods:
    // - deposit(amount: Double) -> Bool (returns false if amount <= 0)
    // - withdraw(amount: Double) -> Bool (returns false if insufficient funds)
    // - transfer(amount: Double, to: inout BankAccount) -> Bool
}

// TODO: Work with nested types
public struct Game {
    struct Player {
        var name: String
        var score: Int
    }
    
    private var players: [Player] = []
    
    // Add methods:
    // - addPlayer(name: String)
    // - updateScore(for playerName: String, score: Int) -> Bool
    // - getWinner() -> Player? (highest score)
}

// TODO: Implement Equatable
public struct Person {
    let name: String
    let age: Int
    let email: String
    
    // Make this conform to Equatable
    // Two persons are equal if they have the same email
}

// Main function to run all exercises
public func runStructBasics() {
    print("=== Struct Basics ===\n")
    
    // Uncomment these as you fix them:
    // let point = Point(x: 5, y: 10)
    // print("Point: (\(point.x), \(point.y))")
    
    // let rect = Rectangle(width: 100, height: 50)
    // print("Rectangle: \(rect.width) x \(rect.height)")
    
    // var counter = Counter()
    // counter.increment()
    // counter.increment()
    // print("Count: \(counter.getCount())")
    
    // demonstrateValueSemantics()
    
    // let circle = Circle(radius: 5)
    // print("Circle - Radius: \(circle.radius), Area: \(circle.area)")
    
    // if let email = Email(address: "test@example.com") {
    //     print("Valid email: \(email.address)")
    // }
    // if Email(address: "invalid-email") == nil {
    //     print("Invalid email rejected")
    // }
    
    // var account1 = BankAccount(accountNumber: "123", initialBalance: 1000)
    // var account2 = BankAccount(accountNumber: "456", initialBalance: 500)
    // account1.deposit(amount: 200)
    // account1.transfer(amount: 300, to: &account2)
    // print("Account 1: $\(account1.balance)")
    // print("Account 2: $\(account2.balance)")
    
    // var game = Game()
    // game.addPlayer(name: "Alice")
    // game.addPlayer(name: "Bob")
    // game.updateScore(for: "Alice", score: 100)
    // game.updateScore(for: "Bob", score: 85)
    // if let winner = game.getWinner() {
    //     print("Winner: \(winner.name) with \(winner.score) points")
    // }
    
    // let person1 = Person(name: "John", age: 30, email: "john@example.com")
    // let person2 = Person(name: "Johnny", age: 25, email: "john@example.com")
    // print("Same person? \(person1 == person2)")
}