//: Object-Oriented Swift OOS ( P )

import UIKit

//: Classes

// Base Class
class Product {
    // Properties
    var title: String
    var price: Double = 0.0
    
    // Initialize
    // 1            // 2
    init(title: String, price: Double) {
        self.title = title
        self.price = price
    }
    
    // 1
    //    init(title: String) {
    //        self.title = title
    //    }
    
    // Discounted Price Method
    func discountedPrice(percentage: Double) -> Double {
        // Takes price - (price * percentage / 100)
        return price - (price * percentage / 100)
    }
}

let quadcopter = Product(title: "Quadcopter", price: 499.99)
// Discount
quadcopter.discountedPrice(30)

//: Inheritance

//: Clothing has access to all properties of the Super Class "Product."
//: while "Product" can not access any properties of Clothing
//: is a Sub-Class of "Product" and is the Base class of Clothing

enum Size {
    case Small,
    Medium,
    Larg
    
    init() {
        self = .Small
    }
}
// Sub-Class
// Super Class of Clothing
// Can access all properties of Product Class
class Clothing: Product {
    var size = Size()
    // Inheritance and Initializers
    let designer: String
    
    // This create Clothing it's own init method
    init(title: String, price: Double, designer: String) {
        self.designer = designer
        // Grabs the initialized variables from the Super(Base) Class
        super.init(title: title, price: price) // Calls the designated Initializers
    }
    
    // Convenience Initializers
    // Convenience
    convenience init(title: String) {
        self.init(title: title, price: 99, designer: "Calvin Klein")
    }
    
    // Overriding Method
    
    // This overrides the dicountedPrice Method in the Super Class "Product."
    // To override, function must have the same signature
    // Function Signature: Includes the name, parameters, and the return type
    override func discountedPrice(_ percentage: Double = 10.0) -> Double {
        // This returns the discountedPrice of "Product."
        return super.discountedPrice(percentage)
    }
}
// Instance of Clothing
var tshirt = Clothing(title: "Vintage")
tshirt.discountedPrice()
tshirt.size

//: Overriding Methods Rules
//: 1. The method signature must match
//: 2. Must use the keyword override
//: 3. When referring to the Super Class use "super" methods

//: Initializers Rules
//: 1. A subclass can have its own init method as long as you initialize all the properties
//: 2. You can call the "super.init" method after performing custom initialization

//: Convenience Initializers
//: 1. Can not call Designated Initializer of a Super(Base) Class
//: 2. Can not call Convenience Initializer of a Super(Base) Class
//: 3. A Designated Initializer can not call the Convenience Initializer of a Super(Base) Class
//: 4. Can call deginated Initializer within its class

//: Computed Properties
class Product2 {
    let title: String
    var price: Double = 0.0
    
    init(title: String, price: Double) {
        self.title = title
        self.price = price
    }
    
    func discountedPrice(percentage: Double) -> Double {
        return price - (price * percentage / 100)
    }
}

class Furniture: Product2 {
    // Stored Properties
    var height: Double
    var width: Double
    var length: Double
    // This is a Computed Property
    var surfaceArea: Double {
        // Can return values based on other Properties or calculations
        // They can not store any Properties
        // The Getter and Setter Methods use properties indirectly
        get { // This gets the value, and return the value
            return length * width
        }
        set { // This sets a "newValue"
            length = sqrt(newValue) // This gets the square root of "newValue"
            width = sqrt(newValue)
        }
    }
    
    init(title: String, price: Double, height: Double, width: Double, length: Double) {
        self.height = height
        self.width = width
        self.length = length
        
        super.init(title: title, price: price)
    }
}

let table = Furniture(title: "Coffee Table", price: 300, height: 5, width: 10, length: 10)
table.surfaceArea // length * width
table.surfaceArea = 144
table.width
table.length
table.surfaceArea

