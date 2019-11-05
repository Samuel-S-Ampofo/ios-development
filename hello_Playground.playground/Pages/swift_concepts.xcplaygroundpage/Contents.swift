//: [Previous](@previous)

import Foundation

var string: String =  "Hello, swift Concepts" // strings
var myAge: Int = 34 // integeres
let myName: String = "Samuel S. Ampofo" // this does not change
var donVals:Double = 3.5 // double


////tuples
let cordinates: (Int,Int) = (7,9) // tuples
// you can have tupples with mixed data type , string, ints or doubles
let doubleCordinates = (43.7,23) // using type infrence
let mydata = (myName,myAge)

//access data from a double //
let x1 = cordinates.0
let y1 = cordinates.1
let namedTuples  = (x:9, y:18)  //tpples named using type inference

let x2  = namedTuples.x
let y2  = namedTuples.y

let cordinated3D =  (x:32, y:76 ,x:23 ) // tuples can have as many variable as apposible
let (x3,y3,z3) = cordinated3D // cretaing constatnsts   from the  tuples at once
let (x4,y4, _) = cordinated3D  // ignoring the values you dont want in creating new constanace


//challenge reassining varible and constance in tuples
let amazingday = (1,2,2019, "😀")
var amzaingGrace = (day:8, month:5, year:2019, emoji:"😀")
amzaingGrace .emoji = "😀😀😀😀😀"
amzaingGrace


//Booleans and operator
// true and false statements

// comparison operator
let yes = true
let no = false
let onegreaterthanTwo  = 1 < 2
let onelessthanTwo =  1 > 2
let sixlessthanequals = 6 >= 6
let sixgreaterthanequals =  6 <= 6



//  logical operators and or logics
let fireIsCold = false
let watreIsCold = true
let catsAreCute = true


let allTrue = fireIsCold && watreIsCold && catsAreCute
let anyAreTrue = fireIsCold || watreIsCold || catsAreCute


//let a = 9
//let b = 21
// var  min:Int  = 0
// //conditail is statement
//
//if a < b {
//    min = a
//}
//else {
//    min = b
//}


//ternary operator works on three values
// let min =  a < b ? a : b

// challneges operators

let lenardoAge = 14
let isTeenager = myAge >= 13 &&  myAge<=19
let eitherIstennager = isTeenager || lenardoAge >= 13 && isTeenager || lenardoAge <= 19


let author = "Matt Galloway"
let studentIsSameasAuthor = myName == author
let studentBeforeAuthoe = myName < author


if isTeenager {
    print( "is a teenage")
}else{
    print("is not a teenager")
}

let answer = !isTeenager ? "is not a teenager": "is a teenage"


// scopes local and  global scopes

let standardHour = 40
let standardrate = 25
let rateAfterstandard = 50
var clientHours = 44
var clientPrice:Int

if clientHours <= standardHour {
    clientPrice = clientHours * standardrate

}else {

    var hoursDiff:Int
    var extraRate :Int
    var clietSatndardrate:Int

    hoursDiff = clientHours - standardHour
    clietSatndardrate = standardHour * standardrate
    extraRate = hoursDiff * rateAfterstandard
    clientPrice = clietSatndardrate + extraRate
}

 print(clientPrice)
//print(extraRate) this deos not print becaueit ouside the scope of the if statment
// contoleflow dont repeat youself rule.

 //while loop and conditions
//    var i = 1
//    while i < 10 {
//        i += 1
//        print(i)
//    }

// repeat while loop
//    i = 1
//    repeat {
//         print(i)
//
//        if i == 5{
//            break
//        }
//        i += 1
//    } while i < 10


//// challenge

//var count = 0
//
//while count < 10 {
//    print("count is \(count)" )
//    count += 1
//}



