import Foundation

//18. 4Sum
//Given an array nums of n integers, return an array of all the unique quadruplets [nums[a], nums[b], nums[c], nums[d]] such that:
//
//0 <= a, b, c, d < n
//a, b, c, and d are distinct.
//nums[a] + nums[b] + nums[c] + nums[d] == target
//You may return the answer in any order.


class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var result: [[Int]] = []
        let sortedNums = nums.sorted()
        for (index1, number1) in sortedNums.enumerated() {
            if index1 > 0, number1 == sortedNums[index1 - 1] {
                continue
            }
            
            for index2 in (index1 + 1)..<sortedNums.count {
                let number2 = sortedNums[index2]
                if index2 > index1 + 1, number2 == sortedNums[index2 - 1] {
                    continue
                }
                
                var left = index2 + 1
                var right = sortedNums.count - 1
                while right > left {
                    if number1 + number2 + sortedNums[left] + sortedNums[right] > target {
                        right -= 1
                    } else if number1 + number2 + sortedNums[left] + sortedNums[right] < target {
                        left += 1
                    } else {
                        result.append([number1, number2, sortedNums[left], sortedNums[right]])
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
        }
        return result
    }
}
print(Solution().fourSum([2,2,2,2,2], 8))
