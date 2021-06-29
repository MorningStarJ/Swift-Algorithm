import Foundation
//
//142. Linked List Cycle II
//Given a linked list, return the node where the cycle begins. If there is no cycle, return null.
//
//There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to. Note that pos is not passed as a parameter.
//
//Notice that you should not modify the linked list.
//
//
//
//Example 1:
//
//
//Input: head = [3,2,0,-4], pos = 1
//Output: tail connects to node index 1
//Explanation: There is a cycle in the linked list, where tail connects to the second node.
//Example 2:
//
//
//Input: head = [1,2], pos = 0
//Output: tail connects to node index 0
//Explanation: There is a cycle in the linked list, where tail connects to the first node.
//Example 3:
//
//
//Input: head = [1], pos = -1
//Output: no cycle
//Explanation: There is no cycle in the linked list.
//
//
//Constraints:
//
//The number of the nodes in the list is in the range [0, 104].
//-105 <= Node.val <= 105
//pos is -1 or a valid index in the linked-list.
//
//
//Follow up: Can you solve it using O(1) (i.e. constant) memory?
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int = 0,
                next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        var current = self
        var string = "\(current.val)"
        while let nextNode = current.next {
            string += "\(nextNode.val)"
            current = nextNode
        }
        return string
    }
}

class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var fast = head
        var slow = head
        while fast != nil, fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast {  // 如果相遇，就是有环
                var index1 = fast
                var index2 = head
                while index1 !== index2 {
                    index1 = index1?.next
                    index2 = index2?.next
                }
                return index2
            }
        }
        return nil
    }
}
let node1 = ListNode(3)
let node2 = ListNode(2)
let node3 = ListNode(0)
let node4 = ListNode(-4)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node2
print(Solution().detectCycle(node1))
