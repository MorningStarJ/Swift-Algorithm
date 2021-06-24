import Foundation

//203. Remove Linked List Elements
//Given the head of a linked list and an integer val, remove all the nodes of the linked list that has Node.val == val, and return the new head.
//
//
//
//Example 1:
//
//
//Input: head = [1,2,6,3,4,5,6], val = 6
//Output: [1,2,3,4,5]
//Example 2:
//
//Input: head = [], val = 1
//Output: []
//Example 3:
//
//Input: head = [7,7,7,7], val = 7
//Output: []
//
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/remove-linked-list-elements
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

public class Node {
    public var value: Int
    public var next: Node?
    public init(value: Int, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        var current = self
        var stringValue = "\(current.value)"
        while let nextNode = current.next {
            stringValue += "\(nextNode.value)"
            current = nextNode
        }
        return stringValue
    }
}

class Solution {
    func removeElements(_ head: Node?, _ val: Int) -> Node? {
        let fakeHead: Node? = Node(value: 0)
        fakeHead?.next = head
        var current = fakeHead
        while current?.next != nil {
            if current?.next?.value == val {
                current?.next = current?.next?.next
            } else {
                current = current?.next
            }
        }
        return fakeHead?.next
    }
}
let node1 = Node(value: 1)
let node2 = Node(value: 4)
let node3 = Node(value: 2)
let node4 = Node(value: 4)
node1.next = node2
node2.next = node3
node3.next = node4
print(Solution().removeElements(node1, 4))
