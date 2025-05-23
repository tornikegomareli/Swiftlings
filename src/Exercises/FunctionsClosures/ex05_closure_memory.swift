// Exercise 5: Closure Memory Management
// Understand capture semantics and avoid retain cycles.

import Foundation

// TODO: Fix the retain cycle
public class NetworkManager {
    var requestCount = 0
    var completionHandler: (() -> Void)?
    
    public init() {}
    
    public func makeRequest() {
        requestCount += 1
        
        // This creates a retain cycle!
        completionHandler = {
            print("Request #\(self.requestCount) completed")
        }
        
        // Simulate async operation
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.completionHandler?()
        }
    }
    
    deinit {
        print("NetworkManager deallocated")
    }
}

// TODO: Use unowned correctly
public class ResidentPerson {
    let name: String
    var apartment: Apartment?
    
    public init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) deallocated")
    }
}

public class Apartment {
    let unit: String
    var tenant: ResidentPerson?
    
    public init(unit: String) {
        self.unit = unit
    }
    
    public lazy var rentReceipt: () -> String = {
        // This might cause a retain cycle!
        return "\(self.tenant?.name ?? "Nobody") pays rent for \(self.unit)"
    }
    
    deinit {
        print("Apartment \(unit) deallocated")
    }
}

// TODO: Fix the escaping closure issue
public class DataProcessor {
    private var data: [Int] = []
    private var processors: [([Int]) -> [Int]] = []
    
    public init() {}
    
    public func addProcessor(_ processor: ([Int]) -> [Int]) {
        // This needs @escaping but might cause issues
        processors.append(processor)
    }
    
    public func process() -> [Int] {
        var result = data
        for processor in processors {
            result = processor(result)
        }
        return result
    }
}

// TODO: Understand value capture
public func demonstrateValueCapture() {
    var counter = 0
    var multiplier = 2
    
    let closure1 = {
        return counter * multiplier
    }
    
    let closure2 = { [counter, multiplier] in
        return counter * multiplier
    }
    
    counter = 10
    multiplier = 3
    
    print("Closure 1: \(closure1())")  // What will this print?
    print("Closure 2: \(closure2())")  // What will this print?
}

// TODO: Fix multiple closure capture
public class ButtonController {
    var buttonTitle = "Tap me"
    var tapCount = 0
    
    public init() {}
    
    public func setupButton() {
        // Multiple closures capturing self
        let tapHandler = {
            self.tapCount += 1
            print("Tapped \(self.buttonTitle) \(self.tapCount) times")
        }
        
        let longPressHandler = {
            self.buttonTitle = "Long pressed"
            print("Long press on \(self.buttonTitle)")
        }
        
        // Simulate button actions
        simulateButtonTap(tapHandler)
        simulateButtonLongPress(longPressHandler)
    }
    
    private func simulateButtonTap(_ handler: @escaping () -> Void) {
        DispatchQueue.main.async {
            handler()
        }
    }
    
    private func simulateButtonLongPress(_ handler: @escaping () -> Void) {
        DispatchQueue.main.async {
            handler()
        }
    }
    
    deinit {
        print("ButtonController deallocated")
    }
}

// TODO: Create a safe async pattern
public class AsyncOperation {
    typealias CompletionHandler = (Result<String, Error>) -> Void
    private var completion: CompletionHandler?
    
    public init() {}
    
    public func start(completion: @escaping CompletionHandler) {
        self.completion = completion
        
        // Simulate async work
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 0.1)
            
            // This might not be safe!
            self.completion?(.success("Done"))
            self.completion = nil
        }
    }
}

// TODO: Debug closure memory
public class ClosureHolder {
    var closures: [() -> Void] = []
    let identifier: String
    
    public init(identifier: String) {
        self.identifier = identifier
    }
    
    public func addClosure(_ closure: @escaping () -> Void) {
        closures.append(closure)
    }
    
    public func executeAll() {
        closures.forEach { $0() }
    }
    
    public func clearClosures() {
        closures.removeAll()
    }
    
    deinit {
        print("ClosureHolder \(identifier) deallocated")
    }
}

// Main function to run all exercises
public func runClosureMemory() {
    print("=== Closure Memory Management ===\n")
    
    // Test NetworkManager
    autoreleasepool {
        let manager = NetworkManager()
        manager.makeRequest()
        // Manager should be deallocated after this
    }
    Thread.sleep(forTimeInterval: 0.2)
    
    // Test Person/Apartment
    autoreleasepool {
        let john = ResidentPerson(name: "John")
        let unit4A = Apartment(unit: "4A")
        
        john.apartment = unit4A
        unit4A.tenant = john
        
        print(unit4A.rentReceipt())
        // Both should be deallocated after this
    }
    
    // Test value capture
    demonstrateValueCapture()
    
    // Test ButtonController
    autoreleasepool {
        let vc = ButtonController()
        vc.setupButton()
        // VC should be deallocated after this
    }
    Thread.sleep(forTimeInterval: 0.2)
    
    // Test ClosureHolder
    autoreleasepool {
        let holder = ClosureHolder(identifier: "Test")
        
        holder.addClosure { [weak holder] in
            print("Closure in \(holder?.identifier ?? "nil")")
        }
        
        holder.executeAll()
        // Holder should be deallocated after this
    }
    
    print("\nAll tests completed - check for deallocation messages")
}