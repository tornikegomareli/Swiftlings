// Exercise 3: Structs vs Classes
// Understand when to use structs vs classes and their implications.

import Foundation

// TODO: Fix the inappropriate use of class
public class Coordinate {
    var latitude: Double
    var longitude: Double
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

// Why is class wrong here? Convert to struct.

// TODO: Fix the inappropriate use of struct
public struct DatabaseConnection {
    let connectionString: String
    var isConnected: Bool = false
    
    mutating func connect() {
        print("Connecting to \(connectionString)")
        isConnected = true
    }
    
    mutating func disconnect() {
        print("Disconnecting")
        isConnected = false
    }
}

// Why is struct wrong here? Convert to class.

// TODO: Demonstrate the problem with reference types
public class SharedCounter {
    var value = 0
}

public func demonstrateSharedState() {
    let counter = SharedCounter()
    
    func incrementCounter(_ counter: SharedCounter, times: Int) {
        for _ in 0..<times {
            counter.value += 1
        }
    }
    
    // Simulate concurrent access (not truly concurrent, but demonstrates the issue)
    incrementCounter(counter, times: 100)
    incrementCounter(counter, times: 100)
    
    print("Counter value: \(counter.value)")  // What's the problem here?
}

// TODO: Fix the performance issue
public struct LargeData {
    var buffer: [Int] = Array(repeating: 0, count: 1_000_000)
    
    func process() -> Int {
        return buffer.reduce(0, +)
    }
}

public func demonstratePerformanceIssue() {
    let data = LargeData()
    
    func processData(_ data: LargeData) -> Int {
        // This creates a copy of 1 million integers!
        return data.process()
    }
    
    let result = processData(data)
    print("Result: \(result)")
}

// How can we fix this performance issue?

// TODO: Choose the right type
// For each scenario, implement using the appropriate type (struct or class)

// 1. A color with RGB values
public ??? Color {
    // Implementation
}

// 2. A network request manager
public ??? NetworkManager {
    // Implementation
}

// 3. A 2D point for graphics
public ??? Point2D {
    // Implementation
}

// 4. A view controller
public ??? ViewController {
    // Implementation
}

// TODO: Fix the equality comparison
public struct Book {
    let isbn: String
    let title: String
    var currentPage: Int
}

public class Library {
    private var books: [Book] = []
    
    func addBook(_ book: Book) {
        books.append(book)
    }
    
    func findBook(isbn: String) -> Book? {
        // This won't work as expected
        return books.first { $0 == Book(isbn: isbn, title: "", currentPage: 0) }
    }
}

// TODO: Implement copy-on-write behavior
public struct DataBuffer {
    private var storage: [Int]
    
    init(size: Int) {
        storage = Array(repeating: 0, count: size)
    }
    
    // Implement subscript with copy-on-write
    subscript(index: Int) -> Int {
        get {
            return storage[index]
        }
        set {
            // This should only copy when necessary
            storage[index] = newValue
        }
    }
}

// TODO: Handle mixed scenarios
public protocol Drawable {
    func draw()
}

// Should these be structs or classes?
public ??? Circle: Drawable {
    var center: Point2D
    var radius: Double
    
    func draw() {
        print("Drawing circle at \(center) with radius \(radius)")
    }
}

public ??? DrawingCanvas {
    private var shapes: [Drawable] = []
    
    func add(_ shape: Drawable) {
        shapes.append(shape)
    }
    
    func drawAll() {
        shapes.forEach { $0.draw() }
    }
}

// Main function to run all exercises
public func runStructsVsClasses() {
    print("=== Structs vs Classes ===\n")
    
    // Uncomment these as you fix them:
    // let coord1 = Coordinate(latitude: 37.7749, longitude: -122.4194)
    // var coord2 = coord1
    // coord2.latitude = 40.7128
    // print("Coord1: \(coord1.latitude)")  // Should be unchanged
    // print("Coord2: \(coord2.latitude)")
    
    // let db = DatabaseConnection(connectionString: "server=localhost")
    // db.connect()
    // // Should maintain single connection state
    
    // demonstrateSharedState()
    
    // demonstratePerformanceIssue()
    
    // let book = Book(isbn: "123", title: "Swift Programming", currentPage: 0)
    // let library = Library()
    // library.addBook(book)
    // if let found = library.findBook(isbn: "123") {
    //     print("Found book: \(found.title)")
    // }
    
    // var buffer1 = DataBuffer(size: 1000)
    // var buffer2 = buffer1  // Should not copy yet
    // buffer2[0] = 42  // Should copy now
    
    // let canvas = DrawingCanvas()
    // let circle = Circle(center: Point2D(x: 100, y: 100), radius: 50)
    // canvas.add(circle)
    // canvas.drawAll()
}