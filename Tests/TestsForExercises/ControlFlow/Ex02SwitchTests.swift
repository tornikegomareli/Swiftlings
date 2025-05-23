import Testing
@testable import Exercises

@Test("Switch Exercise 2")
func testSwitchExercises() {
    // Test dayType
    #expect(dayType(day: "Monday") == "Weekday")
    #expect(dayType(day: "Saturday") == "Weekend")
    #expect(dayType(day: "Sunday") == "Weekend")
    #expect(dayType(day: "Holiday") == "Invalid day")
    
    // Test describeNumber
    #expect(describeNumber(0) == "Zero")
    #expect(describeNumber(5) == "Single digit")
    #expect(describeNumber(50) == "Double digit")
    #expect(describeNumber(500) == "Triple digit")
    #expect(describeNumber(-10) == "Negative: 10")
    #expect(describeNumber(1000) == "Large number: 1000")
    
    // Test categorizeGrade
    #expect(categorizeGrade(subject: "Math", score: 95) == "Excellent in Math")
    #expect(categorizeGrade(subject: "Science", score: 87) == "Great at Science")
    #expect(categorizeGrade(subject: "English", score: 55) == "Needs improvement in English")
    #expect(categorizeGrade(subject: "History", score: 75) == "Passing History")
    
    // Test weatherAdvice
    #expect(weatherAdvice(.sunny(temperature: 85)) == "Hot and sunny! Stay hydrated")
    #expect(weatherAdvice(.sunny(temperature: 75)) == "Perfect sunny day")
    #expect(weatherAdvice(.rainy(chance: 60)) == "Likely rain, bring umbrella")
    #expect(weatherAdvice(.rainy(chance: 30)) == "Might rain, consider umbrella")
    #expect(weatherAdvice(.cloudy) == "Overcast day")
    #expect(weatherAdvice(.snowy(inches: 8.0)) == "Heavy snow, stay home if possible")
    #expect(weatherAdvice(.snowy(inches: 2.0)) == "Light snow expected")
    
    // Test analyzeHTTPResponse
    #expect(analyzeHTTPResponse(statusCode: 200, hasBody: true) == "Success with data")
    #expect(analyzeHTTPResponse(statusCode: 204, hasBody: false) == "Success no data")
    #expect(analyzeHTTPResponse(statusCode: 301, hasBody: true) == "Redirection")
    #expect(analyzeHTTPResponse(statusCode: 404, hasBody: false) == "Client error")
    #expect(analyzeHTTPResponse(statusCode: 500, hasBody: true) == "Server error")
    #expect(analyzeHTTPResponse(statusCode: 600, hasBody: false) == "Unknown status")
    
    // Test fizzBuzz
    #expect(fizzBuzz(3) == "Fizz")
    #expect(fizzBuzz(5) == "Buzz")
    #expect(fizzBuzz(15) == "FizzBuzz")
    #expect(fizzBuzz(7) == "7")
    #expect(fizzBuzz(30) == "FizzBuzz")
    
    // Run the main function
    runSwitchExercises()
    
    #expect(true, "Switch exercises completed successfully!")
}