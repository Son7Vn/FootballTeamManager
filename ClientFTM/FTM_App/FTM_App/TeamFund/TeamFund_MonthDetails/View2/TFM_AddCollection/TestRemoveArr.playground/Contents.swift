import UIKit

var greeting = "Hello, playground"

var arrayX = [2,5,67,8,8,9,6]

//for i in 0..<arrayX.count {
//    if arrayX[i] % 2 == 0 {
//        arrayX.remove(at: i)
//    }
//}

var b = [0]

var a = [1,2,3,4,5,6]
for (i,num) in a.enumerated().reversed() {
    if (num % 2 == 0) {
        
        b.append(num)
        a.remove(at: i)
    }
}
print(a)
print(b)

arrayX.remove(at: 2)

print(arrayX)
