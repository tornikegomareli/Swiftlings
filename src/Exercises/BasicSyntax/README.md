# Basic Syntax

In this folder, we introduce some foundational concepts in Swift: **variables**, **constants**, **type inference**, and **string interpolation**. Understanding these thoroughly will help you build a strong mental model of how Swift code behaves at run-time (memory usage) and at compile-time (type checking and error detection).

---

## 1. Variables & Constants

### What Are They?

- A **variable** in Swift is a named memory location that can store a value of a particular type. The keyword `var` declares a variable, allowing its value to be mutated (changed) later.
- A **constant** in Swift is declared using `let`. Once you set its initial value, you cannot change it. This is similar to a symbolic constant in other languages, but more strictly enforced by Swift’s compiler.

### Why Does This Matter (From a CS Perspective)?

- In many compiled languages, the compiler uses variable declarations to allocate memory.  
- A `let` constant can help the compiler optimize because it knows this memory location won’t change (immutability).  
- Using `let` for values that do not change can improve code safety (prevents accidental mutation) and can also provide potential performance benefits.

### Swift Implementation Details

- Under the hood, Swift uses **stack** allocation for local value types (like `Int`, `Double`, etc.) and **heap** allocation for reference types (like classes and closures).  
- A `let` constant does not necessarily live in a different place in memory but is guaranteed not to be reassigned.  
- When you write `var x: Int = 10`, Swift will **infer** that `x` is of type `Int` (an integer). If you want a different type, you must explicitly specify it.

### Exercise 1: `ex01_variables_constants.swift`

You’ll practice:
- Declaring variables and constants.
- Changing (mutating) variables.
- Attempting to change (mutate) a constant (which should result in a compile error).

---

## 2. Type Inference

### What Is It?

- **Type Inference** means the compiler automatically deduces the type of a variable or constant at compile-time based on the initial assigned value or context.
- Swift’s compiler is known for strong static typing with robust inference. This lets you omit explicit type annotations in many cases, keeping code concise but safe.

### Why Does This Matter ?

- Static type systems can catch many errors at compile time.  
- In a lower-level sense, the compiler must decide how many bytes to allocate for each value (e.g., 4 bytes for a 32-bit `Int`, etc.).  
- Swift’s approach ensures safety: once a type is inferred, the compiler won’t allow incompatible assignments.

### Swift Implementation Details

- If you write `let integerValue = 42`, Swift infers `integerValue` is an `Int`.  
- If you write `let floatValue = 3.14`, Swift typically infers `Double`.  
- You can override inference with a type annotation, e.g., `let floatValue: Float = 3.14`.

### Exercise 2: `ex02_types_inference.swift`

You’ll practice:
- Letting the compiler infer types.
- Overriding inferred types with explicit annotations.
- Observing compile-time errors when you try to assign incompatible types.

---

## 3. String Interpolation

### What Is It?

- **String Interpolation** allows you to embed variables, constants, or expressions inside a string literal. In Swift, you write `\(expression)` inside a string.

### Why Does This Matter ?

- Conceptually, this is about how high-level languages build strings at run-time. Under the hood, the compiler and standard library must piece together multiple pieces of data into one contiguous sequence of characters in memory.
- Swift’s string type is **Unicode-compliant**, meaning it can handle complex grapheme clusters. String concatenation and interpolation have overhead in measuring or allocating new memory segments for the resulting string.

### Swift Implementation Details

- Swift uses `"\(variableOrExpression)"` to insert content into strings.  
- For instance:
  ```swift
  let age = 30
  let message = "I am \(age) years old."

