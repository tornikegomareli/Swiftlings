import Testing
@testable import Exercises

@Test("Generic Constraints - max function test")
func testMaxConstraint() {
  #if TESTING
  let maxInt = max(5, 10)
  #expect(maxInt == 10, "max function should return the larger of two integers")
  
  let maxDouble = max(3.14, 2.71)
  #expect(maxDouble == 3.14, "max function should return the larger of two doubles")
  
  let maxString = max("apple", "banana")
  #expect(maxString == "banana", "max function should work with strings")
  #else
  print("Test is skipped when not in testing mode")
  #expect(true, "Test is skipped in non-testing mode")
  #endif
}

@Test("Generic Constraints - describe function test")
func testDescribeConstraint() {
  #if TESTING
  let intValue = 42
  let stringValue = "Hello"
  
  let intDescription = describe(intValue)
  let stringDescription = describe(stringValue)
  
  #expect(intDescription.contains("42"), "describe function should include the value's description")
  #expect(stringDescription.contains("Hello"), "describe function should include the value's description")
  #else
  print("Test is skipped when not in testing mode")
  #expect(true, "Test is skipped in non-testing mode")
  #endif
}

@Test("Generic Constraints - add function test")
func testAddConstraint() {
  #if TESTING
  let sumInt = add(5, 10)
  #expect(sumInt == 15, "add function should correctly add integers")
  
  let sumDouble = add(3.14, 2.71)
  #expect(sumDouble > 5.8 && sumDouble < 5.9, "add function should correctly add doubles")
  #else
  print("Test is skipped when not in testing mode")
  #expect(true, "Test is skipped in non-testing mode")
  #endif
}

@Test("Generic Constraints - Cache test")
func testCacheConstraint() {
  #if TESTING
  var cache = Cache<String, Int>()
  
  cache["one"] = 1
  cache["two"] = 2
  
  #expect(cache["one"] == 1, "Cache should store and retrieve values correctly")
  #expect(cache["three"] == nil, "Cache should return nil for missing keys")
  
  cache["one"] = 10
  #expect(cache["one"] == 10, "Cache should update values correctly")
  
  let values = cache.allValues()
  #expect(values.contains(10), "allValues should return all stored values")
  #expect(values.contains(2), "allValues should return all stored values")
  #else
  print("Test is skipped when not in testing mode")
  #expect(true, "Test is skipped in non-testing mode")
  #endif
}