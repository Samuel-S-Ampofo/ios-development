import UIKit

var str = "Hello, playground"
class Assignment {
    func fibonacci(n: Int){
    }
}


own // Fobinaci
func fibonacci(n: Int) {
    var newArray: [Int] = []
    var counter:Int = 0
    let list  =  Array(0...n)
    
    if n == 0{
        print("Invalid")
    }
    
    else {
    for _ in list {
        if newArray.count < 2 {
            newArray.append(counter)
        }
        else{
            let  arraySlice = newArray.suffix(2)
            let sum = arraySlice.reduce(0, +)
            if newArray.count != n{
            newArray.append(sum)
            }
        }
        counter += 1
    }
    print(newArray)
    }
}

fibonacci(n: 10)


// tutor fibaniach

func fibonacci(n: Int) {
        
        var n1 = 0
        var n2 = 1
        
        if n == 0 {
            print("Invalid")
        } else if n == 1 {
            print(n1)
        } else if n == 2 {
            print(n1, n2)
        } else {
            var array = [n1, n2]
            for _ in 2..<n {
                let n3 = n1 + n2
                n1 = n2
                n2 = n3
                array.append(n3)
            }
            print(array)
        }
    }
}
