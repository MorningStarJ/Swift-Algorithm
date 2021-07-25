import Foundation

//You are given a string s consisting of lowercase English letters. A duplicate removal consists of choosing two adjacent and equal letters and removing them.
//
//We repeatedly make duplicate removals on s until we no longer can.
//
//Return the final string after all such duplicate removals have been made. It can be proven that the answer is unique.
//
//
//
//Example 1:
//
//Input: s = "abbaca"
//Output: "ca"
//Explanation:
//For example, in "abbaca" we could remove "bb" since the letters are adjacent and equal, and this is the only possible move.  The result of this move is that the string is "aaca", of which only "aa" is possible, so the final string is "ca".
//Example 2:
//
//Input: s = "azxxzy"
//Output: "ay"
//
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/remove-all-adjacent-duplicates-in-string
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
class Solution {
    func removeDuplicates(_ s: String) -> String {
        let stack = Stack()
        for char in s {
            if stack.top() == String(char) {
                stack.pop()
            } else {
                stack.push(String(char))
            }
        }
        return stack.array.joined()
    }
}


class Stack {
    
    var array: [String] = []

    /** Push element x onto stack. */
    func push(_ x: String) {
        array.append(x)
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> String {
        array.popLast() ?? ""
    }
    
    /** Get the top element. */
    func top() -> String {
        array.last ?? ""
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        array.isEmpty
    }
}
