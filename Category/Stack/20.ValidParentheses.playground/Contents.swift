import Foundation

//Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
//
//An input string is valid if:
//
//Open brackets must be closed by the same type of brackets.
//Open brackets must be closed in the correct order.
//
//
//Example 1:
//
//Input: s = "()"
//Output: true
//Example 2:
//
//Input: s = "()[]{}"
//Output: true
//Example 3:
//
//Input: s = "(]"
//Output: false
//Example 4:
//
//Input: s = "([)]"
//Output: false
//Example 5:
//
//Input: s = "{[]}"
//Output: true
//
//
//ConstraStrings:
//
//1 <= s.length <= 104
//s consists of parentheses only '()[]{}'.
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/valid-parentheses
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
class Solution {
    func isValid(_ s: String) -> Bool {
        let stack = Stack()
        for char in s {
            switch String(char) {
            case "{":
                stack.push("}")
            case "(":
                stack.push(")")
            case "[":
                stack.push("]")
            case stack.top():
                stack.pop()
            default:
                if stack.empty() || stack.top() != String(char) {
                    return false
                }
            }
        }
        return stack.empty()
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
