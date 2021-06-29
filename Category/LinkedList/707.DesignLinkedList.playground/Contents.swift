import Foundation
//Design your implementation of the linked list. You can choose to use a singly or doubly linked list.
//A node in a singly linked list should have two attributes: val and next. val is the value of the current node, and next is a pointer/reference to the next node.
//If you want to use the doubly linked list, you will need one more attribute prev to indicate the previous node in the linked list. Assume all nodes in the linked list are 0-indexed.
//
//Implement the MyLinkedList class:
//
//MyLinkedList() Initializes the MyLinkedList object.
//int get(int index) Get the value of the indexth node in the linked list. If the index is invalid, return -1.
//void addAtHead(int val) Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list.
//void addAtTail(int val) Append a node of value val as the last element of the linked list.
//void addAtIndex(int index, int val) Add a node of value val before the indexth node in the linked list. If index equals the length of the linked list, the node will be appended to the end of the linked list. If index is greater than the length, the node will not be inserted.
//void deleteAtIndex(int index) Delete the indexth node in the linked list, if the index is valid.
//
//
//Example 1:
//
//Input
//["MyLinkedList", "addAtHead", "addAtTail", "addAtIndex", "get", "deleteAtIndex", "get"]
//[[], [1], [3], [1, 2], [1], [1], [1]]
//Output
//[null, null, null, null, 2, null, 3]
//
//Explanation
//MyLinkedList myLinkedList = new MyLinkedList();
//myLinkedList.addAtHead(1);
//myLinkedList.addAtTail(3);
//myLinkedList.addAtIndex(1, 2);    // linked list becomes 1->2->3
//myLinkedList.get(1);              // return 2
//myLinkedList.deleteAtIndex(1);    // now the linked list is 1->3
//myLinkedList.get(1);              // return 3
//
//
//
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/design-linked-list
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

class LinkedNode {
    let val: Int
    var next: LinkedNode?
    init(_ val: Int, next: LinkedNode? = nil) {
        self.val = val
        self.next = next
    }
}

extension LinkedNode: CustomStringConvertible {
    var description: String {
        var current = self
        var string = "\(current.val)"
        while let nextNode = current.next {
            string += "\(nextNode.val)"
            current = nextNode
        }
        return string
    }
}

class MyLinkedList {

    var head: LinkedNode?

    /** Initialize your data structure here. */
    init() {
        head = nil
    }
    
    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> Int {
        guard index >= 0,
              var current = head else {
            return -1
        }
        
        if index == 0 {
            return current.val
        }
        var currentIndex = 0
        while let nextNode = current.next {
            currentIndex += 1
            if currentIndex == index {
                return nextNode.val
            }
            current = nextNode
        }
        return -1
    }
    
    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    func addAtHead(_ val: Int) {
        let node = LinkedNode(val)
        if let head = head {
            node.next = head
        }
        head = node
    }
    
    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: Int) {
        let node = LinkedNode(val)
        guard let head = head else {
            head = node
            return
        }
        var current = head
        while let nextValue = current.next {
            current = nextValue
        }
        current.next = node
    }
    
    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    func addAtIndex(_ index: Int, _ val: Int) {
        if index == 0 {
            addAtHead(val)
            return
        }
        let node = LinkedNode(val)
        var current = head
        var currentIndex = 1
        while let currentNode = current {
            if currentIndex == index {
                let preNext = currentNode.next
                node.next = preNext
                currentNode.next = node
                break
            }
            current = currentNode.next
            currentIndex += 1
        }
    }

    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int) {
        guard index >= 0 else { return }
        if index == 0 {
            head = head?.next
            return
        }
        var current = head
        var currentIndex = 0
        while currentIndex < index, let nextNode = current?.next {
            if currentIndex + 1 == index {
                current?.next = nextNode.next
                break
            }
            current = nextNode
            currentIndex += 1
        }
    }
}

/**
 * Your MyLinkedList object will be instantiated and called as such:
 * let obj = MyLinkedList()
 * let ret_1: Int = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index, val)
 * obj.deleteAtIndex(index)
 */
//let obj = MyLinkedList()
//print(obj.get(0), obj.get(2))
//obj.addAtHead(10)
//print(obj.head)
//obj.addAtHead(11)
//print(obj.head)
//obj.addAtTail(20)
//print(obj.head)
//obj.addAtTail(30)
//print(obj.head)
//obj.addAtIndex(0, 2)
//print(obj.head)
//obj.addAtIndex(2, 8)
//print(obj.head)
let obj = MyLinkedList()
obj.addAtHead(1)
obj.addAtTail(3)
print(obj.head)
obj.addAtIndex(1, 2)
print(obj.head)
print(obj.get(1))
obj.deleteAtIndex(0)
print(obj.head)
print(obj.get(0))
print(obj.head)
