# Swift Concurrency

Welcome to the Concurrency section of Swiftlings!

Swift's modern concurrency model, introduced in Swift 5.5, provides powerful tools for writing asynchronous and parallel code. This section will guide you through the fundamentals of Swift concurrency features.

## Exercises

This section contains the following exercises:

1. **ex01_async_await.swift** - Learn how to use async/await for asynchronous code
2. **ex02_async_sequences.swift** - Work with asynchronous sequences
3. **ex03_task_basics.swift** - Create and manage tasks
4. **ex04_task_groups.swift** - Run multiple tasks in parallel
5. **ex05_actors.swift** - Use actors for safe state isolation
6. **ex06_sendable.swift** - Understand the Sendable protocol
7. **ex07_async_properties.swift** - Implement async properties and methods
8. **ex08_continuations.swift** - Bridge between callback-based APIs and async/await

## Key Concepts

- **Async/Await**: A modern approach to writing asynchronous code
- **Structured Concurrency**: Managing the lifetime and relationships of concurrent tasks
- **Tasks**: Units of asynchronous work that can be created and managed
- **Task Groups**: Organizing and coordinating multiple tasks
- **Actors**: Reference types that protect their mutable state from data races
- **Sendable**: A protocol that marks types as safe to transfer across concurrency domains
- **AsyncSequence**: A protocol for sequences that deliver their elements asynchronously
- **Continuations**: A way to bridge between callback-based code and async/await

## Resources

- [Swift Documentation on Concurrency](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/concurrency/)
- [WWDC21: Meet async/await in Swift](https://developer.apple.com/videos/play/wwdc2021/10132/)
- [WWDC21: Protect mutable state with Swift actors](https://developer.apple.com/videos/play/wwdc2021/10133/)