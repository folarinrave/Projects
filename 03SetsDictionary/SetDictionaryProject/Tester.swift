//
//  Tester.swift
//  SetDictionaryProject
//
//  Created by Luat on 8/4/21.
//

import Foundation

struct Tester {
    /// Remove an array with the duplicated values removed
    func removeDups(nums: [Int]) -> [Int] {
        let output = Array(Set(nums))
        return output
    }
    
    /// Find the nums that exist in both arrays
    func findCommonNums(from firstNums: [Int], and secondNums: [Int]) -> [Int] {
        let common = firstNums.filter { num in
            secondNums.contains(num)
        }
        return common
    }
    
    /// first: "hello", second: "bye" -> ["e"]
    func findMatchingLetters(firstWord: String, secondWord: String) -> [Character] {
        var output = [Character]()
        firstWord.forEach { letter in
            if secondWord.contains(letter) {
                output.append(letter)
            }
        }
        return output
    }
    
    
    /// Create a dictionary of the counts of the letters, ignoring spaces
    func createCounter(string: String) -> [Character: Int] {
        var counterDict = [Character:Int]()
        let trimmedString = string.replacingOccurrences(of: " ", with: "")
        trimmedString.forEach { char in
            if counterDict[char] != nil {
                counterDict[char]! += 1 // is this okay?
            } else {
                counterDict[char] = 1
            }
        }
        return counterDict
    }
    
    /// Find most frequent letter in string: "hello there" -> "e"
    func mostFrequentLetter(string: String) -> Character {
        var letterDict = [Character:Int]()
        let trimmedString = string.replacingOccurrences(of: " ", with: "")
        trimmedString.forEach { char in
            if letterDict[char] != nil {
                letterDict[char]! += 1
            } else {
                letterDict[char] = 1
            }
        }
        
        var max = Int()
        var output = Character("i") // how to handle Character type initialization?
        for (key, val) in letterDict {
            if val > max {
                max = val
                output = key
            }
        }
        
        return output
    }
    
    /// O(n) time: avoid nested for loops
    /// Input: [1, 1]
    /// Output: 0
    func findPairs(nums: [Int]) -> Int {
        var count = Int()
        func findPair(firstPair: Int) {
            let leftoverArr = nums[1...]
            let secondPair = Int("-" + String(firstPair))
            if leftoverArr.contains(secondPair!) == true {
                count += 1
                findPair(firstPair: leftoverArr[0])
            }
        }
        findPair(firstPair: nums[0])
        return count
    }
    
    /**
     Using Dictionary:
     Input: array of integers: [1, 4, 8, 1] with 1 having the highest priority.
     Output: reduce the distance bettwen priorities but keep the same priority ordering
     [1, 4, 8, 1] -> [1, 2, 3, 1]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        let set = Set(array).sorted()
        var dict = [Int:Int]()
        var output = [Int]()
                
        for (idx, num) in set.enumerated() {
            if num == 1 {
                dict[1] = 1
            } else {
                dict[num] = idx + 1
            }
        }
        for num in array {
            if let numPriority = dict[num] {
                output.append(numPriority)
            }
        }
        return output
    }
    
}
