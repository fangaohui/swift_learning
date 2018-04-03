//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var test : Int = 1
let tt : Int = test
var str_test = "\(test) has"
if test == tt {
    test = Int.max &+ 10
    var test1 = Int32.max
}
switch test {
case 1...100:
    print("123")
case var unknowCode where (unknowCode > 1000):
    print("444")
default:
    print("234")
}
var error = (aa:test,nn:str_test)
switch error {
case (11,_):
    print("222")
default:
    print("111")
}
if case 100...200 = test {
    
}
for i in 10...100 where i % 3 == 0 {
    test += 1
    test
    print(test)
}
while case 100...100 = test {
    print("123")
}

