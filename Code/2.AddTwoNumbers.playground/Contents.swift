import Foundation

//You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
//
//You may assume the two numbers do not contain any leading zero, except the number 0 itself.
//
//Example:
//
//
//Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
//Output: 7 -> 0 -> 8
//Explanation: 342 + 465 = 807.
//题目大意 #
//
//2 个逆序的链表，要求从低位开始相加，得出结果也逆序输出，返回值是逆序结果链表的头结点。
public class ListNode {
    public var value: Int
    public var next: ListNode?
    public init(value: Int = 0, next: ListNode? = nil) {
        self.value = value
        self.next = next
    }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        var current = self
        var value = "\(current.value)"
        while let nextValue = current.next {
            value += "\(nextValue.value)"
            current = nextValue
        }
        return value
    }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var leftNode = l1
    var rightNode = l2
    var carry = 0
    let fakeHead: ListNode? = ListNode()
    var current = fakeHead
    
    while (leftNode != nil ||
            rightNode != nil ||
            carry != 0)
    {
        let sum = (leftNode?.value ?? 0) + (rightNode?.value ?? 0)
        current?.next = ListNode(value: (sum + carry) % 10)
        current = current?.next
        carry = (sum + carry) / 10
        leftNode = leftNode?.next
        rightNode = rightNode?.next
    }
    return fakeHead?.next
}


//let left = ListNode(value: 2, next: ListNode(value: 4, next: ListNode(value: 3)))
//let right = ListNode(value: 5, next: ListNode(value: 6, next: ListNode(value: 4)))
let left = ListNode(value: 0)
let right = ListNode(value: 7, next: ListNode(value: 3))

print(left, right)
print(addTwoNumbers(left, right))
