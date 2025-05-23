// Exercise 4: Associated Types
// Learn about protocols with associated types in Swift.

import Foundation

// In Swift, protocols can have associated types, which are placeholder names
// for types that are specified when a type conforms to the protocol.
//
// Associated types provide a way to refer to a type that's used within a protocol
// without having to specify exactly what that type is until the protocol is adopted.
//
// Benefits of associated types:
// - Flexibility: Types can specify their own related types
// - Type safety: The compiler enforces relationships between types
// - Protocol composition: Protocols with associated types can be combined
//
// This exercise will guide you through using protocols with associated types.

// TODO: Fix the Container protocol
// This protocol defines a type that can store and retrieve elements
public protocol Container {
    // Define an associated type for the elements in the container
    // 'associatedtype' lets us defer specifying the actual type until conformance
    associatedtype Item
    
    // A method to add an item to the container
    mutating func add(_ item: Item)
    
    // A method to get an item at a specific index
    func get(at index: Int) -> Item?
    
    // A property to get the count of items
    var count: Int { get }
    
    // A method to check if the container contains a specific item
    // Note: This will require the Item type to be Equatable when implemented
    func contains(_ item: Item) -> Bool
}

// TODO: Implement the Container protocol for Array
// We extend Array to conform to Container, where the associated type Item is Element
extension Array: Container where Element: Equatable {
    // Implement the required methods and properties
    public mutating func add(_ item: Element) {
        append(item)
    }
    
    public func get(at index: Int) -> Element? {
        guard index >= 0 && index < count else { return nil }
        return self[index]
    }
    
    public func contains(_ item: Element) -> Bool {
        return self.contains(item)
    }
}

// TODO: Create a StackContainer that conforms to Container
public struct StackContainer<Element: Equatable>: Container {
    // Implement the StackContainer as a last-in, first-out (LIFO) data structure
    // that conforms to the Container protocol
    
    // We explicitly specify that the associated type Item is Element
    public typealias Item = Element
    
    private var items: [Element] = []
    
    public init() {}
    
    public var count: Int {
        return items.count
    }
    
    public mutating func add(_ item: Element) {
        items.append(item)
    }
    
    public func get(at index: Int) -> Element? {
        guard index >= 0 && index < items.count else { return nil }
        return items[index]
    }
    
    // Additional stack-specific methods
    public mutating func pop() -> Element? {
        return items.popLast()
    }
    
    public func peek() -> Element? {
        return items.last
    }
    
    public func contains(_ item: Element) -> Bool {
        // Since Element is constrained to Equatable, we can use the contains method
        return items.contains(item)
    }
}

// TODO: Implement a protocol with associated types for a Collection
public protocol CollectionProtocol {
    // Define associated types for the elements and an iterator
    // The Element type is the type of items in the collection
    associatedtype Element
    
    // Iterator must conform to IteratorProtocol and its element type must match our Element type
    associatedtype Iterator: IteratorProtocol where Iterator.Element == Element
    
    // A method to get an iterator for sequence operations
    func makeIterator() -> Iterator
    
    // Properties for the start and end index for collection operations
    var startIndex: Int { get }
    var endIndex: Int { get }
    
    // A subscript to access elements by position
    subscript(position: Int) -> Element { get }
}

// TODO: Fix the Iterator protocol
public protocol IteratorProtocol {
    // Define an associated type for the elements the iterator produces
    // This is the type of element that the iterator will return
    associatedtype Element
    
    // A method to advance to the next element and return it, or nil if none
    // This is what makes iteration possible - each call gives the next element
    mutating func next() -> Element?
}

// TODO: Create a LinkedList that uses the CollectionProtocol
public class LinkedList<T: Equatable>: CollectionProtocol {
    // Implement a linked list that conforms to the CollectionProtocol
    
    // Define a nested Node class to represent list nodes
    public class Node {
        public var value: T
        public var next: Node?
        
        public init(value: T, next: Node? = nil) {
            self.value = value
            self.next = next
        }
    }
    
