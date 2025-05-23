// Exercise 2: Generic Types
// Learn about creating and using generic types in Swift.

import Foundation

// In Swift, you can create generic custom types that can work with any type.
// Generic types allow you to define flexible, reusable data structures.
//
// Benefits of generic types:
// - Type safety across your data structure
// - Code reuse without duplicating implementation for each type
// - Better performance than using protocols with associated types in some cases
//
// This exercise will guide you through creating various generic data structures.

// TODO: Fix the Stack implementation
// A stack is a last-in, first-out (LIFO) data structure
// The generic parameter <Element> lets us create stacks of any type
public struct Stack<Element> {
    // We're using an array to store the stack elements
    private var items: [Element] = []
    
    // The isEmpty property should tell if the stack has no elements
    public var isEmpty: Bool {
        // Implement this property
        return items.isEmpty
    }
    
    // The count property should return the number of elements in the stack
    public var count: Int {
        // Implement this property
        return items.count
    }
    
    // The peek method should return the top element without removing it
    public func peek() -> Element? {
        // Implement this method
        return items.last
    }
    
    // The push method should add an element to the top of the stack
    public mutating func push(_ item: Element) {
        // Implement this method
        items.append(item)
    }
    
    // The pop method should remove and return the top element
    public mutating func pop() -> Element? {
        // Implement this method
        return items.popLast()
    }
}

// TODO: Create a generic Pair type
// A pair holds exactly two values which can be of different types
// The generic parameters <First, Second> allow us to create pairs of any two types
public struct Pair<First, Second> {
    // Add properties and initializers
    public let first: First
    public let second: Second
    
    public init(first: First, second: Second) {
        self.first = first
        self.second = second
    }
}

// TODO: Implement a generic Queue
// A queue is a first-in, first-out (FIFO) data structure
public struct Queue<Element> {
    // Implement a queue using two stacks for efficient operations
    // Hint: Use one stack for enqueue operations and another for dequeue
    private var enqueueStack = Stack<Element>()
    private var dequeueStack = Stack<Element>()
    
    public var isEmpty: Bool {
        // Implement this property
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    
    public var count: Int {
        // Implement this property
        return enqueueStack.count + dequeueStack.count
    }
    
    // The peek method should return the first element without removing it
    public func peek() -> Element? {
        // Implement this method
        // If dequeueStack is empty, we need to transfer elements from enqueueStack
        var mutableSelf = self
        mutableSelf.moveElementsIfNeeded()
        return mutableSelf.dequeueStack.peek()
    }
    
    // The enqueue method should add an element to the end of the queue
    public mutating func enqueue(_ item: Element) {
        // Implement this method
        enqueueStack.push(item)
    }
    
    // The dequeue method should remove and return the first element
    public mutating func dequeue() -> Element? {
        // Implement this method
        moveElementsIfNeeded()
        return dequeueStack.pop()
    }
    
    // Helper method to transfer elements from enqueueStack to dequeueStack
    private mutating func moveElementsIfNeeded() {
        if dequeueStack.isEmpty {
            var tempStack = enqueueStack // Create a temporary copy
            enqueueStack = Stack<Element>() // Clear the enqueue stack
            while let item = tempStack.pop() {
                dequeueStack.push(item)
            }
        }
    }
}

// TODO: Create a generic CustomResult type
// A result represents either a success with a value or a failure with an error
// Note: This is similar to Swift's built-in Result type, but we're creating our own
// to understand how it works
public enum CustomResult<Success, Failure: Error> {
    // Define the two cases: success and failure
    case success(Success)
    case failure(Failure)
    
    // Add a method to get the value if successful, or throw the error if failure
    public func get() throws -> Success {
        // Implement this method
        switch self {
        case .success(let value):
            return value
        case .failure(let error):
            throw error
        }
    }
    
    // Add a method to transform the success value
    // The map function returns a new CustomResult with the transformed value
    // If the original result was a failure, it remains unchanged
    public func map<NewSuccess>(_ transform: (Success) -> NewSuccess) -> CustomResult<NewSuccess, Failure> {
        // Implement this method
        switch self {
        case .success(let value):
            return .success(transform(value))
        case .failure(let error):
            return .failure(error)
        }
    }
    
    // Add a flatMap method that transforms the success value with a function
    // that returns another CustomResult
    public func flatMap<NewSuccess>(_ transform: (Success) -> CustomResult<NewSuccess, Failure>) 
        -> CustomResult<NewSuccess, Failure> {
        switch self {
        case .success(let value):
            return transform(value)
        case .failure(let error):
            return .failure(error)
        }
    }
}

// TODO: Create a generic BinarySearchTree
// A binary search tree is a hierarchical data structure where each node has at most two children
// Note: The Element type must conform to Comparable so we can determine node placement
public class BinarySearchTree<Element: Comparable> {
    // Add a nested Node class to represent tree nodes
    private class Node {
        var value: Element
        var left: Node?
        var right: Node?
        
