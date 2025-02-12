import XCTest
@testable import Exercises

final class Ex01VariablesConstantsTests: XCTestCase {
    /// Tests that `variablesAndConstantsDemo()` compiles and runs
    /// without runtime errors. Demonstrates async/await usage in tests.
    func testVariablesAndConstants() async throws {
        // We call the function; even though it’s synchronous code,
        // this test is marked async to allow concurrency if needed.
        variablesAndConstantsDemo()
        // A simple assertion to confirm the function didn’t crash.
        XCTAssertTrue(true, "Exercise compiles and runs successfully!")
        
        // If you want to measure concurrency or do async tasks, you can:
        // await Task.sleep(nanoseconds: 1_000_000_000) // example usage
        // Then check some async property. 
        // But for this exercise, there's no real async logic.
    }
}