    // Define a nested Iterator struct that conforms to IteratorProtocol
    public struct LinkedListIterator: IteratorProtocol {
        // Implement the required methods
        public typealias Element = T
        
        private var current: Node?
        
        // This initializer uses the Node type which is publicly accessible through the class
        public init(start: Node?) {
            current = start
        }
        
        public mutating func next() -> T? {
            guard let node = current else { return nil }
            let value = node.value
            current = node.next
            return value
        }
    }
    
    private var head: Node?
    private var tail: Node?
    private(set) public var count = 0
    
    public init() {}
    
    public var startIndex: Int {
        return 0
    }
    
    public var endIndex: Int {
        return count
    }
    
    public func makeIterator() -> LinkedListIterator {
        return LinkedListIterator(start: head)
    }
    
    public subscript(position: Int) -> T {
        // Implement the subscript
        // Should return the element at the specified position
        // You can assume position is valid
        guard let node = node(at: position) else {
            fatalError("Index out of bounds")
        }
        return node.value
    }
    
    public func append(_ value: T) {
        let newNode = Node(value: value)
        if let tailNode = tail {
            tailNode.next = newNode
            tail = newNode
        } else {
            head = newNode
            tail = newNode
        }
        count += 1
    }
    
    private func node(at index: Int) -> Node? {
        // Return the node at the specified index
        guard index >= 0 && index < count else { return nil }
        
        var current = head
        var currentIndex = 0
        
        while currentIndex < index, let node = current {
            current = node.next
            currentIndex += 1
        }
        
        return current
    }
}

// TODO: Create a protocol that uses Self for return types
public protocol Copyable {
    // Define a method that returns Self
    // 'Self' refers to the actual type that conforms to the protocol,
    // not a specific type like 'String' or 'Int'
    func copy() -> Self
}

// TODO: Implement Copyable for a custom type
public struct Document: Copyable {
    var title: String
    var content: String
    
    public func copy() -> Document {
        // Implement the copy method
        // This returns a new Document with the same properties
        return Document(title: title, content: content)
    }
    
    public func copyWithNewTitle(_ newTitle: String) -> Document {
        // Create a copy but with a new title
        // This demonstrates a variant of copy with customization
        return Document(title: newTitle, content: content)
    }
}

// Main function to run all exercises
public func runAssociatedTypes() {
    print("=== Associated Types ===\n")
    
    // Uncomment these as you fix them:
    testContainer()
    testStackContainer()
    testLinkedList()
    testCopyable()
}

// Test functions (uncomment in the main function above as you implement each task)
func testContainer() {
    var numbers: [Int] = []
    numbers.add(1)
    numbers.add(2)
    numbers.add(3)
    
    print("Container count: \(numbers.count)")
    print("Element at index 1: \(String(describing: numbers.get(at: 1)))")
    print("Contains 2: \(numbers.contains(2))")
    print("Contains 4: \(numbers.contains(4))")
}

func testStackContainer() {
    var stack = StackContainer<String>()
    stack.add("First")
    stack.add("Second")
    stack.add("Third")
    
    print("Stack count: \(stack.count)")
    print("Top element: \(String(describing: stack.peek()))")
    
    while let item = stack.pop() {
        print("Popped: \(item)")
    }
}

func testLinkedList() {
    let list = LinkedList<Int>()
    list.append(1)
    list.append(2)
    list.append(3)
    
    print("Linked list count: \(list.count)")
    print("Element at index 1: \(list[1])")
    
    print("Iterating through list:")
    // Manual iteration using the iterator
    var iterator = list.makeIterator()
    var element = iterator.next()
    while let value = element {
        print(" - \(value)")
        element = iterator.next()
    }
}

func testCopyable() {
    let originalDoc = Document(title: "Original Title", content: "Some content")
    let copiedDoc = originalDoc.copy()
    let renamedDoc = originalDoc.copyWithNewTitle("New Title")
    
    print("Original document: \(originalDoc.title)")
    print("Copied document: \(copiedDoc.title)")
    print("Renamed document: \(renamedDoc.title)")
}