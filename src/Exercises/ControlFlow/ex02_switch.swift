// Exercise 2: Switch Statements
// Master pattern matching with Swift's powerful switch statements.

import Foundation

// TODO: Fix the non-exhaustive switch
public func dayType(day: String) -> String {
    switch day {
    case "Monday", "Tuesday", "Wednesday", "Thursday", "Friday":
        return "Weekday"
    case "Saturday", "Sunday":
        return "Weekend"
    }
    // What if day is something else?
}

// TODO: Add value binding
public func describeNumber(_ number: Int) -> String {
    switch number {
    case 0:
        return "Zero"
    case 1...9:
        return "Single digit"
    case 10...99:
        return "Double digit"
    case 100...999:
        return "Triple digit"
    // TODO: For negative numbers, return "Negative: (absolute value)"
    // TODO: For others, return "Large number: (number)"
    default:
        return "Number"
    }
}

// TODO: Fix the tuple matching
public func classifyPoint(x: Int, y: Int) -> String {
    let point = (x, y)
    
    switch point {
    case (0, 0):
        return "Origin"
    case (_, 0):
        return "On X-axis"
    case (0, _):
        return "On Y-axis"
    case (x, y):  // This gives a warning! Fix it.
        return "Point at (\(x), \(y))"
    }
}

// TODO: Implement with where clauses
public func categorizeGrade(subject: String, score: Int) -> String {
    // Use a switch with tuples and where clauses:
    // Math with score >= 90: "Excellent in Math"
    // Science with score >= 85: "Great at Science"
    // Any subject with score < 60: "Needs improvement in (subject)"
    // Any subject with score >= 60: "Passing (subject)"
}

// TODO: Implement enum matching
enum Weather {
    case sunny(temperature: Int)
    case rainy(chance: Int)
    case cloudy
    case snowy(inches: Double)
}

public func weatherAdvice(_ weather: Weather) -> String {
    // Match on the enum cases:
    // sunny with temp > 80: "Hot and sunny! Stay hydrated"
    // sunny with temp <= 80: "Perfect sunny day"
    // rainy with chance > 50: "Likely rain, bring umbrella"
    // rainy with chance <= 50: "Might rain, consider umbrella"
    // cloudy: "Overcast day"
    // snowy with inches > 6: "Heavy snow, stay home if possible"
    // snowy: "Light snow expected"
}

// TODO: Fix the fallthrough issue
public func monthSeason(_ month: Int) -> String {
    var description = ""
    
    switch month {
    case 12, 1, 2:
        description += "Winter"
        // Want to add " - Cold season" to all winter months
    case 3, 4, 5:
        description += "Spring"
    case 6, 7, 8:
        description += "Summer"
    case 9, 10, 11:
        description += "Fall"
    default:
        return "Invalid month"
    }
    
    return description
}

// TODO: Implement complex pattern matching
public func analyzeHTTPResponse(statusCode: Int, hasBody: Bool) -> String {
    // Use switch to categorize:
    // 200-299 with body: "Success with data"
    // 200-299 without body: "Success no data"
    // 300-399: "Redirection"
    // 400-499: "Client error"
    // 500-599: "Server error"
    // Others: "Unknown status"
}

// TODO: Advanced - Implement custom pattern matching
public func fizzBuzz(_ number: Int) -> String {
    // Implement FizzBuzz using switch and tuple matching
    // Divisible by 3 and 5: "FizzBuzz"
    // Divisible by 3: "Fizz"
    // Divisible by 5: "Buzz"
    // Otherwise: String(number)
    // Hint: Use (number % 3, number % 5) as the switch value
}

// Main function to run all exercises
public func runSwitchExercises() {
    print("=== Switch Exercises ===\n")
    
    // Uncomment these as you fix them:
    // print("Monday is: \(dayType(day: "Monday"))")
    // print("Holiday is: \(dayType(day: "Holiday"))")
    
    // print("Number -5: \(describeNumber(-5))")
    // print("Number 1000: \(describeNumber(1000))")
    
    // print("Point (0,5): \(classifyPoint(x: 0, y: 5))")
    // print("Point (3,4): \(classifyPoint(x: 3, y: 4))")
    
    // print("Math 95: \(categorizeGrade(subject: "Math", score: 95))")
    // print("English 55: \(categorizeGrade(subject: "English", score: 55))")
    
    // print(weatherAdvice(.sunny(temperature: 85)))
    // print(weatherAdvice(.rainy(chance: 30)))
    // print(weatherAdvice(.snowy(inches: 8.5)))
    
    // print("January: \(monthSeason(1))")
    // print("April: \(monthSeason(4))")
    
    // print("HTTP 200 with body: \(analyzeHTTPResponse(statusCode: 200, hasBody: true))")
    // print("HTTP 404: \(analyzeHTTPResponse(statusCode: 404, hasBody: false))")
    
    // for i in 1...15 {
    //     print("\(i): \(fizzBuzz(i))")
    // }
}