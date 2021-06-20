import Foundation

//Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.
//
//You must write an algorithm with O(log n) runtime complexity.
//
//
//
//Example 1:
//
//Input: nums = [-1,0,3,5,9,12], target = 9
//Output: 4
//Explanation: 9 exists in nums and its index is 4
//Example 2:
//
//Input: nums = [-1,0,3,5,9,12], target = 2
//Output: -1
//Explanation: 2 does not exist in nums so return -1
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/binary-search

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var lowerBound = 0
        var upperBound = nums.count
        while lowerBound < upperBound {
            let middle = lowerBound + (upperBound - lowerBound) / 2
            if nums[middle] == target {
                return middle
            } else if nums[middle] < target {
                lowerBound = middle + 1
            } else {
                upperBound = middle
            }
        }
        return -1
    }
}

print(Solution().search([-1,0,3,5,9,12], 2))

extension RandomAccessCollection where Element: Comparable {

    func binarySearch(for value: Element, in range: Range<Index>? = nil) -> Index? {
        let range = range ?? startIndex..<endIndex
        guard range.lowerBound < range.upperBound else {
            return nil
        }
        let size = distance(from: range.lowerBound, to: range.upperBound)
        let middle = index(range.lowerBound, offsetBy: size / 2)
        if self[middle] == value {
            return middle
        } else if self[middle] > value {
            return binarySearch(for: value, in: range.lowerBound..<middle)
        } else {
            return binarySearch(for: value, in: index(after: middle)..<range.upperBound)
        }
    }
}

print([-1,0,3,5,9,12].binarySearch(for: 3))
