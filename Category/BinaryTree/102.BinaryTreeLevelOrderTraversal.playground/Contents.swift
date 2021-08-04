import Foundation

//Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).
//
//
//
//Example 1:
//
//
//Input: root = [3,9,20,null,null,15,7]
//Output: [[3],[9,20],[15,7]]
//Example 2:
//
//Input: root = [1]
//Output: [[1]]
//Example 3:
//
//Input: root = []
//Output: []
//
//
//Constraints:
//
//The number of nodes in the tree is in the range [0, 2000].
//-1000 <= Node.val <= 1000
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/binary-tree-level-order-traversal
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        let queue = MyQueue<TreeNode>()
        guard let node = root else { return [] }
        queue.push(node)
        var result: [[Int]] = []
        while queue.empty() == false {
            let count = queue.size
            var array = [Int]()
            for _ in 0..<count {
                if let node = queue.pop() {
                    array.append(node.val)
                    
                    if let left = node.left {
                        queue.push(left)
                    }
                    
                    if let right = node.right {
                        queue.push(right)
                    }
                }
            }
            result.append(array)
        }
        
        return result
    }
}

class MyQueue<T> {
    var leftStack: [T] = []
    var rightStack: [T] = []
    /** Initialize your data structure here. */
    init() {
        
    }
    
    var size: Int {
        leftStack.count + rightStack.count
    }
    /** Push element x to the back of queue. */
    func push(_ x: T) {
        rightStack.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> T? {
        if leftStack.isEmpty {
            leftStack.append(contentsOf: rightStack.reversed())
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }
    
    /** Get the front element. */
    func peek() -> T? {
        leftStack.isEmpty ? rightStack.first : leftStack.last
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        leftStack.isEmpty && rightStack.isEmpty
    }
}
