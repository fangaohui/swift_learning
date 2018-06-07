//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
str += "1"
var test : Int = 1
let tt : Int = test
var str_test = "\(test) has"
if test == tt {
    test = 19//Int.max &+ 10
    var test1 = 19//Int32.max
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
while case 100...500 = test {
    print("123")
}
for scalar in str.unicodeScalars {
    print("\(scalar.value)");
}
var errorCodeString:String?
errorCodeString = "404aaa"
var testErrorCodeString:String?
print(testErrorCodeString)
if let testTemporary = testErrorCodeString, var testInt = Int(testTemporary) {
    print(testTemporary)
}
else
{
    print("123321")
}
var test111 = errorCodeString
var test11122:String = errorCodeString!
var hhaa:String! = nil
var err = hhaa
var testErrorCodeString111:String = "123ff"
var upCaseError:String? = errorCodeString?.uppercased()
var upCaseError112:String = testErrorCodeString111.uppercased()

if let testErrorCodeString = testErrorCodeString {
    upCaseError112 = testErrorCodeString
    print(testErrorCodeString)
}
else
{
    print(testErrorCodeString)  //注意if中let testErrorCodeString的作用域
    upCaseError112 = "eor"
}
upCaseError112 = testErrorCodeString ?? "eor"
var bucketList = ["asd","dddd"]
var newList = ["123111"]
newList += bucketList
newList.insert("hhh", at: 3)
newList
bucketList
var firstDic = Dictionary<String,String>()
var secDic: Dictionary<String,String> = [:]
var thirDic : [String:String] = [:]
var forthDic = [String:String]()
for move in forthDic.values {
    
}
for keys in forthDic.keys {
    
}
for (key,value) in forthDic {
    
}
for keys in forthDic {
    
}
let newAr = Array(forthDic.keys)
let newAr11 = Array([123])
newAr11
var newset = Set([1233,333])
var newset11 = Set([1233,333,44])
newset.union(newset11)
newset
func testFunc(abc:Int=1){
    print(abc)
}
testFunc()

var volunteerCounts = [1,2,3,4,3,21,5,3]
func sortAs(_ i:Int, _ j:Int) -> Bool {
    return i < j
}
var volun11 = volunteerCounts.sorted(by:sortAs)
volunteerCounts.remove(at: 1)
volunteerCounts
volun11





