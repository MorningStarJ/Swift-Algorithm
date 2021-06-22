import Foundation

//Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.
//
//
//Example 1:
//
//Input: nums = [-4,-1,0,3,10]
//Output: [0,1,9,16,100]
//Explanation: After squaring, the array becomes [16,1,0,9,100].
//After sorting, it becomes [0,1,9,16,100].
//Example 2:
//
//Input: nums = [-7,-3,2,3,11]
//Output: [4,9,9,49,121]
//
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/squares-of-a-sorted-array
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

class Solution {
    // brute-force algorithm
//    func sortedSquares(_ nums: [Int]) -> [Int] {
//        nums.map { $0 * $0 }
//            .sorted()
//    }
    // two pointers
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var result: [Int] = []
        var lowerBound = 0
        var upperBound = nums.count - 1
        while upperBound - lowerBound >= 0 {
            let lowerNumber = nums[lowerBound] * nums[lowerBound]
            let upperNumber = nums[upperBound] * nums[upperBound]
            if lowerNumber < upperNumber {
                result.insert(upperNumber, at: 0)
                upperBound -= 1
            } else {
                result.insert(lowerNumber, at: 0)
                lowerBound += 1
            }
        }
        return result
    }
}

print(Solution().sortedSquares([-4,-1,0,3,10]))
print(Solution().sortedSquares([-7,-3,2,3,11]))

