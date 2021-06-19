import Foundation


//    . Median of Two Sorted Arrays
//    Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.
//
//    The overall run time complexity should be O(log (m+n)).
//Example 1:
//
//Input: nums1 = [1,3], nums2 = [2]
//Output: 2.00000
//Explanation: merged array = [1,2,3] and median is 2.
//Example 2:
//
//Input: nums1 = [1,2], nums2 = [3,4]
//Output: 2.50000
//Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.
//Example 3:
//
//Input: nums1 = [0,0], nums2 = [0,0]
//Output: 0.00000
//Example 4:
//
//Input: nums1 = [], nums2 = [1]
//Output: 1.00000
//Example 5:
//
//Input: nums1 = [2], nums2 = []
//Output: 2.00000
//
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/median-of-two-sorted-arrays
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    if nums1.count > nums2.count {
        return findMedian(nums1: nums2, nums2: nums1)
    }
    var low = 0
    var high = nums1.count
    let k = (nums1.count + nums2.count + 1) / 2
    var nums1Mid = 0
    var nums2Mid = 0
    
    while low <= high {
        // nums1:  ……………… nums1[nums1Mid-1] | nums1[nums1Mid] ……………………
        // nums2:  ……………… nums2[nums2Mid-1] | nums2[nums2Mid] ……………………
        nums1Mid = low + (high - low) / 2
        nums2Mid = k - nums1Mid
        if nums1Mid > 0, nums1[nums1Mid - 1] > nums2[nums2Mid] {
            high = nums1Mid - 1
        } else if nums1Mid != nums1.count, nums1[nums1Mid] < nums2[nums2Mid - 1] {
            low = nums1Mid + 1
        } else {
            break
        }
    }
    
    var midLeft = 0
    var midRight = 0
    if nums1Mid == 0 {
        midLeft = nums2[nums2Mid - 1]
    } else if nums2Mid == 0 {
        midLeft = nums1[nums1Mid - 1]
    } else {
        midLeft = max(nums1[nums1Mid - 1], nums2[nums2Mid - 1])
    }
    
    if (nums1.count + nums2.count) & 1 == 1 {
        return Double(midLeft)
    }
    if nums1Mid == nums1.count {
        midRight = nums2[nums2Mid]
    } else if nums2Mid == nums2.count {
        midRight = nums1[nums1Mid]
    } else {
        midRight = min(nums1[nums1Mid], nums2[nums2Mid])
    }
    return Double(midLeft + midRight) / 2
}
