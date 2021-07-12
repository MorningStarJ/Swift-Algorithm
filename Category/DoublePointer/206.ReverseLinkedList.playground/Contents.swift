import Foundation

//206. Reverse Linked List
//Given the head of a singly linked list, reverse the list, and return the reversed list.

public class ListNode {
    public var val: Int
    public var pre: ListNode?
    public var next: ListNode?
    public init(_ val: Int = 0,
                next: ListNode? = nil,
                pre: ListNode? = nil) {
        self.val = val
        self.pre = next
        self.next = next
    }
}

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        reverseNode(pre: nil, cur: head)
    }
    
    func reverseNode(pre: ListNode?, cur: ListNode?) -> ListNode? {
        guard let current = cur else { return pre }
        let next = current.next
        current.next = pre
        return reverseNode(pre: cur, cur: next)
    }
}
