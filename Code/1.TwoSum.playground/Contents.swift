import Foundation
//1. Two Sum #
//
//Given an array of integers, return indices of the two numbers such that they add up to a specific target.
//
//You may assume that each input would have exactly one solution, and you may not use the same element twice.
//

//Given nums = [2, 7, 11, 15], target = 9,
//
//Because nums[0] + nums[1] = 2 + 7 = 9,
//return [0, 1]
let nums = [2, 11, 15, 7]
let target = 9

var store: [Int: Int] = [:]
func twoSumIndex(nums: [Int], target: Int) -> (Int, Int)? {
    for (index, num) in nums.enumerated() {
        let another = target - num
        if let anotherValue = store[another] {
            return (index, anotherValue)
        } else {
            store[num] = index
        }
    }
    return nil
}

print(twoSumIndex(nums: nums, target: target))
