// Exercise 3: Structs vs Classes
// Understand when to use structs vs classes and their implications.

import Foundation

// TODO: Fix the inappropriate use of class
public struct Coordinate {
    var latitude: Double
    var longitude: Double
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

// Why is class wrong here? Convert to struct.
// Answer: Coordinate is a simple value type that doesn't need identity,
// inheritance, or reference semantics. Using a struct is more efficient
// and avoids shared state issues.

// TODO: Fix the inappropriate use of struct
public class DatabaseConnection {
    let connectionString: String
    var isConnected: Bool = false
    
    init(connectionString: String) {
        self.connectionString = connectionString
    }
    
    func connect() {
        print("Connecting to \(connectionString)")
        isConnected = true
    }
    
    func disconnect() {
        print("Disconnecting")
        isConnected = false
    }
}

// Why is struct wrong here? Convert to class.
// Answer: DatabaseConnection represents a shared resource with an identity
// that needs to maintain its state. Multiple parts of code may need to
// reference the same connection, so reference semantics are appropriate.

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
    
    func processData(_ data: inout LargeData) -> Int {
        // Using inout avoids copying the entire structure
        return data.process()
    }
    
    var dataCopy = data // We still make one copy here, but not in every function call
    let result = processData(&dataCopy)
    print("Result: \(result)")
}

// How can we fix this performance issue?
// Answer: We use 'inout' parameters to avoid creating unnecessary copies
// of large structs. Alternatively, we could use a class with reference
// semantics, or implement copy-on-write behavior.

// TODO: Choose the right type
// For each scenario, implement using the appropriate type (struct or class)

// 1. A color with RGB values
public struct Color {
    let red: UInt8
    let green: UInt8
    let blue: UInt8
    let alpha: UInt8 = 255
}

// 2. A network request manager
public class RequestManager {
    static let shared = RequestManager()
    private var activeTasks: [URLSessionTask] = []
    
    func sendRequest(_ request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        // Implementation would go here
        print("Sending request to \(request.url?.absoluteString ?? "unknown")")
    }
}

// 3. A 2D point for graphics
public struct Point2D {
    var x: Double
    var y: Double
    
    func distanceTo(_ other: Point2D) -> Double {
        let dx = x - other.x
        let dy = y - other.y
        return sqrt(dx*dx + dy*dy)
    }
}

// 4. A view controller
public class ViewController {
    var title: String
    var isViewLoaded: Bool = false
    
    init(title: String) {
        self.title = title
    }
    
    func viewDidLoad() {
        isViewLoaded = true
        print("View controller loaded: \(title)")
    }
}

// TODO: Fix the equality comparison
public struct Book: Equatable {
    let isbn: String
    let title: String
    var currentPage: Int
    
    public static func == (lhs: Book, rhs: Book) -> Bool {
        return lhs.isbn == rhs.isbn
    }
}

public class Library {
    private var books: [Book] = []
    
    func addBook(_ book: Book) {
        books.append(book)
    }
    
    func findBook(isbn: String) -> Book? {
        // Now this will work as expected
        return books.first { $0 == Book(isbn: isbn, title: "", currentPage: 0) }
    }
}

// TODO: Implement copy-on-write behavior
public struct DataBuffer {
    private class StorageBox {
        var data: [Int]
        
        init(size: Int) {
            data = Array(repeating: 0, count: size)
        }
        
        init(data: [Int]) {
            self.data = data
        }
    }
    
    private var box: StorageBox
    
    init(size: Int) {
        box = StorageBox(size: size)
    }
    
    // Implement subscript with copy-on-write
    subscript(index: Int) -> Int {
        get {
            return box.data[index]
        }
        set {
            // This only copies when necessary
            if !isKnownUniquelyReferenced(&box) {
                // Make a copy of the storage before modifying
                box = StorageBox(data: box.data)
                print("Made a copy of storage")
            }
            box.data[index] = newValue
        }
    }
}

// TODO: Handle mixed scenarios
public protocol Drawable {
    func draw()
}

// Should these be structs or classes?
public struct DrawableCircle: Drawable {
    var center: Point2D
    var radius: Double
    
    public func draw() {
        print("Drawing circle at \(center) with radius \(radius)")
    }
}

public class DrawingCanvas {
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
    let coord1 = Coordinate(latitude: 37.7749, longitude: -122.4194)
    var coord2 = coord1
    coord2.latitude = 40.7128
    print("Coord1: \(coord1.latitude)")  // Should be unchanged
    print("Coord2: \(coord2.latitude)")
    
    let db = DatabaseConnection(connectionString: "server=localhost")
    db.connect()
    // Should maintain single connection state
    
    demonstrateSharedState()
    
    demonstratePerformanceIssue()
    
    let book = Book(isbn: "123", title: "Swift Programming", currentPage: 0)
    let library = Library()
    library.addBook(book)
    if let found = library.findBook(isbn: "123") {
        print("Found book: \(found.title)")
    }
    
    var buffer1 = DataBuffer(size: 1000)
    var buffer2 = buffer1  // Should not copy yet
    buffer2[0] = 42  // Should copy now
    
    let canvas = DrawingCanvas()
    let circle = DrawableCircle(center: Point2D(x: 100, y: 100), radius: 50)
    canvas.add(circle)
    canvas.drawAll()
}