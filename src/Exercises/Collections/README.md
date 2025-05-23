# Collections

Swift provides several powerful collection types: **Arrays**, **Sets**, and **Dictionaries**. Understanding these from both a practical and theoretical perspective is crucial for effective Swift programming.

---

## 1. Arrays

### What Are They?

- An **Array** is an ordered collection of values of the same type
- Arrays in Swift are zero-indexed (first element is at index 0)
- They can be mutable (`var`) or immutable (`let`)

### Why Does This Matter (From a CS Perspective)?

- Arrays provide **O(1)** access time for reading/writing elements by index
- Insertion and deletion at arbitrary positions is **O(n)** due to element shifting
- Swift arrays are dynamically sized - they grow as needed
- Under the hood, Swift arrays use a contiguous block of memory with copy-on-write optimization

### Swift Implementation Details

- Arrays are value types (structs) in Swift
- When you assign an array to another variable, Swift uses copy-on-write
- Common operations: `append()`, `insert()`, `remove()`, `contains()`, `map()`, `filter()`, `reduce()`

### Exercise 1: `ex01_arrays.swift`

You'll practice:
- Creating and initializing arrays
- Accessing elements by index
- Modifying array contents
- Understanding index bounds

---

## 2. Sets

### What Are They?

- A **Set** is an unordered collection of unique values
- No duplicate elements allowed
- No defined ordering of elements

### Why Does This Matter (From a CS Perspective)?

- Sets use hash tables internally for **O(1)** average-case insertion, deletion, and lookup
- Perfect for membership testing and ensuring uniqueness
- Set operations (union, intersection, difference) are highly optimized
- Memory usage is higher than arrays due to hash table overhead

### Swift Implementation Details

- Elements must conform to `Hashable` protocol
- Common operations: `insert()`, `remove()`, `contains()`, `union()`, `intersection()`, `subtracting()`
- Iteration order is not guaranteed

### Exercise 2: `ex02_sets.swift`

You'll practice:
- Creating sets and ensuring uniqueness
- Performing set operations
- Converting between arrays and sets
- Understanding when to use sets vs arrays

---

## 3. Dictionaries

### What Are They?

- A **Dictionary** is an unordered collection of key-value pairs
- Keys must be unique and hashable
- Values can be of any type

### Why Does This Matter (From a CS Perspective)?

- Like sets, dictionaries use hash tables for **O(1)** average-case operations
- Key-value storage is fundamental to many algorithms and data structures
- Hash collisions are handled through chaining or open addressing
- Load factor affects performance and memory usage

### Swift Implementation Details

- Keys must conform to `Hashable` protocol
- Accessing a non-existent key returns `nil` (optional)
- Common operations: subscript access `dict[key]`, `updateValue()`, `removeValue()`, `keys`, `values`

### Exercise 3: `ex03_dictionaries.swift`

You'll practice:
- Creating and populating dictionaries
- Safe access with optionals
- Iterating over key-value pairs
- Merging and filtering dictionaries

---

## 4. Advanced Collections

### Exercise 4: `ex04_collection_algorithms.swift`

You'll practice:
- Implementing common algorithms with collections
- Performance considerations
- Choosing the right collection for the task
- Working with nested collections

### Exercise 5: `ex05_collection_transformations.swift`

You'll practice:
- Using `map`, `filter`, `reduce`, and `compactMap`
- Chaining operations efficiently
- Understanding lazy collections
- Custom collection operations

---

## Tips for Success

1. **Performance Matters**: Always consider the time complexity of operations
2. **Type Safety**: Swift's type system helps prevent errors at compile time
3. **Copy-on-Write**: Understanding this optimization helps write efficient code
4. **Optionals**: Dictionary access returns optionals - handle them properly
5. **Functional Programming**: Swift's collection methods embrace functional paradigms

## Common Pitfalls

- Array index out of bounds crashes
- Forgetting that dictionaries return optionals
- Not considering performance implications of nested loops with collections
- Mutating collections while iterating (use indices or create a copy)