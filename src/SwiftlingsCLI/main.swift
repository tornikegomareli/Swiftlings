import Foundation

// ANSI colors for terminal output
struct Colors {
    static let red = "\u{001B}[0;31m"
    static let green = "\u{001B}[0;32m"
    static let yellow = "\u{001B}[0;33m"
    static let blue = "\u{001B}[0;36m"
    static let reset = "\u{001B}[0m"
}

// Command line argument parsing
enum Command: String {
    case run
    case list
    case help
    case watch
    case verify
    
    static func fromString(_ string: String) -> Command? {
        return Command(rawValue: string.lowercased())
    }
}

// Available exercise categories
enum Category: String, CaseIterable {
    case basicSyntax = "BasicSyntax"
    case collections = "Collections"
    case concurrency = "Concurrency"
    case controlFlow = "ControlFlow"
    case functionsClosures = "FunctionsClosures"
    case generics = "Generics"
    case helloSwift = "HelloSwift"
    case optionalsErrorHandling = "OptionalsErrorHandling"
    case protocolsExtensions = "ProtocolsExtensions"
    case structsClasses = "StructsClasses"
    
    static func fromString(_ string: String) -> Category? {
        return allCases.first { $0.rawValue.lowercased() == string.lowercased() }
    }
    
    static func list() -> [String] {
        return allCases.map { $0.rawValue }
    }
}

// Logo ASCII art
let logo = """
\(Colors.blue)
   _____          _  __ _   _ _                 
  / ____|        (_)/ _| | | (_)                
 | (_____      ___| | |_| |_| |_ _ __   __ _ ___ 
  \\___ \\ \\ /\\ / / | |  _|  _  | | '_ \\ / _` / __|
  ____) \\ V  V /| | | | | | | | | | | | (_| \\__ \\
 |_____/ \\_/\\_/ |_|_|_| |_| |_|_|_| |_|\\__, |___/
                                        __/ |    
                                       |___/     
\(Colors.reset)
"""

// Helper functions
func printHelp() {
    print(logo)
    print("\(Colors.blue)Welcome to Swiftlings!\(Colors.reset)")
    print("Learn Swift by solving exercises step-by-step.")
    print("")
    print("Commands:")
    print("  \(Colors.green)run\(Colors.reset)     - Run tests for a specific exercise")
    print("  \(Colors.green)list\(Colors.reset)    - List all exercises or exercises in a category")
    print("  \(Colors.green)watch\(Colors.reset)   - Watch for changes in a specific exercise and run tests automatically")
    print("  \(Colors.green)verify\(Colors.reset)  - Verify all exercises or exercises in a category")
    print("  \(Colors.green)help\(Colors.reset)    - Show this help message")
    print("")
    print("Examples:")
    print("  \(Colors.yellow)swiftlings run BasicSyntax/ex01_variables\(Colors.reset)")
    print("  \(Colors.yellow)swiftlings list BasicSyntax\(Colors.reset)")
    print("  \(Colors.yellow)swiftlings watch BasicSyntax/ex01_variables\(Colors.reset)")
    print("  \(Colors.yellow)swiftlings verify BasicSyntax\(Colors.reset)")
    print("")
    print("Available categories:")
    for category in Category.list() {
        print("  \(Colors.blue)\(category)\(Colors.reset)")
    }
}

