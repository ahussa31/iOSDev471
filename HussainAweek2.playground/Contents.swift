// Aemen Hussain 
// CSC 471
// Assignment week 2

//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//*** ASSIGNMENT PART 1: RANK METHOD ****

func rank(key: Int, sortedArray: [Int]) -> Int {
    var start = 0
    var end = sortedArray.count-1
    
    while (start<=end){
        var mid = (start + end)/2
        
        
        if (key == sortedArray[mid]){
            return mid}
        if (key > sortedArray[mid]){
            start=mid+1}
        if(key < sortedArray[mid]){
            end=mid-1}
    }
    return -1
    
}



//test for rank

func testRank(){
    var arraySort:[Int]=[1,2,3,5,6,7,8,9,11,15,17,18,19,20]
    
    var test1=rank(3, sortedArray: arraySort)
    var test2=rank(4, sortedArray: arraySort)
    var test3=rank(7, sortedArray: arraySort)
    
    // passes if it returns the correct index for a key value of 3
    if (test1 == 2){
        print("check 1 passes")
    }
    else {
        print("check 1 FAILED")
    }
    
    // passes if it returns -1 because 4 is not in the array
    if(test2 == -1){
        print("check 2 passes")
    }
    else {
        print("check 2 FAILED")
    }
    
    // passes if it does not return 7 because the correct index of key=7 is 5
    if(test3 == 7){
        print("check 3 failed")
    }
    else {
        print("check 3 passes")
    }
    
}

testRank()

//-------------------------------------------------------------------------


//*** ASSIGNMENT PART 2: FRACTION CALCULATOR ****

class Fraction {
    var numerator: Int = 0
    var denominator: Int = 1
    
    init(_ numerator: Int, over denominator: Int){
        self.numerator=numerator
        self.denominator=denominator
    }
    
    init(){}
    
    func setTo(numerator: Int, over denominator: Int) {
        self.numerator=numerator
        self.denominator=denominator
    }
    
    func printFraction(){
        print("\(numerator)/\(denominator)")
    }
    
    func toDouble() -> Double {
        return Double(numerator) / Double(denominator);
    }
    
    func add(f: Fraction) {
        numerator = numerator * f.denominator + denominator * f.numerator;
        denominator = denominator * f.denominator;
        reduce()
    }
    
    func substract(f: Fraction){
        numerator = numerator * f.denominator - denominator * f.numerator;
        denominator = denominator * f.denominator;
        reduce()
    }
    
    func multiply(f: Fraction){
        numerator = numerator * f.numerator;
        denominator = denominator * f.denominator;
        reduce()
    }
    
    func divide(f: Fraction){
        numerator = numerator * f.denominator;
        denominator = denominator * f.numerator;
        reduce()
    }
    
    
    func reduce(){
        let sign = numerator >= 0 ? 1 : -1
        var u = numerator * sign
        var v = denominator
        var r: Int
        while (v != 0) {
            r = u % v; u = v; v = r
        }
        numerator /= u
        denominator /= u
    }
}



//test for calculator

var f1 = Fraction(1, over: 2)
var f2 = Fraction (1, over: 4)

f1.add(f2)
f1.printFraction()

// (3/2)-(1/4)=5/4
var f3 = Fraction(3, over: 2)
var f4 = Fraction (1, over: 4)

f3.substract(f4)
f3.printFraction()

// (2/4)*(2/4)=(1/2)*(1/2)=1/4
var f5 = Fraction(2, over: 4)
var f6 = Fraction (2, over: 4)

f5.multiply(f6)
f5.printFraction()

// (6/2) / (1/2) = (6/2)*(2/1) = 6/1
var f7 = Fraction(6, over: 2)
var f8 = Fraction (1, over: 2)

f7.divide(f8)
f7.printFraction()

