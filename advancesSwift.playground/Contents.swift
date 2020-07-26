
import Foundation

var pizzaInInches : Int = 10 {
    willSet {
        print(newValue)
    }
    didSet{
        
        if pizzaInInches >= 18 {
            print("Invalid size specified pizzaInches set to 18.")
            pizzaInInches = 18
        }
        print(oldValue)
    }
}
var numberOfPeople: Int = 12
let slicesPerson: Int = 4

// this is a getter computed property
var numberOfSlices: Int {
    get {
         return pizzaInInches - 4
        }
    // used to set the computed value to have a new value
    set{
        print("number of slives now has a new value \(newValue)")
     }
    }


var numberOfPizza: Int {
    get {
        let numberofPizzaPerperson = numberOfSlices / slicesPerson
        return  numberOfPeople / numberofPizzaPerperson
    }
    set {
        let totalSlice = numberOfSlices * newValue
        numberOfPeople = totalSlice / slicesPerson
    }
}


numberOfPizza = 6
print(numberOfPeople)




// advance properties Challnege

var width : Float = 3.4
var height: Float = 2.1
var wallSurface: Float = width * height
let paintPersquareMeter : Float = 1.5

var bucketOfPaint : Int {
    
    get {
        
    let paintperSurfaceArea = wallSurface / paintPersquareMeter
    let reoundedBukets = ceilf(paintperSurfaceArea)
    return Int(reoundedBukets)
        
    }
    
    set {
        wallSurface = Float(newValue) * paintPersquareMeter
        print("the total surface aread \(newValue) can cover is \(wallSurface) sqm ")
    }
}

bucketOfPaint = 8

