import Foundation

//145. Binary Tree Postorder Traversal
//Given the root of a binary tree, return the postorder traversal of its nodes' values.
//
// 
//
//Example 1:
//
//
//Input: root = [1,null,2,3]
//Output: [3,2,1]
//Example 2:
//
//Input: root = []
//Output: []
//Example 3:
//
//Input: root = [1]
//Output: [1]
//Example 4:
//
//
//Input: root = [1,2]
//Output: [2,1]
//Example 5:
//
//
//Input: root = [1,null,2]
//Output: [2,1]
// 
//
//Constraints:
//
//The number of the nodes in the tree is in the range [0, 100].
//-100 <= Node.val <= 100
// 
//
//Follow up: Recursive solution is trivial, could you do it iteratively?
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int = 0,
                _ left: TreeNode? = nil,
                _ right: TreeNode? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}

//class Solution {
//    func postorderTraversal(_ root: TreeNode?) -> [Int] {
//        var result: [Int] = []
//        traversePostOrder(current: root) { value in
//            result.append(value)
//        }
//        return result
//    }
//
//    public func traversePostOrder(current: TreeNode?, visit: (Int) -> Void) {
//        guard let cur = current else { return }
//
//        traversePostOrder(current: cur.left, visit: visit)
//        traversePostOrder(current: cur.right, visit: visit)
//        visit(cur.val)
//    }
//}

class Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        let stack = MyStack<TreeNode>()
        var result: [Int] = []
        guard let node = root else { return result }
        stack.push(node)
        while !stack.empty() {
            
            guard let topNode = stack.pop() else {
                break
            }
            result.append(topNode.val)
            
            
            if let leftNode = topNode.left {
                stack.push(leftNode)
            }
            
            if let rightNode = topNode.right {
                stack.push(rightNode)
            }
        }
        
        
        return result.reversed()
    }
}

class MyStack<T> {
    
    var array: [T] = []

    /** Initialize your data structure here. */
    init() {

    }
    
    /** Push element x onto stack. */
    func push(_ x: T) {
        array.append(x)
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> T? {
        array.popLast()
    }
    
    /** Get the top element. */
    func top() -> T? {
        array.last
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        array.isEmpty
    }
}


