import Foundation
//Given two strings s and t, return true if t is an anagram of s, and false otherwise.
//Follow up: What if the inputs contain Unicode characters? How would you adapt your solution to such a case?
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/valid-anagram
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
//print("z" - "a")
class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var record = Array(repeating: 0, count: 26)
        for charcter in s.unicodeScalars {
            let index = Int(charcter.value - 97)
            record[index] += 1
        }
        
        for charcter in t.unicodeScalars {
            let index = Int(charcter.value - 97)
            record[index] -= 1
        }
        
        return record.filter { $0 > 0 }.count == 0
    }
}

var startTime = CFAbsoluteTimeGetCurrent()
print(CFAbsoluteTimeGetCurrent() - startTime)
