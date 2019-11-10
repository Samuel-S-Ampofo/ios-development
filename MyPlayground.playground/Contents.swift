// swift deep dives
// naming conventions camelCasing and snake_casing kebab-casing

//Variables
var str = "Hello, playground"
print(str)


// swift arrays
var number = [12,25,35,90]


// constance
let myName = "samuel Sampene Ampofo"

let pi = 3.14159
print( myName + " \(2019 - 1985)  years old")

// basic data types
// string
// Int
// float
// double
// boollean
// arrays
// Dictionary
// randomisation

let randomNumber = Int.random(in: 3...33)
//operators  < > <= >=
//random floats int

// funtions
func greeting(){
    print("Hello world")
}
greeting()

// scoping is importants

// control flow
let loveScore = Int.random(in: 0..<100)
// if else statments condition statements
func loveClculator(){
    if loveScore > 80 {
        print("you love each other like kanye loves kanye")
    }
    else if  (40...80).contains(loveScore ){
        print("you go together like coke and mentos")
    }
    else {
       print("you will be alone forever")
    }
}

loveClculator()


// Switch statmenets

func loversClculators(){
    
    switch loveScore {
        case 81...100 :
            print("you love each other like kanye loves kanye")
        case 41...81:
            print("you go together like coke and mentos")
        case ...40:
            print("you will be alone forever")
        default:
            print(" Error your love is out of range")
        }
}


loversClculators()

// swift dictionaries

var  personalDetails = [ "name":"samuel","surname":"Ampofo","Age":35] as [String : Any]

var phoneBook:[String:Int] = ["Sammy":0633386263, "Jimmy":8737476374]


// optional

var playerUsername:String? = nil

playerUsername = "Donald Trump"
// force unwrapape of optionals
print(playerUsername!)




