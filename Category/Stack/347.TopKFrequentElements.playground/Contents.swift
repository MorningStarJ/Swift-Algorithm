import Foundation


//Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.
//
//
//
//Example 1:
//
//Input: nums = [1,1,1,2,2,3], k = 2
//Output: [1,2]
//Example 2:
//
//Input: nums = [1], k = 1
//Output: [1]
//
//
//Constraints:
//
//1 <= nums.length <= 105
//k is in the range [1, the number of unique elements in the array].
//It is guaranteed that the answer is unique.
//
//
//Follow up: Your algorithm's time complexity must be better than O(n log n), where n is the array's size.
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/top-k-frequent-elements
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
//class Solution {
//    class Comparison {
//        func compareOperator(lhs: (Int, Int), rhs: (Int, Int)) -> Bool {
//            lhs.1 > rhs.1
//        }
//        
//    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
//        
//        var map: [Int: Int] = [:]
//        for index in 0..<nums.count {
//            if let value = map[nums[index]] {
//                map[nums[index]] = value + 1
//            } else {
//            map[nums[index]] = 1
//            }
//        }
//        var pri_que: [Int] = []
//        var result = MyQueue<([Int], (key: Int, value: Int))>()
//        for (key, value) in map {
//            result.push((pri_que, (key, value)))
//            if pri_que.count > k {
//                result.pop()
//            }
//        }
//        
//        
////
////        var entries = Set<[Int: Int]>()
//        
//        
//    }
//}
//    class MyQueue<V> {
//        var leftStack: [V] = []
//        var rightStack: [V] = []
//        /** Initialize your data structure here. */
//        init() {
//
//        }
//        
//        /** Push element x to the back of queue. */
//        func push(_ x: V) {
//            rightStack.append(x)
//        }
//        
//        /** Removes the element from in front of queue and returns that element. */
//        func pop() -> V? {
//            if leftStack.isEmpty {
//                leftStack.append(contentsOf: rightStack.reversed())
//                rightStack.removeAll()
//            }
//            return leftStack.popLast()
//        }
//        
//        /** Get the front element. */
//        func peek() -> V? {
//            leftStack.isEmpty ? rightStack.first : leftStack.last
//        }
//        
//        /** Returns whether the queue is empty. */
//        func empty() -> Bool {
//            leftStack.isEmpty && rightStack.isEmpty
//        }
//    }
