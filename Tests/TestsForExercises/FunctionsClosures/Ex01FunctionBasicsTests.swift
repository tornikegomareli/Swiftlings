import Testing
@testable import Exercises

@Test("Function Basics Exercise 1")
func testFunctionBasics() {
    // Test calculateArea with labels
    let area = calculateArea(width: 10, height: 20)
    #expect(area == 200)
    
    // Test divide with optional return
    if let result = divide(10, by: 2) {
        #expect(result == 5)
    } else {
        #expect(Bool(false), "Should return value for valid division")
    }
    
    #expect(divide(10, by: 0) == nil)
    
    // Test calculateAverage variadic
    #expect(calculateAverage(1.0, 2.0, 3.0, 4.0, 5.0) == 3.0)
    #expect(calculateAverage() == 0.0)
    #expect(calculateAverage(10.0) == 10.0)
    
    // Test minMax tuple return
    if let (min, max) = minMax(array: [3, 1, 4, 1, 5, 9]) {
        #expect(min == 1)
        #expect(max == 9)
    } else {
        #expect(Bool(false), "Should return min/max")
    }
    
    #expect(minMax(array: []) == nil)
    
    // Test process overloading
    #expect(process(42) == "Processing integer: 42")
    #expect(process("Hello") == "Processing string: Hello")
    #expect(process(3.14).contains("3.14"))
    
    // Test swapValues with inout
    var x = 5, y = 10
    swapValues(a: &x, b: &y)
    #expect(x == 10)
    #expect(y == 5)
    
    // Test makeMultiplier
    let triple = makeMultiplier(factor: 3)
    #expect(triple(4) == 12)
    #expect(triple(10) == 30)
    
    let double = makeMultiplier(factor: 2)
    #expect(double(5) == 10)
    
    // Run the main function
    runFunctionBasics()
    
    #expect(true, "Function basics completed successfully!")
}