//: Computed Properties Rules
//: 1. Read-Only and Read-write Computed Properties must be variables(var)
//: 2. Can return a value based on other Properties or calculations
//: 3. They can not store any Properties of their own
//: 4. Computed Properties must have a type
//: 5. They compute values and return it
//: 6. You could assign values to a Computed Properties using the "Setter" method

//: Getter & Setter Methods Rules
//: 1. Getter: Get the value = item.title (gets the value)
//: 2. Setter: Set the value = item.title = "Some String" (sets the value)

//: Optinal Property
class Product3 {
    let title: String
    var price: Double = 0.0
    
    init(title: String, price: Double) {
        self.title = title
        self.price = price
    }
    
    func discountedPrice(percentage: Double) -> Double {
        return price - (price * percentage / 100)
    }
}

class Electronic: Product3 {
    // Bool Optinal
    var batteries: Bool? // This will not be an error because it is an Optional
}

let mac = Electronic(title: "15-inch MacBook Pro with Retina display", price: 2499.00)
mac.batteries = false
//: This is one wat to unwrap an Optional: Using the if let
if let batteries = mac.batteries {
    println("The value of batteries is \(mac.batteries! /* This is the bang operator */)")
}
//: This is another way to unwrap an Optional: using the! operator
mac.batteries!

//: Optional Property Rules
//: 1. Optional Property are used a lot in IBOutlet in Swift

//: Structs vs. Classes
//: 1. Class is a Reference Type
//: 2. Struct or Enums is a Value Type

// Class: Reference Type
class ProductClass {
    let title: String
    var price: Double = 0.0
    
    init(title: String, price: Double) {
        self.title = title
        self.price = price
    }
}

var phoneClass = ProductClass(title: "iPhone6", price: 800) // Instance of ProductClass
var bigPhoneClass = phoneClass // bigPhoneClass and phoneClass are referening the same thing
bigPhoneClass.title


// Struct: Value Type
struct ProductStruct {
    let title: String
    var price: Double = 0.0
}

let phoneStruct = ProductStruct(title: "Nexus", price: 500)
let bigPhoneStruct = phoneStruct // This is coping the value, they are completly diffrent instances
bigPhoneStruct.title

//: Value Type vs. Reference Type
//: 1. Value Type
//: - A value type is a type whose value is copied when it is assigned to a variable or constant, or when it is passed to a function
//: - Memory management is easier
//: - Has their owners
//: 2. Reference type
//: - Unlike value types, reference types are not copied when they are assigned to a variable or constant, or when they are passed to a function. Rather than a copy, a reference to the same existing instance is used instead

//: Final Exam - Assignment

//: Assignment
//: 1. Create a base class called Shape which will have two properties: sides and name
//: 2. Create a subclass called Square, it will also have two properties called: sideLength and area.
//: 3. The area property will be a computed property with getter and setter methods.
//: 4. Add a designated initializer to Square which accept all three properties: sides, name, and sideLength
//: 5. Add a convenience initializer to Square that will accept only the sideLength and provide default values. 4 for sides and “Square” for name
//: 6. Create an instance of Square using the convenience initializer

//: Create your answer here
//: - Here we give you a basic structure for the Final Exam
class className {
    
}

class classNameInheritance: className {
    
}




















//: When you are done scroll all the way to find the solution and check your work




//: Solution is on line 318






































//: Solution
class Shape {
    let side: Int
    let name: String
    
    init(side: Int, name: String) {
        self.side = side
        self.name = name
    }
}

class Square: Shape {
    var sideLength: Double
    var area: Double {
        get {
            return sideLength * sideLength
        }
        set {
            sideLength = sqrt(newValue)
        }
    }
    
    init(side: Int, name: String, sideLength: Double) {
        self.sideLength = sideLength
        super.init(side: side, name: name)
    }
    
    convenience init(sideLength: Double) {
        self.init(side: 4, name: "Square", sideLength: sideLength)
    }
}

let square = Square(sideLength: 20)
square.name
square.side
square.sideLength
square.area




