func listExercises(category: String?) {
    if let categoryStr = category, let category = Category.fromString(categoryStr) {
        print("\(Colors.blue)Exercises in \(category.rawValue):\(Colors.reset)")
        
        // Execute bash command to list files in the category directory
        let task = Process()
        let pipe = Pipe()
        
        task.standardOutput = pipe
        task.standardError = pipe
        task.arguments = ["-c", "find \(FileManager.default.currentDirectoryPath)/src/Exercises/\(category.rawValue) -name 'ex*.swift' | sort"]
        task.executableURL = URL(fileURLWithPath: "/bin/bash")
        
        do {
            try task.run()
            let data = pipe.fileHandleForReading.readDataToEndOfFile()
            if let output = String(data: data, encoding: .utf8) {
                let files = output.components(separatedBy: "\n").filter { !$0.isEmpty }
                for file in files {
                    let filename = URL(fileURLWithPath: file).lastPathComponent
                    let exerciseName = filename.replacingOccurrences(of: ".swift", with: "")
                    print("  \(Colors.green)\(exerciseName)\(Colors.reset)")
                }
            }
        } catch {
            print("\(Colors.red)Error listing exercises: \(error.localizedDescription)\(Colors.reset)")
        }
    } else {
        print("\(Colors.blue)Available categories:\(Colors.reset)")
        for category in Category.list() {
            print("  \(Colors.green)\(category)\(Colors.reset)")
        }
    }
}

func runExercise(exercisePath: String) {
    let components = exercisePath.components(separatedBy: "/")
    if components.count != 2 {
        print("\(Colors.red)Error: Invalid exercise path. Format should be Category/ExerciseName\(Colors.reset)")
        print("Example: BasicSyntax/ex01_variables")
        return
    }
    
    let category = components[0]
    let exercise = components[1]
    
    if Category.fromString(category) == nil {
        print("\(Colors.red)Error: Category '\(category)' not found.\(Colors.reset)")
        print("Available categories:")
        for cat in Category.list() {
            print("  \(Colors.blue)\(cat)\(Colors.reset)")
        }
        return
    }
    
    print("\(Colors.blue)Running tests for \(exercise) in \(category)...\(Colors.reset)")
    
    // Execute bash script to run the test
    let task = Process()
    let pipe = Pipe()
    
    task.standardOutput = pipe
    task.standardError = pipe
    task.arguments = ["-c", "./run_category_tests.sh --category \(category) --exercise \(exercise)"]
    task.executableURL = URL(fileURLWithPath: "/bin/bash")
    
    do {
        try task.run()
        task.waitUntilExit()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        if let output = String(data: data, encoding: .utf8) {
            print(output)
        }
    } catch {
        print("\(Colors.red)Error running tests: \(error.localizedDescription)\(Colors.reset)")
    }
}

func watchExercise(exercisePath: String) {
    let components = exercisePath.components(separatedBy: "/")
    if components.count != 2 {
        print("\(Colors.red)Error: Invalid exercise path. Format should be Category/ExerciseName\(Colors.reset)")
        print("Example: BasicSyntax/ex01_variables")
        return
    }
    
    let category = components[0]
    let exercise = components[1]
    
    if Category.fromString(category) == nil {
        print("\(Colors.red)Error: Category '\(category)' not found.\(Colors.reset)")
        return
    }
    
    print("\(Colors.blue)Watching for changes in \(exercise) in \(category)...\(Colors.reset)")
    print("Press Ctrl+C to stop watching")
    
    // Find the exercise file
    let findTask = Process()
    let findPipe = Pipe()
    
    findTask.standardOutput = findPipe
    findTask.standardError = findPipe
    findTask.arguments = ["-c", "find \(FileManager.default.currentDirectoryPath)/src/Exercises/\(category) -name '\(exercise).swift'"]
    findTask.executableURL = URL(fileURLWithPath: "/bin/bash")
    
    do {
        try findTask.run()
        findTask.waitUntilExit()
        
        let findData = findPipe.fileHandleForReading.readDataToEndOfFile()
        guard let fileOutput = String(data: findData, encoding: .utf8),
              let filePath = fileOutput.components(separatedBy: "\n").first,
              !filePath.isEmpty else {
            print("\(Colors.red)Error: Could not find file for \(exercise) in \(category)\(Colors.reset)")
            return
        }
        
        // Get initial timestamp
        var lastModified = try? FileManager.default.attributesOfItem(atPath: filePath)[.modificationDate] as? Date
        
        // Run the test once at start
        runExercise(exercisePath: "\(category)/\(exercise)")
        
        // Watch loop
        while true {
            sleep(1)
            
            do {
                let attrs = try FileManager.default.attributesOfItem(atPath: filePath)
                if let newModified = attrs[.modificationDate] as? Date,
                   let lastMod = lastModified,
                   newModified > lastMod {
                    print("\n\(Colors.yellow)File changed, running tests...\(Colors.reset)")
                    runExercise(exercisePath: "\(category)/\(exercise)")
                    lastModified = newModified
                }
            } catch {
                print("\(Colors.red)Error: \(error.localizedDescription)\(Colors.reset)")
                break
            }
        }
    } catch {
        print("\(Colors.red)Error finding exercise file: \(error.localizedDescription)\(Colors.reset)")
    }
}

