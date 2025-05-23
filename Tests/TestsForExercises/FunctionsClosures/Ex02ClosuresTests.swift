import Testing
@testable import Exercises

@Test("Closures Exercise 2")
func testClosures() {
    // Test sortNames
    let sorted = sortNames(["Charlie", "Alice", "Bob"])
    #expect(sorted == ["Charlie", "Bob", "Alice"]) // Descending order
    
    // Test filterEvenNumbers with trailing closure
    let evens = filterEvenNumbers([1, 2, 3, 4, 5, 6])
    #expect(evens == [2, 4, 6])
    
    // Test multiplyAll with shorthand
    let doubled = multiplyAll([1, 2, 3], by: 2)
    #expect(doubled == [2, 4, 6])
    
    // Test makeCounter
    let counter = makeCounter()
    #expect(counter() == 1)
    #expect(counter() == 2)
    #expect(counter() == 3)
    
    // Test makeGreeting
    let greetBob = makeGreeting(for: "Bob")
    #expect(greetBob("morning") == "Good morning, Bob!")
    #expect(greetBob("evening") == "Good evening, Bob!")
    
    let greetAlice = makeGreeting(for: "Alice")
    #expect(greetAlice("afternoon") == "Good afternoon, Alice!")
    
    // Test executeIfProvided
    var executed = false
    executeIfProvided { executed = true }
    #expect(executed == true)
    
    executeIfProvided(nil) // Should not crash
    
    // Test processStudents
    let students = [
        Student(name: "Alice", grade: 95, subjects: ["Math", "Science"]),
        Student(name: "Bob", grade: 78, subjects: ["English", "History"]),
        Student(name: "Charlie", grade: 88, subjects: ["Math", "English"]),
        Student(name: "Diana", grade: 82, subjects: ["Science", "History"])
    ]
    
    let topStudents = processStudents(students)
    #expect(topStudents.count == 3) // Only grades >= 80
    #expect(topStudents[0] == "Name: Alice, Grade: 95")
    #expect(topStudents[1] == "Name: Charlie, Grade: 88")
    #expect(topStudents[2] == "Name: Diana, Grade: 82")
    
    // Run the main function
    runClosureExercises()
    
    #expect(true, "Closure exercises completed successfully!")
}