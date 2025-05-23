import Testing
@testable import Exercises

@Test("Generic Functions - swapValues test")
func testGenericSwapFunction() {
  #if TESTING
  var a = 5
  var b = 10
  swapValues(&a, &b)
  #expect(a == 10, "swapValues should swap integers correctly")
  #expect(b == 5, "swapValues should swap integers correctly")
  
  var str1 = "Hello"
  var str2 = "World"
  swapValues(&str1, &str2)
  #expect(str1 == "World", "swapValues should swap strings correctly")
  #expect(str2 == "Hello", "swapValues should swap strings correctly")
  #else
  print("Test is skipped when not in testing mode")
  #expect(true, "Test is skipped in non-testing mode")
  #endif
}

@Test("Generic Functions - findFirstWhere test")
func testGenericFindFirstFunction() {
  #if TESTING
  let numbers = [1, 2, 3, 4, 5, 6]
  let firstEven = findFirstWhere(in: numbers, where: { $0 % 2 == 0 })
  #expect(firstEven == 2, "findFirstWhere should find first even number")
  
  let firstNegative = findFirstWhere(in: numbers, where: { $0 < 0 })
  #expect(firstNegative == nil, "findFirstWhere should return nil when no match is found")
  #else
  print("Test is skipped when not in testing mode")
  #expect(true, "Test is skipped in non-testing mode")
  #endif
}

@Test("Generic Functions - reduceElements test")
func testGenericReduceFunction() {
  #if TESTING
  let numbers = [1, 2, 3, 4, 5]
  let sum = reduceElements(numbers, initialResult: 0) { result, num in
    result + num
  }
  #expect(sum == 15, "reduceElements should calculate the sum correctly")
  
  let strings = ["Hello", " ", "World", "!"]
  let combined = reduceElements(strings, initialResult: "") { result, str in
    result + str
  }
  #expect(combined == "Hello World!", "reduceElements should combine strings correctly")
  #else
  print("Test is skipped when not in testing mode")
  #expect(true, "Test is skipped in non-testing mode")
  #endif
}