// roll a dies challnege reapeta while challneg
//var rollDice: Int
//    count = 0
//repeat{
//      rollDice = Int.random(in:1...6)
//      count += 1
//    if count > 5{
//        break
//    }
//    print("After \( count), rolls is \(rollDice ) ")
//
//} while rollDice  != 6


// key phrases // break // continue // while

// for loop countable range
//  closedrange
//halfOpenRange

let usefulaConstant = 5
let closedRange = 0...5
let halfClosedRange = 0..<5
var  sum = 0
let count = 10

for i in 1...count where i%2 == 1{
    print(i)
}
for floor in 10...15{
    if floor == 13{
        print("👻 👻 👻")
        continue
    }
    print("stop at flor \(floor)")
}

print("---- --- ---")
floor: for floor in 12...15{
    for room in 11...16{
        if room == 13{
            print("👻 👻 👻 ")
            continue floor
        }
        print("clean room \(floor) \(room)")
    }
}
let range = 1...10
var root:Int
for i in range{
    root = i*i
print(root)
}

for row in 0..<8 where row % 2 == 1 {
    for column in 0..<8 {
        sum += column * row
    }
}
print(sum)

// switch statments

let number = Int.max
let numerbeDescription:String

switch number {
case 0:
    numerbeDescription = "Zero"
case 1...9:
    numerbeDescription = "betwwen one and nine"
case let negativeNumber where negativeNumber < 0:
    numerbeDescription = " Negative"
case _ where number > .max/2 :
    numerbeDescription = "very large Number"
default:
    numerbeDescription = "no description"
}


let numberIsEven:Bool

switch number % 2{
case 0:
    numberIsEven = true
default:
    numberIsEven = false
    
}



let animalSting = "Lion"
let isHousepet:Bool
switch animalSting {
case "cat", "dog","bunny":
    isHousepet = true
default:
    isHousepet = false
}

let switchCordinates = (4.0,5.0)
let pointCategory:String

switch switchCordinates {
    
case(0,0):
    pointCategory = "origin"
    
    // whre x or y is not zero
case (let x,0):
    pointCategory = "on the x axis at \(x)"
case (let y,0):
    pointCategory = "on the y axixi at \(y)"
case let(x, y):
    pointCategory = "on the x axis x = \(x), y axis y = \(y)"
    break
}

// Enumuration

enum Month: Int {
    case january = 1, febuary, march, april, may, june, july, august, september, october, november, december
}



//let month = Month.november
let month: Month = .october

enum Semister {
    /// 🍂
    case fall
    /// 🌻
    case spring
    /// ☀️
    case summer
    /// ❄️
    case winter
}

Semister.fall

let semister: Semister

switch  month {
case  .september, .october, .november:
    semister = .fall
case .december, .january, .febuary:
    semister = .winter
case .march, .april, .may:
    semister = .spring
case .june, .july, .august:
    semister = .summer
}

Month.febuary.rawValue
Month(rawValue:5)

let monthUntilWinterBreak = Month.december.rawValue - month.rawValue

enum TwoDiamentionalPoints {
    case origin
    case onXAxis(Double)
    case onYAxis(Double)
    case noZeroCoordinates(Double,Double)
}


let coordinates = (0.0, 4.0)
let twoDiamentionalPoints : TwoDiamentionalPoints
switch coordinates {
    
case (0,0):
    twoDiamentionalPoints = .origin
case (_, 0 ):
    twoDiamentionalPoints = .onXAxis(coordinates.0)
case (0, _ ):
    twoDiamentionalPoints = .onYAxis(coordinates.1)
default:
    twoDiamentionalPoints  = .noZeroCoordinates(coordinates.0, coordinates.1)
}


let pointValue: (Double,Double)

switch twoDiamentionalPoints {
case .origin:
    pointValue = (0,0)
case let .onXAxis(x):
    pointValue = (x,0)
case let .onYAxis(y):
    pointValue = (0,y)
case .noZeroCoordinates(let x, let y):
     pointValue = (x,y)
}







