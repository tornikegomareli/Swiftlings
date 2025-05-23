import Testing
@testable import Exercises

@Test("Sets Exercise 2")
func testSetExercises() {
    // Test removeDuplicates function
    let noDupes = removeDuplicates(from: [1, 2, 2, 3, 3, 3, 4])
    #expect(Set(noDupes) == Set([1, 2, 3, 4]))
    #expect(noDupes.count == 4)
    
    // Test with all duplicates
    let allSame = removeDuplicates(from: [5, 5, 5, 5])
    #expect(allSame == [5])
    
    // Test empty array
    let emptyResult = removeDuplicates(from: [Int]())
    #expect(emptyResult.isEmpty)
    
    // Test findCommonElements function
    let common = findCommonElements([1, 2, 3, 4], [3, 4, 5, 6])
    #expect(Set(common) == Set([3, 4]))
    
    // Test with no common elements
    let noCommon = findCommonElements([1, 2], [3, 4])
    #expect(noCommon.isEmpty)
    
    // Test with string arrays
    let commonStrings = findCommonElements(["a", "b", "c"], ["b", "c", "d"])
    #expect(Set(commonStrings) == Set(["b", "c"]))
    
    // Run the main function (should not crash when properly implemented)
    runSetExercises()
    
    #expect(true, "Set exercises completed successfully!")
}