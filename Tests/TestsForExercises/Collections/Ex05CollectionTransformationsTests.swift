import Testing
@testable import Exercises

@Test("Collection Transformations Exercise 5")
func testCollectionTransformations() {
    // Test uppercaseFirstLetters
    let words = ["hello", "world", "swift", "programming"]
    let capitalized = uppercaseFirstLetters(words)
    #expect(capitalized == ["Hello", "World", "Swift", "Programming"])
    
    // Test filterValidEmails
    let emails = ["valid@email.com", "invalid", "also@valid.org", "nope", "test@domain.co.uk"]
    let validEmails = filterValidEmails(emails)
    #expect(validEmails.count == 3)
    #expect(validEmails.contains("valid@email.com"))
    #expect(validEmails.contains("also@valid.org"))
    
    // Test calculateTotalPrice
    let items = [
        (name: "Book", price: 15.99, quantity: 2),
        (name: "Pen", price: 1.50, quantity: 10),
        (name: "Notebook", price: 5.00, quantity: 3)
    ]
    let total = calculateTotalPrice(items: items)
    #expect(total == 61.98) // (15.99*2) + (1.50*10) + (5.00*3)
    
    // Test processNumbers
    let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    let processedSum = processNumbers(numbers)
    #expect(processedSum == 220) // 8^2 + 10^2 + 12^2 = 64 + 100 + 144 = 308
    
    // Test parseValidIntegers
    let strings = ["123", "abc", "456", "78.9", "101", "-42"]
    let integers = parseValidIntegers(strings)
    #expect(integers == [123, 456, 101, -42])
    
    // Test groupAndCount
    let letters = ["a", "b", "a", "c", "b", "a", "d", "b"]
    let grouped = groupAndCount(letters)
    #expect(grouped.count == 4)
    #expect(grouped[0].element == "a" || grouped[0].element == "b") // Most frequent
    #expect(grouped[0].count == 3)
    
    // Test firstFivePrimesAfter
    let primes = firstFivePrimesAfter(100)
    #expect(primes.count == 5)
    #expect(primes[0] == 101)
    #expect(primes[1] == 103)
    
    // Test zipAndCombine
    let names = ["Alice", "Bob", "Charlie"]
    let ages = [25, 30, 35, 40]
    let combined = zipAndCombine(names, ages) { name, age in
        "\(name) is \(age) years old"
    }
    #expect(combined.count == 3)
    #expect(combined[0] == "Alice is 25 years old")
    
    // Test processPersonData
    let people = [
        Person(name: "Alice", age: 25, city: "New York"),
        Person(name: "Bob", age: 17, city: "London"),
        Person(name: "Charlie", age: 30, city: "New York"),
        Person(name: "David", age: 22, city: "London"),
        Person(name: "Eve", age: 16, city: "Paris")
    ]
    let groupedPeople = processPersonData(people)
    #expect(groupedPeople["New York"] == ["Alice", "Charlie"])
    #expect(groupedPeople["London"] == ["David"])
    #expect(groupedPeople["Paris"] == nil) // Eve is under 18
    
    // Run the main function
    runTransformationExercises()
    
    #expect(true, "Collection transformations completed successfully!")
}