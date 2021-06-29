import Foundation

//454. 4Sum II
//Given four integer arrays nums1, nums2, nums3, and nums4 all of length n, return the number of tuples (i, j, k, l) such that:
//
//0 <= i, j, k, l < n
//nums1[i] + nums2[j] + nums3[k] + nums4[l] == 0
//
//
//Example 1:
//
//Input: nums1 = [1,2], nums2 = [-2,-1], nums3 = [-1,2], nums4 = [0,2]
//Output: 2
//Explanation:
//The two tuples are:
//1. (0, 0, 0, 1) -> nums1[0] + nums2[0] + nums3[0] + nums4[1] = 1 + (-2) + (-1) + 2 = 0
//2. (1, 1, 0, 0) -> nums1[1] + nums2[1] + nums3[0] + nums4[0] = 2 + (-1) + (-1) + 0 = 0
//Example 2:
//
//Input: nums1 = [0], nums2 = [0], nums3 = [0], nums4 = [0]
//Output: 1

class Solution {
    func fourSumCount(_ nums1: [Int], _ nums2: [Int], _ nums3: [Int], _ nums4: [Int]) -> Int {
        var result: [Int: Int] = [:]
        for number1 in nums1 {
            for number2 in nums2 {
                if let value = result[number1 + number2] {
                    result[number1 + number2] = value + 1
                } else {
                    result[number1 + number2] = 1
                }
            }
        }
        var count = 0 // a + b + c + d = 0 出现次数
        
        for number3 in nums3 {
            for number4 in nums4 {
                if let value = result[0 - (number3 + number4)] {
                    count += value
                }
            }
        }
        return count
    }
}
