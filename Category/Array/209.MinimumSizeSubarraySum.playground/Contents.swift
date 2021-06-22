import Foundation

//Given an array of positive integers nums and a positive integer target, return the minimal length of a contiguous subarray [numsl, numsl+1, ..., numsr-1, numsr] of which the sum is greater than or equal to target. If there is no such subarray, return 0 instead.
//
//
//
//Example 1:
//
//Input: target = 7, nums = [2,3,1,2,4,3]
//Output: 2
//Explanation: The subarray [4,3] has the minimal length under the problem constraint.
//Example 2:
//
//Input: target = 4, nums = [1,4,4]
//Output: 1
//Example 3:
//
//Input: target = 11, nums = [1,1,1,1,1,1,1,1]
//Output: 0
//
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/minimum-size-subarray-sum
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var start = 0
        var sum = 0
        var length = nums.count + 1
        for (index, number) in nums.enumerated() {
            sum += number
            while sum >= target {
                length = min(length, index - start + 1)
                sum -= nums[start]
                start += 1
            }
        }
        
        if length == nums.count + 1 {
            return 0
        }
        
        return length
    }
}

print(Solution().minSubArrayLen(10, [1,1,1,1,1,1,1,1]))
print(Solution().minSubArrayLen(8, [1,1,1,1,1,1,1,1]))
