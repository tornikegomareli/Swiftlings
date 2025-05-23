// Exercise 4: Collection Algorithms
// Implement common algorithms using Swift collections.

import Foundation

// TODO: Find the two largest numbers in an array
public func findTwoLargest(_ numbers: [Int]) -> (first: Int, second: Int)? {
    // Return the two largest numbers as a tuple
    // Return nil if array has less than 2 elements
    // Don't use sort() - try to do it in O(n) time
}

// TODO: Implement a frequency counter
public func mostFrequentElement<T: Hashable>(in array: [T]) -> (element: T, count: Int)? {
    // Find the most frequent element and its count
    // Return nil for empty array
}

// TODO: Check if array has duplicate elements
public func hasDuplicates<T: Hashable>(_ array: [T]) -> Bool {
    // Return true if array contains any duplicate elements
    // Try to do this efficiently using a Set
}

// TODO: Find intersection of multiple arrays
public func intersectionOfArrays<T: Hashable>(_ arrays: [[T]]) -> [T] {
    // Return elements that appear in ALL arrays
    // Handle empty input gracefully
}

// TODO: Implement a sliding window sum
public func slidingWindowSum(_ numbers: [Int], windowSize: Int) -> [Int] {
    // Return an array of sums for each window of size windowSize
    // Example: [1,2,3,4], window 2 -> [3,5,7]
}

// TODO: Group consecutive equal elements
public func groupConsecutive<T: Equatable>(_ array: [T]) -> [[T]] {
    // Group consecutive equal elements together
    // Example: [1,1,2,2,2,3,1,1] -> [[1,1], [2,2,2], [3], [1,1]]
}

// TODO: Find all pairs that sum to target
public func findPairsWithSum(_ numbers: [Int], target: Int) -> [(Int, Int)] {
    // Find all unique pairs that sum to target
    // Don't include (a,b) and (b,a) as separate pairs
    // Use a Set or Dictionary for O(n) solution
}

// TODO: Flatten nested array (one level deep)
public func flattenOnce<T>(_ nested: [[T]]) -> [T] {
    // Flatten array by one level
    // Bonus: Try using flatMap
}

// Main function to run all exercises
public func runCollectionAlgorithms() {
    print("=== Collection Algorithms ===\n")
    
    // Test your implementations:
    
    // if let (first, second) = findTwoLargest([3, 1, 4, 1, 5, 9, 2, 6]) {
    //     print("Two largest: \(first), \(second)")
    // }
    
    // if let (element, count) = mostFrequentElement(in: ["a", "b", "c", "b", "a", "b"]) {
    //     print("Most frequent: '\(element)' appears \(count) times")
    // }
    
    // print("Has duplicates: \(hasDuplicates([1, 2, 3, 4, 5]))")
    // print("Has duplicates: \(hasDuplicates([1, 2, 3, 2, 4]))")
    
    // let common = intersectionOfArrays([[1, 2, 3], [2, 3, 4], [2, 3, 5]])
    // print("Common elements: \(common)")
    
    // let windowSums = slidingWindowSum([1, 2, 3, 4, 5], windowSize: 3)
    // print("Window sums: \(windowSums)")
    
    // let grouped = groupConsecutive([1, 1, 2, 2, 2, 3, 1, 1])
    // print("Grouped: \(grouped)")
    
    // let pairs = findPairsWithSum([1, 2, 3, 4, 5], target: 6)
    // print("Pairs summing to 6: \(pairs)")
    
    // let flattened = flattenOnce([[1, 2], [3, 4], [5]])
    // print("Flattened: \(flattened)")
}