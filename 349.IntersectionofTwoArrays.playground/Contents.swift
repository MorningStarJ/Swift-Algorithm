import Foundation

//Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must be unique and you may return the result in any order.
//
//
//
//Example 1:
//
//Input: nums1 = [1,2,2,1], nums2 = [2,2]
//Output: [2]
//Example 2:
//
//Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
//Output: [9,4]
//Explanation: [4,9] is also accepted.
//

//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/intersection-of-two-arrays
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let numberSet = Set(nums1)
        var resultSet: Set<Int> = []
        for number in nums2 {
            if numberSet.contains(number) {
                resultSet.insert(number)
            }
        }
        return Array(resultSet)
    }
}

print(Solution().intersection([1,2,2,1], [2, 2]))
