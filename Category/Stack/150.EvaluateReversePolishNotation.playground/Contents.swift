import Foundation

//150. Evaluate Reverse Polish Notation
//Evaluate the value of an arithmetic expression in Reverse Polish Notation.
//
//Valid operators are +, -, *, and /. Each operand may be an integer or another expression.
//
//Note that division between two integers should truncate toward zero.
//
//It is guaranteed that the given RPN expression is always valid. That means the expression would always evaluate to a result, and there will not be any division by zero operation.
//
//Example 1:
//
//Input: tokens = ["2","1","+","3","*"]
//Output: 9
//Explanation: ((2 + 1) * 3) = 9
//Example 2:
//
//Input: tokens = ["4","13","5","/","+"]
//Output: 6
//Explanation: (4 + (13 / 5)) = 6
//Example 3:
//
//Input: tokens = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
//Output: 22
//Explanation: ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
//= ((10 * (6 / (12 * -11))) + 17) + 5
//= ((10 * (6 / -132)) + 17) + 5
//= ((10 * 0) + 17) + 5
//= (0 + 17) + 5
//= 17 + 5
//= 22
//
//
//Constraints:
//
//1 <= tokens.length <= 104
//tokens[i] is either an operator: "+", "-", "*", or "/", or an integer in the range [-200, 200].
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/evaluate-reverse-polish-notation
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        let stack = Stack()
        for express in tokens {
            switch express {
            case "+":
                if let right = stack.pop(),
                   let left = stack.pop() {
                    stack.push(left + right)
                }
            case "-":
                if let right = stack.pop(),
                   let left = stack.pop() {
                    stack.push(left - right)
                }
            case "*":
                if let right = stack.pop(),
                   let left = stack.pop() {
                    stack.push(left * right)
                }
            case "/":
                if let right = stack.pop(),
                   let left = stack.pop() {
                    stack.push(left / right)
                }
            default:
                guard let intValue = Int(express) else { continue }
                stack.push(intValue)
            }
        }
        
        return stack.top() ?? 0
    }
}

class Stack {
    
    var array: [Int] = []

    /** Push element x onto stack. */
    func push(_ x: Int) {
        array.append(x)
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int? {
        array.popLast()
    }
    
    /** Get the top element. */
    func top() -> Int? {
        array.last
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        array.isEmpty
    }
}
