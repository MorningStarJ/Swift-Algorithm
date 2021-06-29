import Foundation

//Given the head of a linked list, remove the nth node from the end of the list and return its head.
//
//
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list
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

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let fakeHead: ListNode? = ListNode()
        fakeHead?.next = head
        var lower = fakeHead
        var upper = fakeHead
        var countdown = n + 1
        // 先走n+1步，假设10个，要删除倒数第二个，当 lower 是8 的时候，upper 是11，但只有10个，则upper是nil，要删除倒数第2个也就是删除9，此时lower是9的上一个
        while countdown > 0 {
            upper = upper?.next
            countdown -= 1
        }
        while upper != nil {
            lower = lower?.next
            upper = upper?.next
        }
        let next = lower?.next?.next
        lower?.next = next
        return fakeHead?.next
    }
}
print(Solution().removeNthFromEnd(ListNode(1, next: ListNode(2, next: ListNode(3, next: ListNode(4, next: ListNode(5, next: nil))))), 2))

