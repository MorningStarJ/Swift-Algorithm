import Foundation

//239. Sliding Window Maximum
//You are given an array of integers nums, there is a sliding window of size k which is moving from the very left of the array to the very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position.
//
//Return the max sliding window.
//
//
//
//Example 1:
//
//Input: nums = [1,3,-1,-3,5,3,6,7], k = 3
//Output: [3,3,5,5,6,7]
//Explanation:
//Window position                Max
//---------------               -----
//[1  3  -1] -3  5  3  6  7       3
// 1 [3  -1  -3] 5  3  6  7       3
// 1  3 [-1  -3  5] 3  6  7       5
// 1  3  -1 [-3  5  3] 6  7       5
// 1  3  -1  -3 [5  3  6] 7       6
// 1  3  -1  -3  5 [3  6  7]      7
//Example 2:
//
//Input: nums = [1], k = 1
//Output: [1]
//Example 3:
//
//Input: nums = [1,-1], k = 1
//Output: [1,-1]
//Example 4:
//
//Input: nums = [9,11], k = 2
//Output: [11]
//Example 5:
//
//Input: nums = [4,-2], k = 2
//Output: [4]
//
//
//Constraints:
//
//1 <= nums.length <= 105
//-104 <= nums[i] <= 104
//1 <= k <= nums.length

class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        let queue = Queue()
        var result: [Int] = []
        for index in 0..<k {
            queue.push(nums[index])
        }
        result.append(queue.max())
        for index in k..<nums.count {
            queue.pop(nums[index - k])
            queue.push(nums[index])
            result.append(queue.max())
        }
        return result
    }
}

class Queue {
    var queue: MyQueue = MyQueue()
    
    func pop(_ value: Int) {
        //弹出元素时，比较当前要弹出的数值是否等于队列出口的数值，如果相等则弹出
        //同时判断队列当前是否为空
        if queue.empty() == false,
           value == queue.peek() {
            queue.pop()
        }
    }
    // 如果push的数值大于入口元素的数值，那么就将队列后端的数值弹出，直到push的数值小于等于队列入口元素的数值为止。
    // 这样就保持了队列里的数值是单调从大到小的了。
    func push(_ value: Int) {
        while queue.empty() == false, value > queue.last() {
            queue.popLast()
        }
        queue.push(value)
    }
    
    func max() -> Int {
        queue.peek()
    }
}

class MyQueue {
    var leftStack: [Int] = []
    var rightStack: [Int] = []
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        rightStack.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        if leftStack.isEmpty {
            leftStack.append(contentsOf: rightStack.reversed())
            rightStack.removeAll()
        }
        return leftStack.popLast() ?? -1
    }
    
    func popLast() -> Int {
        if rightStack.isEmpty {
            return leftStack.removeFirst()
        }
        return rightStack.popLast() ?? -1
    }
    /** Get the front element. */
    func peek() -> Int {
        leftStack.isEmpty ? rightStack.first ?? -1 : leftStack.last ?? -1
    }
    
    func last() -> Int {
        rightStack.isEmpty ? leftStack.first ?? -1 : rightStack.last ?? -1
    }
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        leftStack.isEmpty && rightStack.isEmpty
    }
}
