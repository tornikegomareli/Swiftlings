import Testing
@testable import Exercises

@Test("Associated Types - Array Container test")
func testArrayContainer() {
  #if TESTING
  var array: [Int] = [1, 2]
  array.add(3)
  #expect(array.contains(3), "Array should implement Container protocol correctly")
  #expect(array.count == 3, "Array count should be 3 after adding an element")
  #expect(array.get(at: 0) == 1, "get(at:) should return the element at the specified index")
  #expect(array.get(at: 10) == nil, "get(at:) should return nil for out-of-bounds indices")
  #else
  print("Test is skipped when not in testing mode")
  #expect(true, "Test is skipped in non-testing mode")
  #endif
}

@Test("Associated Types - StackContainer test")
func testStackContainer() {
  #if TESTING
  var stack = StackContainer<Int>()
  #expect(stack.isEmpty, "A new stack should be empty")
  
  stack.add(1)
  stack.add(2)
  stack.add(3)
  
  #expect(stack.count == 3, "Stack should have 3 elements after adding")
  #expect(stack.peek() == 3, "peek() should return the top element")
  #expect(stack.contains(2), "contains() should find elements in the stack")
  #expect(!stack.contains(4), "contains() should return false for elements not in the stack")
  
  let popped = stack.pop()
  #expect(popped == 3, "pop() should return the top element")
  #expect(stack.count == 2, "Stack should have 2 elements after popping")
  #else
  print("Test is skipped when not in testing mode")
  #expect(true, "Test is skipped in non-testing mode")
  #endif
}

@Test("Associated Types - LinkedList test")
func testLinkedList() {
  #if TESTING
  let list = LinkedList<Int>()
  list.append(1)
  list.append(2)
  list.append(3)
  
  #expect(list.count == 3, "LinkedList should have correct count")
  #expect(list[0] == 1, "LinkedList subscript should work correctly")
  #expect(list[1] == 2, "LinkedList subscript should work correctly")
  #expect(list[2] == 3, "LinkedList subscript should work correctly")
  #else
  print("Test is skipped when not in testing mode")
  #expect(true, "Test is skipped in non-testing mode")
  #endif
}

@Test("Associated Types - Copyable test")
func testCopyable() {
  #if TESTING
  let originalDoc = Document(title: "Original", content: "Content")
  let copiedDoc = originalDoc.copy()
  
  #expect(copiedDoc.title == "Original", "copy() should create a copy with the same title")
  #expect(copiedDoc.content == "Content", "copy() should create a copy with the same content")
  
  let newTitleDoc = originalDoc.copyWithNewTitle("New Title")
  #expect(newTitleDoc.title == "New Title", "copyWithNewTitle() should create a copy with a new title")
  #expect(newTitleDoc.content == "Content", "copyWithNewTitle() should preserve the content")
  #else
  print("Test is skipped when not in testing mode")
  #expect(true, "Test is skipped in non-testing mode")
  #endif
}