// Exercise 3: Dictionaries
// Learn about key-value storage with dictionaries in Swift.

import Foundation

// TODO: Create a dictionary
public func dictionaryBasics() {
    // Fix this dictionary declaration
    let ages: [String: Int] = // Add dictionary literal here
    
    // TODO: Safely access a value that might not exist
    if let aliceAge = ages["Alice"] {
        print("Alice is \(aliceAge) years old")
    }
}

// TODO: Fix the force unwrap crash
public func safeDictionaryAccess() {
    let scores = ["Math": 95, "Science": 87, "History": 92]
    
    // This might crash! Make it safe.
    let englishScore = scores["English"]!
    print("English score: \(englishScore)")
}

// TODO: Implement a word counter
public func countWords(in text: String) -> [String: Int] {
    // Count occurrences of each word in the text
    // Hint: Split the text and use a dictionary
}

// TODO: Merge two dictionaries
public func mergeDictionaries(_ dict1: [String: Int], _ dict2: [String: Int]) -> [String: Int] {
    // Merge dict2 into dict1
    // If a key exists in both, use the value from dict2
}

// TODO: Fix the mutable dictionary issue
public func updateDictionary() {
    // This won't compile! Make the dictionary mutable
    let inventory = ["apples": 10, "bananas": 5]
    
    // TODO: Update the apple count to 15
    inventory["apples"] = 15
    
    // TODO: Add oranges with count 8
    inventory["oranges"] = 8
    
    // TODO: Remove bananas from inventory
    inventory.removeValue(forKey: "bananas")
    
    print("Updated inventory: \(inventory)")
}

// TODO: Implement a function to invert a dictionary
public func invertDictionary<K: Hashable, V: Hashable>(_ dict: [K: V]) -> [V: K] {
    // Return a new dictionary with keys and values swapped
    // Note: This assumes values are unique
}

// TODO: Group array elements by a property
public func groupByFirstLetter(_ words: [String]) -> [Character: [String]] {
    // Group words by their first letter
    // Example: ["apple", "ant", "bear"] -> ["a": ["apple", "ant"], "b": ["bear"]]
}

// Main function to run all exercises
public func runDictionaryExercises() {
    print("=== Dictionary Exercises ===\n")
    
    // Uncomment these as you fix them:
    // dictionaryBasics()
    // safeDictionaryAccess()
    // updateDictionary()
    
    // Test your implementations:
    // let wordCounts = countWords(in: "the quick brown fox jumps over the lazy fox")
    // print("Word counts: \(wordCounts)")
    
    // let merged = mergeDictionaries(["a": 1, "b": 2], ["b": 3, "c": 4])
    // print("Merged: \(merged)")
    
    // let inverted = invertDictionary(["one": 1, "two": 2, "three": 3])
    // print("Inverted: \(inverted)")
    
    // let grouped = groupByFirstLetter(["apple", "apricot", "banana", "cherry", "cranberry"])
    // print("Grouped: \(grouped)")
}