func verifyExercises(category: String?) {
    if let categoryStr = category, let category = Category.fromString(categoryStr) {
        print("\(Colors.blue)Verifying exercises in \(category.rawValue)...\(Colors.reset)")
        
        // Execute bash script to run tests for the category
        let task = Process()
        let pipe = Pipe()
        
        task.standardOutput = pipe
        task.standardError = pipe
        task.arguments = ["-c", "./run_category_tests.sh --category \(category.rawValue)"]
        task.executableURL = URL(fileURLWithPath: "/bin/bash")
        
        do {
            try task.run()
            task.waitUntilExit()
            
            let data = pipe.fileHandleForReading.readDataToEndOfFile()
            if let output = String(data: data, encoding: .utf8) {
                print(output)
            }
        } catch {
            print("\(Colors.red)Error verifying exercises: \(error.localizedDescription)\(Colors.reset)")
        }
    } else {
        print("\(Colors.blue)Verifying all exercises...\(Colors.reset)")
        
        for category in Category.list() {
            print("\n\(Colors.blue)Category: \(category)\(Colors.reset)")
            
            let task = Process()
            let pipe = Pipe()
            
            task.standardOutput = pipe
            task.standardError = pipe
            task.arguments = ["-c", "./run_category_tests.sh --category \(category)"]
            task.executableURL = URL(fileURLWithPath: "/bin/bash")
            
            do {
                try task.run()
                task.waitUntilExit()
                
                let data = pipe.fileHandleForReading.readDataToEndOfFile()
                if let output = String(data: data, encoding: .utf8) {
                    print(output)
                }
            } catch {
                print("\(Colors.red)Error verifying category \(category): \(error.localizedDescription)\(Colors.reset)")
            }
        }
    }
}

// Main execution logic
func main() {
    let args = Array(CommandLine.arguments.dropFirst()) // Drop the program name and convert to Array
    guard !args.isEmpty else {
        printHelp()
        return
    }
    
    let commandString = args[0]
    guard let command = Command.fromString(commandString) else {
        print("\(Colors.red)Error: Unknown command '\(commandString)'\(Colors.reset)")
        printHelp()
        return
    }
    
    switch command {
    case .help:
        printHelp()
        
    case .list:
        if args.count > 1 {
            listExercises(category: args[1])
        } else {
            listExercises(category: nil)
        }
        
    case .run:
        if args.count > 1 {
            runExercise(exercisePath: args[1])
        } else {
            print("\(Colors.red)Error: No exercise specified for run command\(Colors.reset)")
            print("Example: swiftlings run BasicSyntax/ex01_variables")
        }
        
    case .watch:
        if args.count > 1 {
            watchExercise(exercisePath: args[1])
        } else {
            print("\(Colors.red)Error: No exercise specified for watch command\(Colors.reset)")
            print("Example: swiftlings watch BasicSyntax/ex01_variables")
        }
        
    case .verify:
        if args.count > 1 {
            verifyExercises(category: args[1])
        } else {
            verifyExercises(category: nil)
        }
    }
}

// Run the main function
main()