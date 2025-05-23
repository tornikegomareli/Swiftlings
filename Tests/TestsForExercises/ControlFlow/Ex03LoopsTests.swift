import Testing
@testable import Exercises

@Test("Loops Exercise 3")
func testLoopExercises() {
    // Test sumArray
    #expect(sumArray([1, 2, 3, 4, 5]) == 15)
    #expect(sumArray([]) == 0)
    #expect(sumArray([10, -5, 3]) == 8)
    
    // Test findFirstNegative
    #expect(findFirstNegative(in: [1, 5, -3, 7, -2]) == -3)
    #expect(findFirstNegative(in: [1, 2, 3]) == nil)
    #expect(findFirstNegative(in: [-5, -10, -1]) == -5)
    #expect(findFirstNegative(in: []) == nil)
    
    // Test findIndicesOf
    #expect(findIndicesOf(value: 3, in: [1, 3, 5, 3, 7, 3]) == [1, 3, 5])
    #expect(findIndicesOf(value: 10, in: [1, 2, 3]) == [])
    #expect(findIndicesOf(value: 1, in: [1, 1, 1]) == [0, 1, 2])
    
    // Test fibonacciNumbers
    let fib100 = fibonacciNumbers(upTo: 100)
    #expect(fib100 == [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89])
    
    let fib10 = fibonacciNumbers(upTo: 10)
    #expect(fib10 == [1, 1, 2, 3, 5, 8])
    
    let fib1 = fibonacciNumbers(upTo: 1)
    #expect(fib1 == [1, 1])
    
    // Run the main function
    runLoopExercises()
    
    #expect(true, "Loop exercises completed successfully!")
}