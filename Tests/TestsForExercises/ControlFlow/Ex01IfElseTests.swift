import Testing
@testable import Exercises

@Test("If/Else Exercise 1")
func testIfElseExercises() {
    // Test gradeCalculator
    #expect(gradeCalculator(score: 95) == "A")
    #expect(gradeCalculator(score: 85) == "B")
    #expect(gradeCalculator(score: 75) == "C")
    #expect(gradeCalculator(score: 65) == "D")
    #expect(gradeCalculator(score: 55) == "F")
    #expect(gradeCalculator(score: 0) == "F")
    
    // Test categorizeAge
    #expect(categorizeAge(5) == "Child")
    #expect(categorizeAge(13) == "Teenager")
    #expect(categorizeAge(19) == "Teenager")
    #expect(categorizeAge(25) == "Adult")
    #expect(categorizeAge(60) == "Senior")
    #expect(categorizeAge(75) == "Senior")
    #expect(categorizeAge(-5) == "Invalid age")
    
    // Test isLeapYear
    #expect(isLeapYear(2024) == true)  // Divisible by 4
    #expect(isLeapYear(2023) == false) // Not divisible by 4
    #expect(isLeapYear(2100) == false) // Divisible by 100 but not 400
    #expect(isLeapYear(2000) == true)  // Divisible by 400
    #expect(isLeapYear(1900) == false) // Divisible by 100 but not 400
    
    // Test checkPasswordStrength
    #expect(checkPasswordStrength("123") == "Too short")
    #expect(checkPasswordStrength("12345") == "Too short")
    #expect(checkPasswordStrength("abcdefgh") == "Weak")
    #expect(checkPasswordStrength("abcdefghij") == "Medium")
    #expect(checkPasswordStrength("abc123") == "Medium")
    #expect(checkPasswordStrength("MyP@ssw0rd!") == "Strong")
    #expect(checkPasswordStrength("abcdefghij123@#$") == "Strong")
    
    // Run the main function (should not crash when properly implemented)
    runIfElseExercises()
    
    #expect(true, "If/Else exercises completed successfully!")
}