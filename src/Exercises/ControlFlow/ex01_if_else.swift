// Exercise 1: If/Else Statements
// Learn about conditional execution in Swift.

import Foundation

// TODO: Fix the syntax error
public func basicIfElse(temperature: Int) {
    // This won't compile! Fix the if statement syntax.
    if temperature > 30
        print("It's hot!")
    else
        print("It's not hot!")
}

// TODO: Add the missing else clause
public func gradeCalculator(score: Int) -> String {
    if score >= 90 {
        return "A"
    } else if score >= 80 {
        return "B"
    } else if score >= 70 {
        return "C"
    } else if score >= 60 {
        return "D"
    }
    // What about scores below 60?
}

// TODO: Fix the type error in the condition
public func checkOptional(value: Int?) {
    // This won't compile! Optional Int can't be compared directly.
    if value > 0 {
        print("Positive value: \(value)")
    }
}

// TODO: Simplify nested conditions
public func checkMultipleConditions(age: Int, hasLicense: Bool, hasInsurance: Bool) -> String {
    if age >= 16 {
        if hasLicense {
            if hasInsurance {
                return "Can drive"
            } else {
                return "Need insurance"
            }
        } else {
            return "Need license"
        }
    } else {
        return "Too young"
    }
    // Can you rewrite this using && and || operators?
}

// TODO: Implement age category function
public func categorizeAge(_ age: Int) -> String {
    // Return appropriate category:
    // 0-12: "Child"
    // 13-19: "Teenager"
    // 20-59: "Adult"
    // 60+: "Senior"
    // Negative: "Invalid age"
}

// TODO: Fix the logical error
public func isLeapYear(_ year: Int) -> Bool {
    // A leap year is divisible by 4
    // BUT not if divisible by 100
    // UNLESS also divisible by 400
    
    if year % 4 == 0 {
        return true
    } else {
        return false
    }
    // This implementation is incomplete!
}

// TODO: Implement password strength checker
public func checkPasswordStrength(_ password: String) -> String {
    // Check multiple conditions:
    // Length < 6: "Too short"
    // Length >= 6 but < 10 and only letters: "Weak"
    // Length >= 10 or contains numbers: "Medium"
    // Length >= 10 AND contains numbers AND contains special characters: "Strong"
    // Hint: Use password.count, password.contains(where:)
}

// Main function to run all exercises
public func runIfElseExercises() {
    print("=== If/Else Exercises ===\n")
    
    // Uncomment these as you fix them:
    // basicIfElse(temperature: 35)
    // basicIfElse(temperature: 20)
    
    // print("Grade for 85: \(gradeCalculator(score: 85))")
    // print("Grade for 55: \(gradeCalculator(score: 55))")
    
    // checkOptional(value: 5)
    // checkOptional(value: nil)
    
    // print(checkMultipleConditions(age: 18, hasLicense: true, hasInsurance: true))
    
    // print("Age 15: \(categorizeAge(15))")
    // print("Age 25: \(categorizeAge(25))")
    // print("Age -5: \(categorizeAge(-5))")
    
    // print("2024 is leap year: \(isLeapYear(2024))")
    // print("2100 is leap year: \(isLeapYear(2100))")
    // print("2000 is leap year: \(isLeapYear(2000))")
    
    // print("Password '123': \(checkPasswordStrength("123"))")
    // print("Password 'abcdefgh': \(checkPasswordStrength("abcdefgh"))")
    // print("Password 'abc123def': \(checkPasswordStrength("abc123def"))")
    // print("Password 'MyP@ssw0rd!': \(checkPasswordStrength("MyP@ssw0rd!"))")
}