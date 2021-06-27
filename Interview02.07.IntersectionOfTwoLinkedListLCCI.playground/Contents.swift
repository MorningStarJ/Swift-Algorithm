import Foundation

//Given two (singly) linked lists, determine if the two lists intersect. Return the inter­ secting node. Note that the intersection is defined based on reference, not value. That is, if the kth node of the first linked list is the exact same node (by reference) as the jth node of the second linked list, then they are intersecting.
//
//Example 1:
//
//Input: intersectVal = 8, listA = [4,1,8,4,5], listB = [5,0,1,8,4,5], skipA = 2, skipB = 3
//Output: Reference of the node with value = 8
//Input Explanation: The intersected node's value is 8 (note that this must not be 0 if the two lists intersect). From the head of A, it reads as [4,1,8,4,5]. From the head of B, it reads as [5,0,1,8,4,5]. There are 2 nodes before the intersected node in A; There are 3 nodes before the intersected node in B.
//Example 2:
//
//Input: intersectVal = 2, listA = [0,9,1,2,4], listB = [3,2,4], skipA = 3, skipB = 1
//Output: Reference of the node with value = 2
//Input Explanation: The intersected node's value is 2 (note that this must not be 0 if the two lists intersect). From the head of A, it reads as [0,9,1,2,4]. From the head of B, it reads as [3,2,4]. There are 3 nodes before the intersected node in A; There are 1 node before the intersected node in B.
//Example 3:
//
//Input: intersectVal = 0, listA = [2,6,4], listB = [1,5], skipA = 3, skipB = 2
//Output: null
//Input Explanation: From the head of A, it reads as [2,6,4]. From the head of B, it reads as [1,5]. Since the two lists do not intersect, intersectVal must be 0, while skipA and skipB can be arbitrary values.
//Explanation: The two lists do not intersect, so return null.
//Notes:
//
//If the two linked lists have no intersection at all, return null.
//The linked lists must retain their original structure after the function returns.
//You may assume there are no cycles anywhere in the entire linked structure.
//Your code should preferably run in O(n) time and use only O(1) memory.
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/intersection-of-two-linked-lists-lcci
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
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

// 是判断引用，不是判断值，如果引用相等，那么 两个链表从这一节点开始，长度应相同，因为是同一节点。所以找到长度差值，让长的节点移动到与短节点相同的位置，循环判断引用即可
class Solution {
    func getIntersectionNode(headA: ListNode?, headB: ListNode?) -> ListNode? {
        var currentA = headA
        var currentB = headB
        var headALength = 0
        var headBLength = 0
        while let current = currentA {
            currentA = current.next
            headALength += 1
        }
        
        while let current = currentB {
            currentB = current.next
            headBLength += 1
        }
    
        currentA = headA
        currentB = headB
        if headBLength > headALength {
            swap(&headALength, &headBLength)
            swap(&currentA, &currentB)
        }
        
        var gap =  headALength - headBLength
        while gap > 0 {
            currentA = currentA?.next
            gap -= 1
        }
        
        while let curA = currentA {
            if curA === currentB {
                return  curA
            }
            currentA = currentA?.next
            currentB = currentB?.next
        }
        return nil
    }
    
}
