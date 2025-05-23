import Testing
@testable import Exercises

@Test("Arrays Exercise 1")
func testArrayExercises() {
    // Test createArray function
    let testArray = createArray(size: 3, defaultValue: "test")
    #expect(testArray.count == 3)
    #expect(testArray.allSatisfy { $0 == "test" })
    
    // Test doubleNumbers function
    let doubled = doubleNumbers([1, 2, 3, 4, 5])
    #expect(doubled == [2, 4, 6, 8, 10])
    
    // Test empty array
    let emptyDoubled = doubleNumbers([])
    #expect(emptyDoubled.isEmpty)
    
    // Run the main function (should not crash when properly implemented)
    runArrayExercises()
    
    #expect(true, "Array exercises completed successfully!")
}