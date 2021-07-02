import Foundation

//151. Reverse Words in a String
//Given an input string s, reverse the order of the words.
//
//A word is defined as a sequence of non-space characters. The words in s will be separated by at least one space.
//
//Return a string of the words in reverse order concatenated by a single space.
//
//Note that s may contain leading or trailing spaces or multiple spaces between two words. The returned string should only have a single space separating the words. Do not include any extra spaces.

//Example 1:
//
//Input: s = "the sky is blue"
//Output: "blue is sky the"
//Example 2:
//
//Input: s = "  hello world  "
//Output: "world hello"
//Explanation: Your reversed string should not contain leading or trailing spaces.
//Example 3:
//
//Input: s = "a good   example"
//Output: "example good a"
//Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.
//Example 4:
//
//Input: s = "  Bob    Loves  Alice   "
//Output: "Alice Loves Bob"
//Example 5:
//
//Input: s = "Alice does not even like bob"
//Output: "bob like even not does Alice"
//
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/reverse-words-in-a-string
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
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
    
    func removeExtraSpace(string: String) -> [Character] {
        let s = Array(string)
//        var slow = 0
        var fast = 0
        // 去开头
        while s.count > 0, fast < s.count, s[fast] == " " {
            fast += 1
        }
        var result: [Character] = []
        for index in fast..<s.count {
            // 去掉中间冗余空格
            if index - 1 > 0,
               s[index - 1] == s[index],
               s[index] == " " {
                continue
            } else {
//                s[slow] = s[index]
                result.append(s[index])
//                slow += 1
            }
        }
        while result.last == " " {
            result.removeLast()
        }
        // 去末尾
        print(result)
        return result
    }
    
    func reverseWords(_ s: String) -> String {
        var value = removeExtraSpace(string: s)
        reverse(&value, start: 0, end: value.count - 1)
        var start = 0// 反转的单词在字符串里起始位置
        var end = 0// 反转的单词在字符串里终止位置
        var entry = false// 标记枚举字符串的过程中是否已经进入了单词区间
        for index in 0..<value.count {
            if entry == false {
                start = index
                entry = true
            }
            // 单词后面有空格的情况，空格就是分词符
            if entry,
               value[index] == " ",
               value[index - 1] != " " {
                end = index - 1
                entry = false
                reverse(&value, start: start, end: end)
            }
            
            // 最后一个结尾单词之后没有空格的情况
            if entry,
               index == value.count - 1,
               value[index] != " " {
                end = index
                entry = false
                reverse(&value, start: start, end: end)
            }
        }
        return String(value)
    }
}

print(Solution().reverseWords("the sky is blue"))
