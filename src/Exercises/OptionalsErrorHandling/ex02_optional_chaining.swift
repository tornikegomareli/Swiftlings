// Exercise 2: Optional Chaining
// Learn about using optional chaining in Swift.

import Foundation

// In Swift, optional chaining allows you to call properties, methods, and subscripts on an optional
// that might be nil. If the optional is nil, the entire chain fails gracefully and returns nil.
// This exercise will guide you through using optional chaining.

// TODO: Define nested types for optional chaining
// This struct represents a company with departments and employees
public struct Company {
    var name: String
    var departments: [Department]?
    
    // Lookup a department by name
    func department(named: String) -> Department? {
        return departments?.first { $0.name == named }
    }
}

public struct Department {
    var name: String
    var employees: [Employee]?
    var manager: Employee?
    
    // Lookup an employee by ID
    func employee(id: Int) -> Employee? {
        return employees?.first { $0.id == id }
    }
}

public struct Employee {
    var id: Int
    var name: String
    var title: String?
    var contactInfo: ContactInfo?
}

public struct ContactInfo {
    var email: String?
    var phone: String?
    var address: Address?
}

public struct Address {
    var street: String
    var city: String
    var state: String
    var zipCode: String
}

// TODO: Implement functions that use optional chaining
// This function gets an employee's email if available
public func getEmployeeEmail(from company: Company?, departmentName: String, employeeId: Int) -> String? {
    // Use optional chaining to get the employee's email
    // If any part of the chain is nil, the function should return nil
    return nil
}

// TODO: Implement a function to get a manager's phone number
public func getManagerPhone(from company: Company?, departmentName: String) -> String? {
    // Use optional chaining to get the manager's phone number
    // If any part of the chain is nil, the function should return nil
    return nil
}

// TODO: Implement a function to get an employee's address
public func getEmployeeAddress(from company: Company?, departmentName: String, employeeId: Int) -> Address? {
    // Use optional chaining to get the employee's address
    // If any part of the chain is nil, the function should return nil
    return nil
}

// TODO: Fix this function that calls a method through optional chaining
public func countEmployeesInDepartment(company: Company?, departmentName: String) -> Int {
    // Use optional chaining to get the count of employees in a department
    // If the department or employees array is nil, return 0
    return 0
}

// TODO: Implement this function that uses optional chaining with multiple returns
public func getEmployeeInfo(from company: Company?, departmentName: String, employeeId: Int) -> (name: String, title: String, email: String)? {
    // Use optional chaining to get the employee's name, title, and email
    // If any required value is nil, the function should return nil
    // Hint: Use optional binding (if let) to unwrap multiple optionals
    return nil
}

// Main function to run all exercises
public func runOptionalChaining() {
    print("=== Optional Chaining ===\n")
    
    // Create a sample company structure
    let acme = createSampleCompany()
    
    // Uncomment these as you fix them:
    // testGetEmployeeEmail(company: acme)
    // testGetManagerPhone(company: acme)
    // testGetEmployeeAddress(company: acme)
    // testCountEmployees(company: acme)
    // testGetEmployeeInfo(company: acme)
    
    // Test with nil values
    // let nilCompany: Company? = nil
    // testGetEmployeeEmail(company: nilCompany)
}

// Helper function to create a sample company
func createSampleCompany() -> Company {
    let address1 = Address(street: "123 Main St", city: "Techville", state: "CA", zipCode: "12345")
    let address2 = Address(street: "456 Market St", city: "Techville", state: "CA", zipCode: "12345")
    
    let contactInfo1 = ContactInfo(email: "john@acme.com", phone: "555-1234", address: address1)
    let contactInfo2 = ContactInfo(email: "jane@acme.com", phone: "555-5678", address: address2)
    let contactInfo3 = ContactInfo(email: "bob@acme.com", phone: "555-9012", address: nil)
    
    let employee1 = Employee(id: 1, name: "John Doe", title: "Developer", contactInfo: contactInfo1)
    let employee2 = Employee(id: 2, name: "Jane Smith", title: "Manager", contactInfo: contactInfo2)
    let employee3 = Employee(id: 3, name: "Bob Johnson", title: "Designer", contactInfo: contactInfo3)
    
    let engineering = Department(name: "Engineering", employees: [employee1, employee3], manager: employee2)
    let marketing = Department(name: "Marketing", employees: [], manager: nil)
    
    return Company(name: "ACME Corp", departments: [engineering, marketing])
}

// Test functions
func testGetEmployeeEmail(company: Company?) {
    print("Testing getEmployeeEmail:")
    if let email = getEmployeeEmail(from: company, departmentName: "Engineering", employeeId: 1) {
        print("Found email: \(email)")
    } else {
        print("No email found")
    }
    
    if getEmployeeEmail(from: company, departmentName: "Engineering", employeeId: 999) == nil {
        print("Correctly returned nil for non-existent employee")
    }
    print()
}

func testGetManagerPhone(company: Company?) {
    print("Testing getManagerPhone:")
    if let phone = getManagerPhone(from: company, departmentName: "Engineering") {
        print("Found manager phone: \(phone)")
    } else {
        print("No manager phone found")
    }
    
    if getManagerPhone(from: company, departmentName: "Marketing") == nil {
        print("Correctly returned nil for department without manager")
    }
    print()
}

func testGetEmployeeAddress(company: Company?) {
    print("Testing getEmployeeAddress:")
    if let address = getEmployeeAddress(from: company, departmentName: "Engineering", employeeId: 1) {
        print("Found address: \(address.street), \(address.city)")
    } else {
        print("No address found")
    }
    
    if getEmployeeAddress(from: company, departmentName: "Engineering", employeeId: 3) == nil {
        print("Correctly returned nil for employee without address")
    }
    print()
}

func testCountEmployees(company: Company?) {
    print("Testing countEmployeesInDepartment:")
    let engineeringCount = countEmployeesInDepartment(company: company, departmentName: "Engineering")
    let marketingCount = countEmployeesInDepartment(company: company, departmentName: "Marketing")
    let nonExistentCount = countEmployeesInDepartment(company: company, departmentName: "NonExistent")
    
    print("Engineering employees: \(engineeringCount)")
    print("Marketing employees: \(marketingCount)")
    print("Non-existent department employees: \(nonExistentCount)")
    print()
}

func testGetEmployeeInfo(company: Company?) {
    print("Testing getEmployeeInfo:")
    if let info = getEmployeeInfo(from: company, departmentName: "Engineering", employeeId: 1) {
        print("Employee info - Name: \(info.name), Title: \(info.title), Email: \(info.email)")
    } else {
        print("Could not get complete employee info")
    }
    
    if getEmployeeInfo(from: company, departmentName: "Engineering", employeeId: 3) == nil {
        print("Correctly returned nil for incomplete employee info")
    }
    print()
}