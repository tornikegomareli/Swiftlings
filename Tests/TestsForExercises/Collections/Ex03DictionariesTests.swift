import Testing
@testable import Exercises

@Test("Dictionaries Exercise 3")
func testDictionaryExercises() {
    // Test countWords function
    let wordCounts = countWords(in: "the quick brown fox jumps over the lazy fox")
    #expect(wordCounts["fox"] == 2)
    #expect(wordCounts["the"] == 2)
    #expect(wordCounts["quick"] == 1)
    #expect(wordCounts.count == 8)
    
    // Test empty string
    let emptyCount = countWords(in: "")
    #expect(emptyCount.isEmpty)
    
    // Test mergeDictionaries function
    let merged = mergeDictionaries(["a": 1, "b": 2], ["b": 3, "c": 4])
    #expect(merged == ["a": 1, "b": 3, "c": 4])
    
    // Test merging with empty dictionary
    let mergedWithEmpty = mergeDictionaries(["x": 10], [:])
    #expect(mergedWithEmpty == ["x": 10])
    
    // Test invertDictionary function
    let inverted = invertDictionary(["one": 1, "two": 2, "three": 3])
    #expect(inverted == [1: "one", 2: "two", 3: "three"])
    
    // Test groupByFirstLetter function
    let grouped = groupByFirstLetter(["apple", "apricot", "banana", "cherry", "cranberry"])
    #expect(grouped["a"]?.sorted() == ["apple", "apricot"])
    #expect(grouped["b"] == ["banana"])
    #expect(grouped["c"]?.sorted() == ["cherry", "cranberry"])
    
    // Test with empty array
    let emptyGrouped = groupByFirstLetter([])
    #expect(emptyGrouped.isEmpty)
    
    // Run the main function (should not crash when properly implemented)
    runDictionaryExercises()
    
    #expect(true, "Dictionary exercises completed successfully!")
}