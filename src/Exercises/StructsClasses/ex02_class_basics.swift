// Exercise 2: Class Basics
// Learn about creating and using classes in Swift.

import Foundation

// TODO: Fix the class declaration
public class Vehicle
    var brand: String
    var year: Int
    
    init(brand: String, year: Int) {
        self.brand = brand
        self.year = year
    }
}

// TODO: Add inheritance
public class Car {
    // Make this inherit from Vehicle
    var numberOfDoors: Int
    
    // Fix the initializer to call super.init
    init(brand: String, year: Int, doors: Int) {
        self.numberOfDoors = doors
    }
}

// TODO: Understand reference semantics
public func demonstrateReferenceSemantics() {
    let vehicle1 = Vehicle(brand: "Toyota", year: 2020)
    let vehicle2 = vehicle1  // What happens here?
    
    vehicle2.year = 2021
    
    print("vehicle1.year: \(vehicle1.year)")  // What will this print?
    print("vehicle2.year: \(vehicle2.year)")  // What will this print?
}

// TODO: Add deinitializer
public class FileHandler {
    let filename: String
    private var isOpen = false
    
    init(filename: String) {
        self.filename = filename
        isOpen = true
        print("Opened file: \(filename)")
    }
    
    // Add a deinitializer to close the file
    
    func write(_ content: String) {
        guard isOpen else { return }
        print("Writing to \(filename): \(content)")
    }
    
    func close() {
        isOpen = false
        print("Closed file: \(filename)")
    }
}

// TODO: Implement property observers
public class Temperature {
    var celsius: Double = 0 {
        // Add willSet and didSet observers
        // Print old and new values
    }
    
    var fahrenheit: Double {
        get {
            return celsius * 9/5 + 32
        }
        set {
            celsius = (newValue - 32) * 5/9
        }
    }
}

// TODO: Fix the initialization chain
public class Animal {
    let species: String
    var age: Int
    
    init(species: String, age: Int) {
        self.species = species
        self.age = age
    }
}

public class Dog: Animal {
    let breed: String
    
    // This needs to properly initialize all properties
    init(breed: String, age: Int) {
        self.breed = breed
        // What's missing here?
    }
    
    convenience init(breed: String) {
        // Create a convenience initializer that defaults age to 0
    }
}

// TODO: Implement class methods and properties
public class Student {
    static var totalStudents = 0
    static let schoolName = "Swift Academy"
    
    let id: Int
    var name: String
    var grades: [Double] = []
    
    init(name: String) {
        self.name = name
        // Assign a unique ID and increment total count
        self.id = 0  // Fix this!
    }
    
    // Add a class method to get average of all students' averages
    class func schoolAverage(students: [Student]) -> Double {
        // Implementation needed
        return 0.0
    }
    
    var average: Double {
        // Calculate this student's average
        return 0.0
    }
}

// TODO: Override methods
public class Shape {
    var color: String = "white"
    
    func area() -> Double {
        return 0
    }
    
    func describe() -> String {
        return "A \(color) shape"
    }
}

public class Square: Shape {
    var sideLength: Double
    
    init(sideLength: Double) {
        self.sideLength = sideLength
        super.init()
    }
    
    // Override area() and describe() methods
}

// TODO: Prevent inheritance
public class FinalExample {
    // Make this class final
    // Make just the method final
    func importantMethod() {
        print("This should not be overridden")
    }
}

// Main function to run all exercises
public func runClassBasics() {
    print("=== Class Basics ===\n")
    
    // Uncomment these as you fix them:
    // let vehicle = Vehicle(brand: "Honda", year: 2019)
    // print("Vehicle: \(vehicle.brand) (\(vehicle.year))")
    
    // let car = Car(brand: "Tesla", year: 2023, doors: 4)
    // print("Car: \(car.brand) with \(car.numberOfDoors) doors")
    
    // demonstrateReferenceSemantics()
    
    // autoreleasepool {
    //     let handler = FileHandler(filename: "test.txt")
    //     handler.write("Hello, World!")
    //     // handler.close() // What happens if we don't call this?
    // }
    // print("FileHandler should be deallocated")
    
    // let temp = Temperature()
    // temp.celsius = 25
    // print("Fahrenheit: \(temp.fahrenheit)")
    // temp.fahrenheit = 86
    // print("Celsius: \(temp.celsius)")
    
    // let dog1 = Dog(breed: "Labrador", age: 3)
    // let dog2 = Dog(breed: "Poodle")
    // print("Dog 1: \(dog1.breed), age \(dog1.age)")
    // print("Dog 2: \(dog2.breed), age \(dog2.age)")
    
    // let student1 = Student(name: "Alice")
    // let student2 = Student(name: "Bob")
    // student1.grades = [90, 85, 88]
    // student2.grades = [78, 82, 80]
    // print("Total students: \(Student.totalStudents)")
    // print("School average: \(Student.schoolAverage(students: [student1, student2]))")
    
    // let square = Square(sideLength: 5)
    // square.color = "blue"
    // print(square.describe())
    // print("Area: \(square.area())")
}