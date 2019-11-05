import UIKit
//Funtion

func printMeow(){
    print("Meow")
}
printMeow()

func printMultipleOfFive(mutltiplier: Int ){
    print("5 * \(mutltiplier) = \(5 * mutltiplier)")
}

func printMutipleof(number: Int, mutltiplier: Int ){
    print("\(number) * \(mutltiplier) = \(number * mutltiplier)")
}

printMutipleof(number: 3, mutltiplier:30 )
printMultipleOfFive(mutltiplier:20)

func multiply(_ factor1:Int, _ factor2:Int) -> Int{
    return factor1 * factor2
}
let results = multiply(7,9)
print(results)


func multiplyAnDevide(_ number: Int, by factor:Int) -> (product:Int, quotient: Int ){
    return (number * factor, number / factor)
}
let result = multiplyAnDevide(21, by: 3)
print(result)

let (product, quotient) = result
product
quotient

// fucntions challenges
func printFullName(_ firstName:String , _ lastName:String ) {
    print(firstName + " " + lastName)
}
//printFullName(firstName: "samuel", lastName:"ampofo")
printFullName("samuel","ampofo")


//Optionals
var catName: String?
catName = "tesla"

print(catName)

var myFavoriteSong: String?
myFavoriteSong = "home Agian"





//: [Next](@next)

