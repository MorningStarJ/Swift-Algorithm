import Foundation

//Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.
//
//Notice that the solution set must not contain duplicate triplets.
//Input: nums = [-1,0,1,2,-1,-4]
//Output: [[-1,-1,2],[-1,0,1]]
//Example 2:
//
//Input: nums = []
//Output: []
//Example 3:
//
//Input: nums = [0]
//Output: []
//
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/3sum
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        let sortedNums = nums.sorted()
        for (index, number) in sortedNums.enumerated() {
            if number > 0 {
                return result
            }
            if index > 0,
               number == sortedNums[index - 1] {
               continue
            }
            var left = index + 1
            var right = sortedNums.count - 1
            while right > left {
                if number + sortedNums[left] + sortedNums[right] > 0 {
                    right -= 1
                } else if number + sortedNums[left] + sortedNums[right] < 0 {
                    left += 1
                } else {
                    result.append([number, sortedNums[left], sortedNums[right]])
                    while right > left, sortedNums[right] == sortedNums[right - 1] {
                        right -= 1
                    }
                    
                    while right > left, sortedNums[left] == sortedNums[left + 1] {
                        left += 1
                    }
                    
                    right -= 1
                    left += 1
                }
            }
        }
        return result
    }
}
