import Foundation

//Implement a first in first out (FIFO) queue using only two stacks. The implemented queue should support all the functions of a normal queue (push, peek, pop, and empty).
//
//Implement the MyQueue class:
//
//void push(int x) Pushes element x to the back of the queue.
//int pop() Removes the element from the front of the queue and returns it.
//int peek() Returns the element at the front of the queue.
//boolean empty() Returns true if the queue is empty, false otherwise.
//Notes:
//
//You must use only standard operations of a stack, which means only push to top, peek/pop from top, size, and is empty operations are valid.
//Depending on your language, the stack may not be supported natively. You may simulate a stack using a list or deque (double-ended queue) as long as you use only a stack's standard operations.
//Follow-up: Can you implement the queue such that each operation is amortized O(1) time complexity? In other words, performing n operations will take overall O(n) time even if one of those operations may take longer.
//
//
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/implement-queue-using-stacks
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
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
    
    /** Get the front element. */
    func peek() -> Int {
        leftStack.isEmpty ? rightStack.first ?? -1 : leftStack.last ?? -1
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        leftStack.isEmpty && rightStack.isEmpty
    }
}
