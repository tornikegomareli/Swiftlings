// Exercise 5: Advanced Control Flow
// Combine different control flow constructs for complex scenarios.

import Foundation

// TODO: Implement defer for resource cleanup
public func processResource(_ resourceName: String?) -> String {
    var resource: String? = nil
    
    // TODO: Use defer to ensure "Resource cleaned up" is always printed
    // Even if the function returns early
    
    guard let name = resourceName, !name.isEmpty else {
        return "Invalid resource"
    }
    
    resource = "Opened: \(name)"
    print(resource!)
    
    // Simulate processing...
    if name == "error" {
        return "Error occurred"
    }
    
    return "Successfully processed \(name)"
}

// TODO: Labeled loops
public func findInMatrix(value: Int, matrix: [[Int]]) -> (row: Int, col: Int)? {
    // Use labeled loops to break out of nested loops
    // when value is found
    // Return the position as a tuple, or nil if not found
    
    for i in 0..<matrix.count {
        for j in 0..<matrix[i].count {
            if matrix[i][j] == value {
                // How to break out of both loops?
            }
        }
    }
    
    return nil
}

// TODO: Complex pattern matching with control flow
public func routeRequest(_ request: (method: String, path: String, authenticated: Bool)) -> String {
    // Route based on:
    // - GET /home -> "Home page"
    // - GET /profile + authenticated -> "User profile"
    // - GET /profile + !authenticated -> "Please login"
    // - POST /login -> "Processing login"
    // - DELETE + authenticated -> "Delete operation"
    // - DELETE + !authenticated -> "Unauthorized"
    // - Any other -> "Not found"
    // Use switch with tuples and where clauses
}

// TODO: Combine guard, defer, and loops
public func processTransactions(_ transactions: [(id: Int, amount: Double, status: String)]) -> Double {
    var totalProcessed = 0.0
    var processedCount = 0
    
    // TODO: Add defer to print summary at end
    // "Processed X transactions totaling Y"
    
    for transaction in transactions {
        // Use guard to skip invalid transactions:
        // - status must be "pending"
        // - amount must be positive
        
        // Process valid transactions
        print("Processing transaction \(transaction.id)")
        totalProcessed += transaction.amount
        processedCount += 1
        
        // Stop if we've processed 5 transactions
    }
    
    return totalProcessed
}

// TODO: Advanced switch with associated values
indirect enum Expression {
    case number(Int)
    case addition(Expression, Expression)
    case multiplication(Expression, Expression)
    case variable(String)
}

public func evaluate(_ expression: Expression, variables: [String: Int] = [:]) -> Int {
    // Evaluate the expression recursively
    // Use switch to handle each case
    // For variables, look up in the dictionary (default to 0)
}

// TODO: Control flow with throwing functions
enum ValidationError: Error {
    case tooShort
    case tooLong
    case invalidCharacters
}

public func validateUsername(_ username: String) throws -> String {
    // Use guard to validate:
    // - Length between 3 and 20 characters
    // - Only alphanumeric and underscore
    // Throw appropriate errors or return validated username
}

// TODO: Fallthrough in switch
public func describeSeverity(_ level: Int) -> String {
    var description = ""
    
    switch level {
    case 5:
        description += "CRITICAL: "
        // Should fall through to add more
    case 4:
        description += "ERROR: "
        // Should fall through to add more
    case 3:
        description += "WARNING: "
        // Should fall through to add more
    case 2:
        description += "INFO: "
    case 1:
        description += "DEBUG: "
    default:
        return "UNKNOWN"
    }
    
    description += "Level \(level) alert"
    return description
}

// TODO: Complex control flow challenge
public func gameEngine(
    playerHealth: Int,
    enemyHealth: Int,
    playerMana: Int,
    availableActions: [String]
) -> String {
    // Implement game logic:
    // - If player health <= 0, return "Game Over"
    // - If enemy health <= 0, return "Victory"
    // - If no available actions, return "No moves available"
    // - If "heal" in actions and health < 50, prioritize healing
    // - If "fireball" in actions and mana >= 20, use it
    // - If "attack" in actions, use it
    // - Otherwise, return "Defend"
    // Use appropriate control flow constructs
}

// Main function to run all exercises
public func runAdvancedControlFlow() {
    print("=== Advanced Control Flow ===\n")
    
    // Uncomment these as you fix them:
    // print(processResource("data.txt"))
    // print(processResource("error"))
    // print(processResource(nil))
    
    // let matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    // if let position = findInMatrix(value: 5, matrix: matrix) {
    //     print("Found at: \(position)")
    // }
    
    // print(routeRequest((method: "GET", path: "/profile", authenticated: true)))
    // print(routeRequest((method: "DELETE", path: "/user", authenticated: false)))
    
    // let transactions = [
    //     (id: 1, amount: 100.0, status: "pending"),
    //     (id: 2, amount: -50.0, status: "pending"),
    //     (id: 3, amount: 200.0, status: "completed"),
    //     (id: 4, amount: 150.0, status: "pending")
    // ]
    // print("Total: \(processTransactions(transactions))")
    
    // let expr = Expression.addition(
    //     .number(5),
    //     .multiplication(.variable("x"), .number(3))
    // )
    // print("Result: \(evaluate(expr, variables: ["x": 4]))")
    
    // do {
    //     print("Valid: \(try validateUsername("swift_user"))")
    //     print("Invalid: \(try validateUsername("ab"))")
    // } catch {
    //     print("Error: \(error)")
    // }
    
    // print(describeSeverity(3))
    // print(describeSeverity(5))
    
    // print(gameEngine(
    //     playerHealth: 30,
    //     enemyHealth: 50,
    //     playerMana: 25,
    //     availableActions: ["attack", "heal", "fireball"]
    // ))
}