        init(value: Element) {
            self.value = value
        }
    }
    
    // The root of the tree
    private var root: Node?
    
    public init() {}
    
    // Implement methods to insert, search, and traverse the tree
    public func insert(_ value: Element) {
        // Implement this method
        root = insert(value, into: root)
    }
    
    // Helper method to recursively insert a value
    private func insert(_ value: Element, into node: Node?) -> Node {
        // If the node is nil, create a new node with the value
        guard let node = node else {
            return Node(value: value)
        }
        
        // If the value is less than the node's value, insert into the left subtree
        if value < node.value {
            node.left = insert(value, into: node.left)
        }
        // If the value is greater than the node's value, insert into the right subtree
        else if value > node.value {
            node.right = insert(value, into: node.right)
        }
        // If the value is equal, we'll just ignore it (no duplicates)
        
        return node
    }
    
    public func contains(_ value: Element) -> Bool {
        // Implement this method
        return contains(value, in: root)
    }
    
    // Helper method to recursively search for a value
    private func contains(_ value: Element, in node: Node?) -> Bool {
        // If the node is nil, the value is not in the tree
        guard let node = node else {
            return false
        }
        
        // If the value is less than the node's value, search in the left subtree
        if value < node.value {
            return contains(value, in: node.left)
        }
        // If the value is greater than the node's value, search in the right subtree
        else if value > node.value {
            return contains(value, in: node.right)
        }
        // If the value is equal to the node's value, we found it
        else {
            return true
        }
    }
    
    public func inOrderTraversal() -> [Element] {
        // Implement this method to return elements in sorted order
        var result: [Element] = []
        inOrderTraversal(node: root, result: &result)
        return result
    }
    
    // Helper method to recursively traverse the tree in-order
    private func inOrderTraversal(node: Node?, result: inout [Element]) {
        // Base case: if the node is nil, return
        guard let node = node else {
            return
        }
        
        // Traverse left subtree
        inOrderTraversal(node: node.left, result: &result)
        // Visit node
        result.append(node.value)
        // Traverse right subtree
        inOrderTraversal(node: node.right, result: &result)
    }
}

// Main function to run all exercises
public func runGenericTypes() {
    print("=== Generic Types ===\n")
    
    // Uncomment these as you fix them:
    testStack()
    testPair()
    testQueue()
    testResult()
    testBinarySearchTree()
}

// Test functions (uncomment in the main function above as you implement each task)
func testStack() {
    var intStack = Stack<Int>()
    intStack.push(1)
    intStack.push(2)
    intStack.push(3)
    print("Stack: count = \(intStack.count), top element = \(String(describing: intStack.peek()))")
    
    while let item = intStack.pop() {
        print("Popped: \(item)")
    }
    
    print("Stack is empty: \(intStack.isEmpty)")
}

func testPair() {
    let namePair = Pair(first: "John", second: "Doe")
    let personDetails = Pair(first: "Alice", second: 30)
    
    print("Name pair: \(namePair.first) \(namePair.second)")
    print("Person details: \(personDetails.first), \(personDetails.second) years old")
}

func testQueue() {
    var queue = Queue<String>()
    queue.enqueue("First")
    queue.enqueue("Second")
    queue.enqueue("Third")
    
    print("Queue: count = \(queue.count), first element = \(String(describing: queue.peek()))")
    
    while let item = queue.dequeue() {
        print("Dequeued: \(item)")
    }
    
    print("Queue is empty: \(queue.isEmpty)")
}

func testResult() {
    func divide(_ x: Int, by y: Int) -> CustomResult<Int, DivisionError> {
        if y == 0 {
            return .failure(DivisionError.divisionByZero)
        }
        return .success(x / y)
    }
    
    enum DivisionError: Error {
        case divisionByZero
    }
    
    let result1 = divide(10, by: 2)
    let result2 = divide(10, by: 0)
    
    do {
        let value = try result1.get()
        print("Division result: \(value)")
    } catch {
        print("Error: \(error)")
    }
    
    do {
        let value = try result2.get()
        print("Division result: \(value)")
    } catch {
        print("Error: \(error)")
    }
    
    // Test map
    let mappedResult = result1.map { $0 * 2 }
    if let value = try? mappedResult.get() {
        print("Mapped result: \(value)")
    }
}

func testBinarySearchTree() {
    let tree = BinarySearchTree<Int>()
    let values = [5, 3, 7, 2, 4, 6, 8]
    
    for value in values {
        tree.insert(value)
    }
    
    print("Tree contains 4: \(tree.contains(4))")
    print("Tree contains 9: \(tree.contains(9))")
    
    let sortedValues = tree.inOrderTraversal()
    print("In-order traversal: \(sortedValues)")
}