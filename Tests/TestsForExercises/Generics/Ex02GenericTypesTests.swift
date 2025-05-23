import Testing
@testable import Exercises

@Test("Generic Types - Stack test")
func testGenericStack() {
  #if TESTING
  var stack = Stack<Int>()
  #expect(stack.isEmpty, "A newly created stack should be empty")
  
  stack.push(1)
  stack.push(2)
  stack.push(3)
  
  #expect(stack.count == 3, "Stack should have 3 elements after pushing")
  #expect(stack.peek() == 3, "Peek should return the top element without removing it")
  
  let popped = stack.pop()
  #expect(popped == 3, "Pop should return the top element")
  #expect(stack.count == 2, "Stack should have 2 elements after popping")
  #else
  print("Test is skipped when not in testing mode")
  #expect(true, "Test is skipped in non-testing mode")
  #endif
}

@Test("Generic Types - Pair test")
func testGenericPair() {
  #if TESTING
  let pair = Pair(first: "Hello", second: 42)
  #expect(pair.first == "Hello", "Pair should store first value correctly")
  #expect(pair.second == 42, "Pair should store second value correctly")
  
  // Test with different types
  let mixedPair = Pair(first: 3.14, second: true)
  #expect(mixedPair.first == 3.14, "Pair should work with different types")
  #expect(mixedPair.second == true, "Pair should work with different types")
  #else
  print("Test is skipped when not in testing mode")
  #expect(true, "Test is skipped in non-testing mode")
  #endif
}

@Test("Generic Types - Queue test")
func testGenericQueue() {
  #if TESTING
  var queue = Queue<String>()
  #expect(queue.isEmpty, "A newly created queue should be empty")
  
  queue.enqueue("First")
  queue.enqueue("Second")
  queue.enqueue("Third")
  
  #expect(queue.count == 3, "Queue should have 3 elements after enqueuing")
  #expect(queue.peek() == "First", "Peek should return the first element without removing it")
  
  let dequeued = queue.dequeue()
  #expect(dequeued == "First", "Dequeue should return the first element")
  #expect(queue.count == 2, "Queue should have 2 elements after dequeuing")
  #else
  print("Test is skipped when not in testing mode")
  #expect(true, "Test is skipped in non-testing mode")
  #endif
}