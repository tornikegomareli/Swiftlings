# Structs and Classes

Swift provides two primary building blocks for defining custom types: structs and classes. Understanding their differences, use cases, and memory management implications is crucial for writing efficient Swift code.

---

## 1. Struct Basics

### What Are They?

- **Structs** are value types that encapsulate data and behavior
- Copied when assigned or passed to functions
- Automatically get memberwise initializers
- Cannot inherit from other structs

### Why Does This Matter (From a CS Perspective)?

- Value semantics prevent aliasing bugs
- Stack allocation (usually) provides better cache locality
- Copy-on-write optimization reduces copying overhead
- No reference counting overhead for simple structs
- Thread-safe by default due to value semantics

### Swift Implementation Details

- Structs can conform to protocols
- Can have computed properties, methods, and initializers
- Mutating methods required to modify properties
- Automatic Equatable and Hashable synthesis available

### Exercise 1: `ex01_struct_basics.swift`

You'll practice:
- Creating structs with properties
- Implementing initializers
- Understanding value semantics
- Working with mutating methods

---

## 2. Class Basics

### What Are They?

- **Classes** are reference types
- Support inheritance and type casting
- Can have deinitializers
- Reference counting manages memory

### Why Does This Matter (From a CS Perspective)?

- Reference semantics enable shared mutable state
- Heap allocation with ARC (Automatic Reference Counting)
- Virtual dispatch for overridden methods
- Memory overhead for reference counting and type metadata
- Potential for reference cycles

### Swift Implementation Details

- Classes always have designated initializers
- Support for convenience initializers
- Can be marked `final` to prevent inheritance
- Property observers (willSet/didSet)

### Exercise 2: `ex02_class_basics.swift`

You'll practice:
- Creating classes with inheritance
- Understanding reference semantics
- Working with initializers and deinitializers
- Using property observers

---

## 3. Structs vs Classes

### When to Use Each?

- **Use Structs When:**
  - You need value semantics
  - The data is relatively simple
  - You want thread safety by default
  - You don't need inheritance

- **Use Classes When:**
  - You need reference semantics
  - You need inheritance
  - You need deinitializers
  - You're interfacing with Objective-C

### Exercise 3: `ex03_structs_vs_classes.swift`

You'll practice:
- Choosing between structs and classes
- Understanding performance implications
- Converting between value and reference types
- Identifying common pitfalls

---

## 4. Advanced Features

### Properties and Methods

- Computed properties vs stored properties
- Property wrappers
- Static vs instance members
- Access control

### Exercise 4: `ex04_properties_methods.swift`

You'll practice:
- Implementing computed properties
- Using property observers
- Creating static members
- Understanding lazy properties

---

## 5. Memory Management

### Reference Counting and Cycles

- Strong, weak, and unowned references
- Identifying and breaking reference cycles
- Understanding ARC behavior
- Memory leaks and debugging

### Exercise 5: `ex05_memory_management.swift`

You'll practice:
- Creating and breaking reference cycles
- Using weak and unowned appropriately
- Understanding capture in closures
- Debugging memory issues

---

## Tips for Success

1. **Default to Structs**: Use structs unless you need class features
2. **Immutability**: Prefer `let` over `var` for properties
3. **Small Types**: Keep structs small for better performance
4. **Protocol-Oriented**: Use protocols instead of inheritance when possible
5. **Memory Awareness**: Always consider reference cycles with classes

## Common Pitfalls

- Unexpected mutations with reference types
- Reference cycles causing memory leaks
- Performance issues with large structs
- Forgetting `mutating` keyword
- Misunderstanding value vs reference semantics