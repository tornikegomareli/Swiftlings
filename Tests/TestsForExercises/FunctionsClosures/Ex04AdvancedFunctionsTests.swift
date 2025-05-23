import Testing
@testable import Exercises

@Test("Advanced Functions Exercise 4")
func testAdvancedFunctions() {
    // Test incrementAll with inout
    var numbers = [1, 2, 3, 4, 5]
    incrementAll(numbers: &numbers)
    #expect(numbers == [2, 3, 4, 5, 6])
    
    // Test calculateStatistics
    let stats = calculateStatistics(for: [1, 2, 2, 3, 4, 4, 4, 5])
    #expect(stats.mean == 3.125)
    #expect(stats.median == 3.5)
    #expect(stats.mode == 4)
    
    let stats2 = calculateStatistics(for: [1, 2, 3, 4, 5])
    #expect(stats2.mean == 3.0)
    #expect(stats2.median == 3.0)
    #expect(stats2.mode == nil) // No mode
    
    // Test StringBuilder
    let message = StringBuilder()
        .add("Hello")
        .add(" ")
        .add("Swift")
        .add("!")
        .build()
    #expect(message == "Hello Swift!")
    
    // Test safeMathOperation with throws
    do {
        let result1 = try safeMathOperation(10, 2, operation: "/")
        #expect(result1 == 5.0)
        
        let result2 = try safeMathOperation(9, 0, operation: "sqrt")
        #expect(result2 == 3.0)
        
        let result3 = try safeMathOperation(2, 3, operation: "pow")
        #expect(result3 == 8.0)
        
        _ = try safeMathOperation(10, 0, operation: "/")
        #expect(Bool(false), "Should throw division by zero")
    } catch MathError.divisionByZero {
        #expect(true)
    } catch {
        #expect(Bool(false), "Wrong error type")
    }
    
    // Test fibonacci with memoization
    let fib10 = fibonacci(10)
    #expect(fib10 == 55)
    
    // Clear cache and test again
    fibCache.removeAll()
    let fib20 = fibonacci(20)
    #expect(fib20 == 6765)
    
    // Test configure DSL
    let config = configure {
        $0.debug = true
        $0.timeout = 60
        $0.baseURL = "https://api.example.com"
        $0.retries = 5
    }
    #expect(config.debug == true)
    #expect(config.timeout == 60)
    #expect(config.baseURL == "https://api.example.com")
    #expect(config.retries == 5)
    
    // Test findDuplicates with generic constraints
    let duplicates = findDuplicates(in: [1, 2, 3, 2, 4, 3, 5])
    #expect(Set(duplicates) == Set([2, 3]))
    
    let stringDuplicates = findDuplicates(in: ["a", "b", "a", "c", "b"])
    #expect(Set(stringDuplicates) == Set(["a", "b"]))
    
    // Test measureTime
    let (result, time) = measureTime {
        Thread.sleep(forTimeInterval: 0.01)
        return "Done"
    }
    #expect(result == "Done")
    #expect(time >= 0.01)
    #expect(time < 0.02) // Should be close to 0.01
    
    // Test processCommand
    #expect(processCommand("start server") == "Started: server")
    #expect(processCommand("stop database") == "Stopped: database")
    #expect(processCommand("status") == "System status: OK")
    #expect(processCommand("invalid") == "Unknown command")
    #expect(processCommand("start") == "Invalid command format")
    
    // Run the main function
    runAdvancedFunctions()
    
    #expect(true, "Advanced functions completed successfully!")
}