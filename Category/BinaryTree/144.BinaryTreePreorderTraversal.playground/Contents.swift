import Foundation

//Given the root of a binary tree, return the preorder traversal of its nodes' values.
//
//
//
//Example 1:
//
//
//Input: root = [1,null,2,3]
//Output: [1,2,3]
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
//Output: [1,2]
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
//
//
//Follow up: Recursive solution is trivial, could you do it iteratively?
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/binary-tree-preorder-traversal
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
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
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        traversePreOrder(current: root) { value in
            result.append(value)
        }
        return result
    }
    
    public func traversePreOrder(current: TreeNode?, visit: (Int) -> Void) {
        guard let cur = current else { return }
        visit(cur.val)
        traversePreOrder(current: cur.left, visit: visit)
        traversePreOrder(current: cur.right, visit: visit)
        
    }
}
