import Foundation

var greeting = "Hello, playground"
//24. Swap Nodes in Pairs
//Given a linked list, swap every two adjacent nodes and return its head. You must solve the problem without modifying the values in the list's nodes (i.e., only nodes themselves may be changed.)
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
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let fakeHead = ListNode()
        fakeHead.next = head
        var current: ListNode? = fakeHead
        while let nextNode = current?.next,
              let nextOfNextNodel = current?.next?.next {
            let third = current?.next?.next?.next
            current?.next = nextOfNextNodel
            current?.next?.next = nextNode
            current?.next?.next?.next = third
            
            current = current?.next?.next
        }
        return fakeHead.next
    }
}

print(Solution().swapPairs(ListNode(1, next: ListNode(2, next: ListNode(3, next: ListNode(4, next: nil))))))
