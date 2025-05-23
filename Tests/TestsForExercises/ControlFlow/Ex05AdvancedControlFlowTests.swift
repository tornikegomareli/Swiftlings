import Testing
@testable import Exercises

@Test("Advanced Control Flow Exercise 5")
func testAdvancedControlFlow() {
    // Test findInMatrix
    let matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    if let position = findInMatrix(value: 5, matrix: matrix) {
        #expect(position.row == 1)
        #expect(position.col == 1)
    } else {
        #expect(Bool(false), "Should find value in matrix")
    }
    
    #expect(findInMatrix(value: 10, matrix: matrix) == nil)
    
    // Test routeRequest
    #expect(routeRequest((method: "GET", path: "/home", authenticated: false)) == "Home page")
    #expect(routeRequest((method: "GET", path: "/profile", authenticated: true)) == "User profile")
    #expect(routeRequest((method: "GET", path: "/profile", authenticated: false)) == "Please login")
    #expect(routeRequest((method: "POST", path: "/login", authenticated: false)) == "Processing login")
    #expect(routeRequest((method: "DELETE", path: "/any", authenticated: true)) == "Delete operation")
    #expect(routeRequest((method: "DELETE", path: "/any", authenticated: false)) == "Unauthorized")
    #expect(routeRequest((method: "PUT", path: "/update", authenticated: true)) == "Not found")
    
    // Test evaluate
    let expr1 = Expression.number(5)
    #expect(evaluate(expr1) == 5)
    
    let expr2 = Expression.addition(.number(3), .number(4))
    #expect(evaluate(expr2) == 7)
    
    let expr3 = Expression.multiplication(.number(5), .variable("x"))
    #expect(evaluate(expr3, variables: ["x": 3]) == 15)
    #expect(evaluate(expr3, variables: [:]) == 0)
    
    let expr4 = Expression.addition(
        .number(5),
        .multiplication(.variable("x"), .number(3))
    )
    #expect(evaluate(expr4, variables: ["x": 4]) == 17)
    
    // Test validateUsername
    do {
        let valid = try validateUsername("swift_user")
        #expect(valid == "swift_user")
        
        let valid2 = try validateUsername("user123")
        #expect(valid2 == "user123")
    } catch {
        #expect(Bool(false), "Valid usernames should not throw")
    }
    
    do {
        _ = try validateUsername("ab")
        #expect(Bool(false), "Should throw for too short")
    } catch ValidationError.tooShort {
        #expect(true)
    } catch {
        #expect(Bool(false), "Wrong error type")
    }
    
    // Test describeSeverity
    #expect(describeSeverity(1) == "DEBUG: Level 1 alert")
    #expect(describeSeverity(3) == "WARNING: INFO: DEBUG: Level 3 alert")
    #expect(describeSeverity(5) == "CRITICAL: ERROR: WARNING: INFO: DEBUG: Level 5 alert")
    
    // Test gameEngine
    #expect(gameEngine(playerHealth: 0, enemyHealth: 50, playerMana: 100, availableActions: ["attack"]) == "Game Over")
    #expect(gameEngine(playerHealth: 50, enemyHealth: 0, playerMana: 100, availableActions: ["attack"]) == "Victory")
    #expect(gameEngine(playerHealth: 30, enemyHealth: 50, playerMana: 25, availableActions: ["heal", "fireball", "attack"]) == "heal")
    #expect(gameEngine(playerHealth: 80, enemyHealth: 50, playerMana: 25, availableActions: ["fireball", "attack"]) == "fireball")
    #expect(gameEngine(playerHealth: 80, enemyHealth: 50, playerMana: 10, availableActions: ["fireball", "attack"]) == "attack")
    #expect(gameEngine(playerHealth: 50, enemyHealth: 50, playerMana: 50, availableActions: []) == "No moves available")
    
    // Run the main function
    runAdvancedControlFlow()
    
    #expect(true, "Advanced control flow exercises completed successfully!")
}