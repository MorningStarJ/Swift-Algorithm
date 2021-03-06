import Foundation
//Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
//
//You may assume that each input would have exactly one solution, and you may not use the same element twice.
//
//You can return the answer in any order.
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/two-sum
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var record: [Int: Int] = [:]
        for (index, number) in nums.enumerated() {
            let difference = target - number
            if let differenceIndex = record[difference] {
                return [differenceIndex, index]
            } else {
                record[number] = index
            }
        }
        return []
    }
}
