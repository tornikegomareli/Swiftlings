# Functions and Closures

Functions and closures are fundamental building blocks in Swift. Functions are named closures, and closures are unnamed functions. Understanding their relationship and capabilities is crucial for writing idiomatic Swift code.

---

## 1. Function Basics

### What Are They?

- **Functions** are self-contained chunks of code that perform specific tasks
- They can accept parameters and return values
- Swift functions are first-class citizens (can be assigned to variables, passed as arguments)

### Why Does This Matter (From a CS Perspective)?

- Functions enable procedural abstraction and code reuse
- The call stack manages function invocations and local variables
- Parameter passing mechanisms (value vs reference) affect performance
- Function inlining and tail call optimization are compiler optimizations

### Swift Implementation Details

- Parameters are constants by default (use `inout` for mutation)
- Support for default parameters, variadic parameters, and parameter labels
- Functions can return multiple values via tuples
- Function types can be used as parameters or return types

### Exercise 1: `ex01_function_basics.swift`

You'll practice:
- Defining functions with various parameter configurations
- Understanding parameter labels and argument labels
- Working with default parameters and variadic functions
- Function overloading

---

## 2. Closures

### What Are They?

- **Closures** are self-contained blocks of functionality
- Can capture and store references to constants and variables from surrounding context
- Three forms: global functions, nested functions, and closure expressions

### Why Does This Matter (From a CS Perspective)?

- Closures implement lexical scoping and variable capture
- Memory management considerations with strong/weak/unowned references
- Enable functional programming patterns
- Closure capture lists prevent retain cycles

### Swift Implementation Details

- Trailing closure syntax for readability
- Type inference often eliminates need for explicit types
- Shorthand argument names (`$0`, `$1`, etc.)
- `@escaping` for closures that outlive the function

### Exercise 2: `ex02_closures.swift`

You'll practice:
- Writing closure expressions
- Using trailing closure syntax
- Understanding capture semantics
- Working with escaping vs non-escaping closures

---

## 3. Higher-Order Functions

### What Are They?

- Functions that take other functions as parameters or return functions
- Enable functional programming patterns
- Common examples: `map`, `filter`, `reduce`, `sorted`

### Why Does This Matter (From a CS Perspective)?

- Higher-order functions enable abstraction over control flow
- Lazy evaluation can improve performance
- Function composition creates more modular code
- Enables declarative rather than imperative programming

### Swift Implementation Details

- Standard library provides many higher-order functions
- Can chain operations for readable data transformations
- Lazy sequences defer computation until needed

### Exercise 3: `ex03_higher_order_functions.swift`

You'll practice:
- Using map, filter, and reduce
- Creating custom higher-order functions
- Function composition
- Understanding performance implications

---

## 4. Function Builders and Result Builders

### What Are They?

- Special attributes that transform a series of statements into a single value
- Used extensively in SwiftUI and other DSLs
- Enable declarative syntax for building complex values

### Why Does This Matter (From a CS Perspective)?

- Domain-Specific Languages (DSLs) improve code expressiveness
- Compile-time transformation of syntax
- Type-safe builder patterns
- Enables new programming paradigms within Swift

### Exercise 4: `ex04_advanced_functions.swift`

You'll practice:
- inout parameters and mutation
- Function types as parameters and returns
- Nested functions and scope
- Creating simple DSLs

---

## 5. Memory Management with Closures

### Capture Lists and Reference Cycles

- Understanding strong, weak, and unowned references
- Preventing memory leaks with capture lists
- Debugging retain cycles

### Exercise 5: `ex05_closure_memory.swift`

You'll practice:
- Identifying potential retain cycles
- Using capture lists effectively
- Understanding closure lifetime
- Working with self in closures

---

## Tips for Success

1. **Think Functionally**: Prefer immutable data and pure functions
2. **Use Type Inference**: Let Swift infer types when obvious
3. **Trailing Closures**: Use them for better readability
4. **Avoid Retain Cycles**: Always consider capture semantics
5. **Higher-Order Functions**: Use them instead of loops when appropriate

## Common Pitfalls

- Forgetting `@escaping` for stored closures
- Creating retain cycles with strong self captures
- Overusing force unwrapping in closures
- Not understanding value vs reference capture
- Ignoring performance implications of closure allocation