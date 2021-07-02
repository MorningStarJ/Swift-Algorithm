import Foundation

//541. Reverse String II
//Given a string s and an integer k, reverse the first k characters for every 2k characters counting from the start of the string.
//
//If there are fewer than k characters left, reverse all of them. If there are less than 2k but greater than or equal to k characters, then reverse the first k characters and left the other as original.
//
//
//
//Example 1:
//
//Input: s = "abcdefg", k = 2
//Output: "bacdfeg"
//Example 2:
//
//Input: s = "abcd", k = 2
//Output: "bacd"
//
class Solution {
    func reverse(_ s: inout [Character], start: Int, end: Int) {
        var lower = start
        var upper = end
        while lower < upper {
            s.swapAt(lower, upper)
            
            lower += 1
            upper -= 1
        }
    }
    
    func reverseStr(_ s: String, _ k: Int) -> String {
        var lowerBound = 0
        let upperBound = s.count
        var string = Array(s)
        while lowerBound < upperBound {
            if lowerBound + k <= upperBound {
                reverse(&string, start: lowerBound, end: lowerBound + k - 1)
                lowerBound += 2 * k
                continue
            }
            
            reverse(&string, start: lowerBound, end: upperBound - 1)
            break
        }
        return String(string)
    }
}

print(Solution().reverseStr("a", 2))
