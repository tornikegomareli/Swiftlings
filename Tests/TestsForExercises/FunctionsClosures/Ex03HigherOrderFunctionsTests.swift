import Testing
@testable import Exercises

@Test("Higher-Order Functions Exercise 3")
func testHigherOrderFunctions() {
    // Test squareAll
    #expect(squareAll([1, 2, 3, 4, 5]) == [1, 4, 9, 16, 25])
    #expect(squareAll([]) == [])
    
    // Test getPassingGrades
    #expect(getPassingGrades([65, 72, 58, 90, 45, 83]) == [72, 90, 83])
    #expect(getPassingGrades([50, 60, 69]) == [])
    
    // Test concatenateStrings
    #expect(concatenateStrings(["Hello", "Swift", "World"], separator: " ") == "Hello Swift World")
    #expect(concatenateStrings(["A", "B", "C"], separator: "-") == "A-B-C")
    #expect(concatenateStrings(["Single"], separator: ",") == "Single")
    #expect(concatenateStrings([], separator: " ") == "")
    
    // Test processScores
    let scores = [45, 67, 82, 39, 90, 55, 71]
    let average = processScores(scores)
    #expect(average == 78) // (67+10 + 82+10 + 90+10 + 55+10 + 71+10) / 5
    
    // Test repeatOperation
    let doubled = repeatOperation(times: 3, startingWith: 2) { $0 * 2 }
    #expect(doubled == 16) // 2 -> 4 -> 8 -> 16
    
    let incremented = repeatOperation(times: 5, startingWith: 0) { $0 + 1 }
    #expect(incremented == 5)
    
    // Test compose
    let addOne: (Int) -> Int = { $0 + 1 }
    let double: (Int) -> Int = { $0 * 2 }
    let doubleThenAddOne = compose(addOne, double)
    #expect(doubleThenAddOne(5) == 11) // (5 * 2) + 1
    
    // Test curry
    func add(_ a: Int, _ b: Int) -> Int { a + b }
    let curriedAdd = curry(add)
    let add5 = curriedAdd(5)
    #expect(add5(3) == 8)
    #expect(add5(10) == 15)
    
    // Test memoize
    var callCount = 0
    func expensiveOperation(_ n: Int) -> Int {
        callCount += 1
        return n * n
    }
    
    let memoized = memoize(expensiveOperation)
    #expect(memoized(5) == 25)
    let firstCount = callCount
    #expect(memoized(5) == 25) // Should use cache
    #expect(callCount == firstCount) // Should not increase
    
    // Test findFirst
    let numbers = Array(1...100)
    if let found = findFirst(in: numbers, where: { $0 > 50 }) {
        #expect(found == 51)
    } else {
        #expect(Bool(false), "Should find value")
    }
    
    // Test >>> operator
    let triple: (Int) -> Int = { $0 * 3 }
    let plusTwo: (Int) -> Int = { $0 + 2 }
    let combined = triple >>> plusTwo
    #expect(combined(4) == 14) // (4 * 3) + 2
    
    // Test partial
    func multiply(_ a: Int, _ b: Int) -> Int { a * b }
    let multiplyBy5 = partial(multiply, 5)
    #expect(multiplyBy5(7) == 35)
    #expect(multiplyBy5(3) == 15)
    
    // Run the main function
    runHigherOrderFunctions()
    
    #expect(true, "Higher-order functions completed successfully!")
}