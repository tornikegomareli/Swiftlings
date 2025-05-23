# Control Flow

Control flow statements determine the order in which code is executed. Swift provides powerful control flow constructs including conditionals, loops, and pattern matching. Understanding these deeply helps write more expressive and efficient code.

---

## 1. Conditionals (if/else)

### What Are They?

- **if/else** statements execute code blocks based on boolean conditions
- Swift requires conditions to be explicitly boolean (no implicit conversions)
- Supports chaining with `else if`

### Why Does This Matter (From a CS Perspective)?

- Branching is fundamental to computation (Turing completeness)
- Modern CPUs use branch prediction to optimize conditional execution
- Poor branching patterns can cause pipeline stalls
- Compiler optimizations like dead code elimination depend on control flow analysis

### Swift Implementation Details

- No parentheses required around conditions (but allowed)
- Braces are mandatory (prevents dangling else problem)
- Conditions must be `Bool` type exactly

### Exercise 1: `ex01_if_else.swift`

You'll practice:
- Basic if/else statements
- Chained conditions
- Nested conditionals
- Common pitfalls with optionals in conditions

---

## 2. Switch Statements

### What Are They?

- **switch** provides multi-way branching based on pattern matching
- Must be exhaustive (cover all cases)
- No implicit fallthrough between cases

### Why Does This Matter (From a CS Perspective)?

- Switch statements can be optimized into jump tables for O(1) dispatch
- Pattern matching is a powerful feature from functional programming
- Exhaustiveness checking prevents runtime errors
- Compiler can optimize dense integer switches better than if/else chains

### Swift Implementation Details

- Supports value binding, where clauses, and compound cases
- Can match against ranges, tuples, and custom patterns
- `default` case or exhaustive enumeration required

### Exercise 2: `ex02_switch.swift`

You'll practice:
- Basic switch syntax
- Pattern matching with different types
- Value binding in cases
- Where clauses for additional conditions

---

## 3. Loops (for-in, while, repeat-while)

### What Are They?

- **for-in** loops iterate over sequences
- **while** loops continue while a condition is true
- **repeat-while** loops execute at least once (like do-while)

### Why Does This Matter (From a CS Perspective)?

- Iteration is fundamental to algorithms
- Loop unrolling and vectorization are key optimizations
- Understanding loop invariants helps prove correctness
- Cache locality in loops affects performance significantly

### Swift Implementation Details

- for-in works with any type conforming to `Sequence`
- Can use `stride` for numeric progressions
- `break` and `continue` control loop flow
- Labeled statements allow breaking outer loops

### Exercise 3: `ex03_loops.swift`

You'll practice:
- Different loop types and when to use each
- Loop control statements
- Nested loops and labels
- Performance considerations

---

## 4. Guard Statements

### What Are They?

- **guard** provides early exit when conditions aren't met
- Must transfer control if condition fails (return, break, continue, throw)
- Variables bound in guard are available after the statement

### Why Does This Matter (From a CS Perspective)?

- Reduces nesting and cyclomatic complexity
- Makes happy path more readable
- Helps with defensive programming
- Can improve branch prediction by handling edge cases first

### Swift Implementation Details

- Particularly useful with optionals
- Creates variables in the same scope (unlike if-let)
- Compiler enforces the exit requirement

### Exercise 4: `ex04_guard.swift`

You'll practice:
- Guard vs if-let patterns
- Multiple conditions in guard
- Guard with optionals
- Improving code readability

---

## 5. Advanced Control Flow

### Pattern Matching and Control Transfer

- **Pattern matching** in conditionals
- **defer** statements for cleanup
- **Control transfer** statements (break, continue, return, throw, fallthrough)

### Exercise 5: `ex05_advanced_control_flow.swift`

You'll practice:
- Complex pattern matching
- Defer for resource management
- Loop labels and targeted breaks
- Combining different control flow constructs

---

## Tips for Success

1. **Readability First**: Choose the control flow that makes intent clearest
2. **Guard Early**: Use guard for preconditions and early returns
3. **Exhaustive Switches**: Leverage compiler checking for completeness
4. **Avoid Deep Nesting**: Refactor complex conditionals into functions
5. **Performance**: Be aware of branch prediction and loop optimization

## Common Pitfalls

- Forgetting switch must be exhaustive
- Using if-let when guard would be clearer
- Not considering all loop termination conditions
- Missing break in nested loops
- Overusing force unwrapping instead of proper control flow