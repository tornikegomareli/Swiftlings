import Testing
@testable import Exercises

@Test("Guard Exercise 4")
func testGuardExercises() {
    // Test processOptionalValue
    #expect(processOptionalValue(42).contains("42"))
    #expect(processOptionalValue(42).contains("84"))
    #expect(processOptionalValue(nil) == "No value")
    
    // Test createUser
    #expect(createUser(name: "Alice", email: "alice@example.com", age: 25) == "User created: Alice")
    #expect(createUser(name: "", email: "alice@example.com", age: 25).contains("Invalid"))
    #expect(createUser(name: "Bob", email: "invalid", age: 17).contains("Invalid"))
    #expect(createUser(name: nil, email: "test@test.com", age: 20).contains("Invalid"))
    
    // Test processNumbers
    #expect(processNumbers([1, 2, 3, 4, 5]) == 15)
    #expect(processNumbers([]) == 0)
    #expect(processNumbers(nil) == 0)
    
    // Test findValidEmails
    let emails = ["test@example.com", "invalid", "a@b.c", "valid@email.org", "@.", "no"]
    let validEmails = findValidEmails(in: emails)
    #expect(validEmails.count == 3)
    #expect(validEmails.contains("test@example.com"))
    #expect(validEmails.contains("valid@email.org"))
    #expect(validEmails.contains("a@b.c"))
    
    // Test processOrder
    let validOrder = processOrder(
        items: ["Book", "Pen"],
        customerID: 123,
        paymentMethod: "card",
        shippingAddress: "123 Main St"
    )
    #expect(validOrder == "Order processed for customer 123")
    
    let invalidOrder1 = processOrder(
        items: [],
        customerID: 123,
        paymentMethod: "card",
        shippingAddress: "123 Main St"
    )
    #expect(invalidOrder1.contains("Invalid") || invalidOrder1.contains("Error"))
    
    let invalidOrder2 = processOrder(
        items: ["Book"],
        customerID: -1,
        paymentMethod: "card",
        shippingAddress: "123 Main St"
    )
    #expect(invalidOrder2.contains("Invalid") || invalidOrder2.contains("Error"))
    
    // Run the main function
    runGuardExercises()
    
    #expect(true, "Guard exercises completed successfully!")
}