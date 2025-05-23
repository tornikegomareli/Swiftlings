# Swiftlings

A collection of small exercises to get you used to reading and writing Swift code. This project is inspired by the [Rustlings](https://github.com/rust-lang/rustlings) project.

## Getting Started

### Prerequisites

- macOS 13.0 or later
- Swift 6.0 or later
- Xcode 15.0 or later (recommended)

### Installation

1. Clone this repository
```
git clone https://github.com/yourusername/swiftlings.git
cd swiftlings
```

2. Start working on exercises!

## How to Use

Swiftlings is a collection of Swift exercises that guide you through learning the Swift programming language. Each exercise is contained in a separate Swift file and includes TODO comments that indicate what you need to do to complete the exercise.

### Project Structure

- `src/Exercises/`: Contains the exercise implementations organized by topic
  - Each topic has its own folder (BasicSyntax, Collections, Concurrency, etc.)
  - Exercise files follow the naming pattern: `ex##_description.swift`
  
- `Tests/TestsForExercises/`: Contains test files that verify exercise implementations
  - Test structure mirrors the exercise structure
  - Tests use the Swift Testing framework with `@Test` attributes

### Exercise Categories

1. **BasicSyntax**: Learn about variables, constants, types, and string interpolation
2. **Collections**: Explore arrays, sets, dictionaries, and their operations
3. **ControlFlow**: Master if-else, switch, loops, and other flow control mechanisms
4. **FunctionsClosures**: Understand functions, closures, and higher-order functions
5. **StructsClasses**: Work with structs, classes, and learn when to use each
6. **Generics**: Learn about generic functions, types, constraints, and associated types
7. **OptionalsErrorHandling**: Explore Swift's optional types and error handling
8. **ProtocolsExtensions**: Understand protocols, extensions, and protocol-oriented programming
9. **Concurrency**: Master Swift's modern concurrency model with async/await and actors

### Completing Exercises

1. Open an exercise file
2. Read the instructions in the comments
3. Complete the TODOs
4. Run the corresponding test to verify your solution

## Testing Your Solutions

Swiftlings provides four different testing approaches to help with different aspects of development:

### 1. Run Tests for a Category

You can run tests for a specific category to check your progress:

```bash
# Run tests for a specific category
./run_category_tests.sh Generics

# Alternative using named parameter
./run_category_tests.sh --category Generics

# Show detailed output
./run_category_tests.sh Generics --verbose
```

This is the primary script for students to test their solutions as they work through the exercises in each category.

### 2. Verify Test Compilation

You can verify that your test files compile correctly:

```bash
# Verify all test categories
./verify_tests.sh

# Verify tests for a specific category
./verify_tests.sh --category Generics

# Show detailed output
./verify_tests.sh --verbose
```

This script ensures that the test files themselves compile correctly, even while the exercise files remain intentionally incomplete for learning purposes.

### 3. Test Solution Implementation

You can test solution implementations independently from the exercise files:

```bash
# Run solution tests for all categories
./test_solution.sh

# Run tests for a specific category
./test_solution.sh --category Generics

# Only verify solution tests can compile
./test_solution.sh --verify
```

This approach uses `TestSolutions.swift` to provide implementations that are only used during testing.

### 4. Test Specific Files

You can test individual Swift files in isolation:

```bash
# Test a specific implementation file
./test_specific.sh --file path/to/file.swift

# Show verbose output
./test_specific.sh --file path/to/file.swift --verbose
```

These testing approaches allow instructors to confirm that tests are properly structured and solutions work correctly, while students can use them to check their progress as they complete exercises.

## Development Notes

- Tests use the Swift Testing framework with `@Test` attributes
- Tests verify that solutions compile and run correctly with concrete assertions
- To add a new exercise, create a new Swift file in the appropriate category folder and a corresponding test file
- Each exercise file should include clear instructions and TODO comments
- Test files and solutions are conditionally compiled with the `TESTING` flag when necessary
- The project includes `TestSolutions.swift` that contains implementations used only during testing
- When writing exercises, remember that function names must be unique across the entire project
- Students can implement the exercises and then run the corresponding tests to verify their solutions
- Instructors can use the testing scripts to verify the correctness of tests and solution implementations

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Inspired by the [Rustlings](https://github.com/rust-lang/rustlings) project
- Thanks to everyone who has contributed to this project