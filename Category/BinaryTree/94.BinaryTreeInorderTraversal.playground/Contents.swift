import Foundation

//94. Binary Tree Inorder Traversal
//Given the root of a binary tree, return the inorder traversal of its nodes' values.
//
//
//
//Example 1:
//
//
//Input: root = [1,null,2,3]
//Output: [1,3,2]
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
//Output: [1,2]
//
//
//Constraints:
//
//The number of nodes in the tree is in the range [0, 100].
//-100 <= Node.val <= 100
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

class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        traverseInOrder(current: root) { value in
            result.append(value)
        }
        return result
    }
    
    public func traverseInOrder(current: TreeNode?, visit: (Int) -> Void) {
        guard let cur = current else { return }
        
        traverseInOrder(current: cur.left, visit: visit)
        visit(cur.val)
        traverseInOrder(current: cur.right, visit: visit)
    }
}
