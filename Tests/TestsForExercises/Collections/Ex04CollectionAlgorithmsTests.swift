import Testing
@testable import Exercises

@Test("Collection Algorithms Exercise 4")
func testCollectionAlgorithms() {
    // Test findTwoLargest
    if let (first, second) = findTwoLargest([3, 1, 4, 1, 5, 9, 2, 6]) {
        #expect(first == 9)
        #expect(second == 6)
    } else {
        #expect(Bool(false), "Should find two largest")
    }
    
    // Test with minimum elements
    #expect(findTwoLargest([1]) == nil)
    #expect(findTwoLargest([]) == nil)
    
    // Test mostFrequentElement
    if let (element, count) = mostFrequentElement(in: ["a", "b", "c", "b", "a", "b"]) {
        #expect(element == "b")
        #expect(count == 3)
    } else {
        #expect(Bool(false), "Should find most frequent")
    }
    
    // Test hasDuplicates
    #expect(hasDuplicates([1, 2, 3, 4, 5]) == false)
    #expect(hasDuplicates([1, 2, 3, 2, 4]) == true)
    #expect(hasDuplicates([Int]()) == false)
    
    // Test intersectionOfArrays
    let common = intersectionOfArrays([[1, 2, 3], [2, 3, 4], [2, 3, 5]])
    #expect(Set(common) == Set([2, 3]))
    
    // Test empty intersection
    let noCommon = intersectionOfArrays([[1, 2], [3, 4], [5, 6]])
    #expect(noCommon.isEmpty)
    
    // Test slidingWindowSum
    let windowSums = slidingWindowSum([1, 2, 3, 4, 5], windowSize: 3)
    #expect(windowSums == [6, 9, 12])
    
    // Test window size edge cases
    let singleWindow = slidingWindowSum([1, 2, 3], windowSize: 3)
    #expect(singleWindow == [6])
    
    // Test groupConsecutive
    let grouped = groupConsecutive([1, 1, 2, 2, 2, 3, 1, 1])
    #expect(grouped == [[1, 1], [2, 2, 2], [3], [1, 1]])
    
    // Test findPairsWithSum
    let pairs = findPairsWithSum([1, 2, 3, 4, 5], target: 6)
    let expectedPairs = Set(pairs.map { Set([$0.0, $0.1]) })
    #expect(expectedPairs.count == 2) // (1,5) and (2,4)
    
    // Test flattenOnce
    let flattened = flattenOnce([[1, 2], [3, 4], [5]])
    #expect(flattened == [1, 2, 3, 4, 5])
    
    // Run the main function
    runCollectionAlgorithms()
    
    #expect(true, "Collection algorithms completed successfully!")
}