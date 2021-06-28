import Foundation

//Write an algorithm to determine if a number n is happy.
//
//A happy number is a number defined by the following process:
//
//Starting with any positive integer, replace the number by the sum of the squares of its digits.
//Repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1.
//Those numbers for which this process ends in 1 are happy.
//Return true if n is a happy number, and false if not.
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/happy-number
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

class Solution {
    func isHappy(_ n: Int) -> Bool {
        var n = n
        var set: Set<Int> = []
        while true {
            let sum = getSum(n: n)
            if sum == 1 {
                return true
            }
            
            if set.contains(sum) {
                return false
            } else {
                set.insert(sum)
            }
            n = sum
        }
    }
    
    func getSum(n: Int) -> Int {
        var sum = 0
        var n = n
        while n > 0 {
            sum += (n % 10) * (n % 10)
            n /= 10
        }
        return sum
    }
}
